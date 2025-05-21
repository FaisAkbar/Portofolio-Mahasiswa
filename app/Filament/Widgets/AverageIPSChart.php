<?php

namespace App\Filament\Widgets;

use App\Models\Khs;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Support\RawJs;
use Filament\Widgets\ChartWidget;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Illuminate\Support\Facades\Log;

class AverageIPSChart extends ChartWidget
{
    use HasWidgetShield, InteractsWithPageFilters;

    protected static ?string $heading = "Average IPS";
    protected static ?int $sort = 8;
    protected int | string | array $columnSpan = 'full';

    protected function getData(): array
    {
        // Retrieve the filters from the request (if they exist)
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;

        // Get the logged-in user
        $user = auth()->user();

        // Start the query for KHS records
        $khsQuery = Khs::orderBy('semester', 'asc');

        // If the user has the 'prodi' role, apply filters for year_code and prodi_code
        if ($user->hasRole('prodi')) {
            // Apply the year_code filter if it exists
            if ($yearCode) {
                $khsQuery->whereHas('user', function ($query) use ($yearCode) {
                    $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
                });
            }

            // Apply the prodi_code filter if it exists
            if ($prodiCode) {
                $khsQuery->whereHas('user', function ($query) use ($prodiCode) {
                    $year = substr($prodiCode, 0, 2);  // Get the first 2 digits of prodiCode for year check
                    if ((int)$year >= 24) {
                        // If the year is 24 or above, the prodi code starts at position 6 (index 5)
                        $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                    } else {
                        // If the year is < 24, the prodi code starts at position 4 (index 3)
                        $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                    }
                });
            }
        }

        // Get the KHS records after applying the filters
        $khsRecords = $khsQuery->get();

        // Group KHS by semester and calculate the average IP for each semester
        $averages = $khsRecords->groupBy('semester')->map(function ($semesterRecords) {
            return $semesterRecords->avg('ip_semester');
        });

        // Define the labels (semesters)
        $labels = collect([1, 2, 3, 4, 5, 6]);

        // Prepare the data for each semester's average IP
        $data = $labels->map(fn($semester) => $averages->get($semester, 0));

        // Define the label for the chart
        $label = 'Average IP Semester';

        // Return the data for the chart
        return [
            'datasets' => [
                [
                    'label' => $label,
                    'data' => $data,
                ],
            ],
            'labels' => $labels,
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
    
    protected function getOptions(): array|RawJs|null
    {
        return [
            'scales' => [
                'y' => [
                    'min' => 0,
                    'max' => 4,
                    'beginAtZero' => true, 
                ],
            ],
        ];
    }
}