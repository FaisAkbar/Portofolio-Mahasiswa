<?php

namespace App\Filament\Widgets;

use App\Models\Khs;
use App\Models\Prodi;
use App\Models\User;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Forms\Components\Builder;
use Filament\Support\RawJs;
use Filament\Tables\Filters\SelectFilter;
use Filament\Widgets\ChartWidget;

class HistoryIPSChart extends ChartWidget
{
    use HasWidgetShield;

    protected static ?string $heading = "History IPS";
    protected static ?int $sort = 5;

    protected function getData(): array
    {
        $user = auth()->user();
        // For mahasiswa, get the KHS records of the current user
        $khsRecords = Khs::where('user_id', $user->id)
            ->orderBy('semester', 'asc')
            ->get();

        $labels = $khsRecords->map(fn($khs) => $khs->semester);
        $data = $khsRecords->map(fn($khs) => $khs->ip_semester);
        $label = 'IP Semester';

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
