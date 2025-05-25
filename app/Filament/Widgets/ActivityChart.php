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
        $isMahasiswa = $user->hasRole('mahasiswa');
        if (is_null($this->filter)) {
            $latestYearPortfolio = Portfolio::selectRaw('MAX(YEAR(' . ($isMahasiswa ? 'tanggal_kegiatan' : 'created_at') . ')) as year')
                ->value('year');

            $this->filter = (string)$latestYearPortfolio;
        }
        $activeFilter = $this->filter;
        $dateField = $isMahasiswa ? 'tanggal_kegiatan' : 'created_at';
        $portfolioQuery = Portfolio::whereYear($dateField, $activeFilter);

        if ($isMahasiswa) {
            $portfolioQuery->where('user_id', $user->id);
        }
        $portfolioRecords = $portfolioQuery->get();
        $groupedRecords = $portfolioRecords->groupBy(function ($record) use ($dateField, $isMahasiswa) {
            $date = $isMahasiswa ? Carbon::parse($record->{$dateField}) : $record->{$dateField};
            return $date->format('Y-m');
        });
        $sortedGroupedRecords = $groupedRecords->sortKeys();
        $months = collect([
            '01' => 'Jan', '02' => 'Febr', '03' => 'Mar', '04' => 'Apr',
            '05' => 'May', '06' => 'Jun', '07' => 'Jul', '08' => 'Aug',
            '09' => 'Sep', '10' => 'Oct', '11' => 'Nov', '12' => 'Dec'
        ]);
        $monthLabels = [];
        $monthData = [];
        foreach ($months as $monthNumber => $monthName) {
            $monthKey = $activeFilter ? $activeFilter . '-' . $monthNumber : $monthNumber;
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
            'labels' => $monthLabels,
        ];
    }


    protected function getFilters(): ?array
    {
        $khsYears = Khs::selectRaw('DISTINCT YEAR(created_at) as year')
            ->orderBy('year', 'desc')
            ->pluck('year')
            ->toArray();

        $portfolioYears = Portfolio::selectRaw('DISTINCT YEAR(created_at) as year')
            ->orderBy('year', 'desc')
            ->pluck('year')
            ->toArray();
        $allYears = array_unique(array_merge($khsYears, $portfolioYears));
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
