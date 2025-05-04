<?php

namespace App\Filament\Widgets;

use App\Models\Portfolio;
use Filament\Widgets\ChartWidget;

class PortfolioChart extends ChartWidget
{
    protected static ?string $heading = 'Chart';

    protected function getData(): array
    {
        // Ambil data per bulan
        $data = Portfolio::selectRaw('DATE_FORMAT(tanggal_kegiatan, "%Y-%m") as bulan, COUNT(*) as total')
            ->groupBy('bulan')
            ->orderBy('bulan')
            ->get();

        $labels = $data->pluck('bulan')->toArray();
        $values = $data->pluck('total')->toArray();

        return [
            'datasets' => [
                [
                    'label' => 'Jumlah Portofolio',
                    'data' => $values,
                    'fill' => 'start',
                    'borderColor' => '#3b82f6',
                    'backgroundColor' => 'rgba(59, 130, 246, 0.3)',
                ],
            ],
            'labels' => $labels,
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
