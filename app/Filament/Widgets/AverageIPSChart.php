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

    protected static ?string $heading = "Rata-rata IP Semester Mahasiswa";
    protected static ?int $sort = 8;
    protected int | string | array $columnSpan = 'full';

    protected function getData(): array
    {
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;
        $user = auth()->user();
        $khsQuery = Khs::orderBy('semester', 'asc');
        if ($user->hasRole('prodi')) {
            if ($yearCode) {
                $khsQuery->whereHas('user', function ($query) use ($yearCode) {
                    $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
                });
            }
            if ($prodiCode) {
                $khsQuery->whereHas('user', function ($query) use ($prodiCode) {
                    $year = substr($prodiCode, 0, 2);
                    if ((int)$year >= 24) {
                        $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                    } else {
                        $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                    }
                });
            }
        }
        $khsRecords = $khsQuery->get();
        $averages = $khsRecords->groupBy('semester')->map(function ($semesterRecords) {
            return $semesterRecords->avg('ip_semester');
        });
        $labels = collect([1, 2, 3, 4, 5, 6]);
        $data = $labels->map(fn($semester) => $averages->get($semester, 0));
        $label = 'Average IP Semester';
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