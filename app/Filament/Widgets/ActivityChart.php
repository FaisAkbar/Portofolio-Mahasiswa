<?php

namespace App\Filament\Widgets;

use App\Models\Khs;
use App\Models\Portfolio;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class ActivityChart extends ChartWidget
{
    use HasWidgetShield;
    
    protected static ?string $heading = 'Activity';

    protected static ?int $sort = 4;
    protected function getData(): array
    {
        $user = auth()->user();
        
        // Check the user's role
        $isMahasiswa = $user->hasRole('mahasiswa');
        
        // Set the default filter to the latest available year if no filter is provided
        if (is_null($this->filter)) {
            // Get the latest year from the Portfolio table
            $latestYearPortfolio = Portfolio::selectRaw('MAX(YEAR(' . ($isMahasiswa ? 'tanggal_kegiatan' : 'created_at') . ')) as year')
                ->value('year');
            
            // Set the default filter to the latest year
            $this->filter = (string)$latestYearPortfolio;
        }

        // Get the active filter value
        $activeFilter = $this->filter;
        $dateField = $isMahasiswa ? 'tanggal_kegiatan' : 'created_at';  // Determine the field to use for filtering

        // Get Portfolio records filtered by the selected year
        $portfolioQuery = Portfolio::whereYear($dateField, $activeFilter);

        if ($isMahasiswa) {
            $portfolioQuery->where('user_id', $user->id);
        }

        // Get the filtered Portfolio records
        $portfolioRecords = $portfolioQuery->get();

        // Group records by month (year-month format)
        $groupedRecords = $portfolioRecords->groupBy(function ($record) use ($dateField, $isMahasiswa) {
            // Use Carbon to parse tanggal_kegiatan or created_at
            $date = $isMahasiswa ? Carbon::parse($record->{$dateField}) : $record->{$dateField};
            return $date->format('Y-m');  // Group by month (e.g., 2025-05)
        });

        // Sort the grouped records by the month (keys)
        $sortedGroupedRecords = $groupedRecords->sortKeys();

        // Prepare the data for the chart
        // All months (from 01 to 12) even if there's no data
        $months = collect([
            '01' => 'Jan', '02' => 'Febr', '03' => 'Mar', '04' => 'Apr',
            '05' => 'May', '06' => 'Jun', '07' => 'Jul', '08' => 'Aug',
            '09' => 'Sep', '10' => 'Oct', '11' => 'Nov', '12' => 'Dec'
        ]);

        // Create the dataset by filling in missing months with 0 counts
        $monthLabels = [];
        $monthData = [];

        foreach ($months as $monthNumber => $monthName) {
            // Check if there is data for this month
            $monthKey = $activeFilter ? $activeFilter . '-' . $monthNumber : $monthNumber;

            // If data exists for this month, use the count, otherwise use 0
            $monthLabels[] = $monthName;
            $monthData[] = $sortedGroupedRecords->has($monthKey) ? $sortedGroupedRecords[$monthKey]->count() : 0;
        }

        return [
            'datasets' => [
                [
                    'label' => 'Month',
                    'data' => $monthData,
                ],
            ],
            'labels' => $monthLabels,  // Labels for each month (Jan, Feb, Mar, etc.)
        ];
    }


    protected function getFilters(): ?array
    {
        // Get the distinct years from Khs and Portfolio tables
        $khsYears = Khs::selectRaw('DISTINCT YEAR(created_at) as year')
            ->orderBy('year', 'desc') // Order years in descending order
            ->pluck('year')
            ->toArray();

        $portfolioYears = Portfolio::selectRaw('DISTINCT YEAR(created_at) as year')
            ->orderBy('year', 'desc') // Order years in descending order
            ->pluck('year')
            ->toArray();

        // Merge both years and ensure uniqueness
        $allYears = array_unique(array_merge($khsYears, $portfolioYears));

        // Add years dynamically to the filters
        $filters = [];
        foreach ($allYears as $year) {
            $filters[$year] = "$year";
        }

        return $filters;
    }



    protected function getType(): string
    {
        return 'line';
    }
    protected function getOptions(): array
    {
        return [
            'scales' => [
                'y' => [
                    'ticks' => [
                        'stepSize' => 1,
                    ],
                    'beginAtZero' => true, 
                ],
            ],
        ];
    }
}
