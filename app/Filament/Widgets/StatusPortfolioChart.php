<?php

namespace App\Filament\Widgets;

use App\Models\Portfolio;
use App\Models\User;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Widgets\ChartWidget;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Illuminate\Support\Facades\DB;

class StatusPortfolioChart extends ChartWidget
{
    use HasWidgetShield, InteractsWithPageFilters;

    protected static ?string $heading = 'Portfolio Status Distribution';
    protected int | string | array $columnSpan = 'full';

    protected static ?int $sort = 6;

    protected function getData(): array
    {
        // Get the logged-in user
        $user = auth()->user();

        // Retrieve the filters from the request (if they exist)
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;

        // Prepare the query for fetching the portfolio statuses
        $portfolioQuery = Portfolio::select('status', DB::raw('count(*) as total'))
            ->groupBy('status');

        // Apply the filters if the user is a mahasiswa
        if ($user->hasRole('mahasiswa')) {
            // Apply filters for mahasiswa role (user-specific portfolios)
            $portfolioQuery->where('user_id', $user->id);
        }

        // Apply the year_code filter if it exists
        if ($yearCode) {
            $portfolioQuery->whereHas('user', function ($query) use ($yearCode) {
                $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
            });
        }

        // Apply the prodi_code filter if it exists (for both mahasiswa and prodi)
        if ($prodiCode) {
            $portfolioQuery->whereHas('user', function ($query) use ($prodiCode) {
                $year = substr($prodiCode, 0, 2);  // Get the first 2 digits of prodiCode for year check

                // Determine the correct starting position for prodi code extraction based on the year
                if ((int)$year >= 24) {
                    // If the year is 24 or above, the prodi code starts at position 6 (index 5)
                    $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    // If the year is < 24, the prodi code starts at position 4 (index 3)
                    $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            });
        }

        // Fetch the portfolio statuses and group by status
        $portfolioStatuses = $portfolioQuery->get()->pluck('total', 'status')->toArray();

        // Prepare data for the pie chart
        $chartData = [];
        foreach ($portfolioStatuses as $status => $count) {
            $chartData[] = [
                'label' => ucfirst($status), // Capitalize the status for a more readable label
                'value' => $count,
            ];
        }

        return [
            'datasets' => [
                [
                    'data' => array_column($chartData, 'value'),
                    'backgroundColor' => ['#FF6384', '#36A2EB', '#FFCE56'], // Example colors for pie chart slices
                ],
            ],
            'labels' => array_column($chartData, 'label'),
        ];
    }

    // Define the chart type as 'pie'
    protected function getType(): string
    {
        return 'pie';
    }

    // Customizing the chart options
    protected function getOptions(): array
    {
        return [
            'responsive' => true,
            'plugins' => [
                'legend' => [
                    'position' => 'right',
                ],
                'tooltip' => [
                    'enabled' => true,
                ],
            ],
            'scales' => [
                // Disable scales for pie chart, as it doesn't need x or y axes
                'x' => ['display' => false], // Hide x-axis
                'y' => ['display' => false], // Hide y-axis
            ],
            'maintainAspectRatio' => false, // Allows customization of the size
            'width' => 500, // Adjust the width (in pixels)
            'height' => 500, // Adjust the height (in pixels)
        ];
    }
}