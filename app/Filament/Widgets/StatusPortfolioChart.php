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
    protected static ?string $heading = 'Distribusi Status Portofolio';
    protected int | string | array $columnSpan = 'full';

    protected static ?int $sort = 6;

    protected function getData(): array
    {
        $user = auth()->user();
        $angkatan = $this->filters['angkatan'] ?? null;
        $prodi = $this->filters['prodi'] ?? null;
        $portfolioQuery = Portfolio::select('status', DB::raw('count(*) as total'))
            ->groupBy('status');
        if ($user->hasRole('mahasiswa')) {
            $portfolioQuery->where('user_id', $user->id);
        }
        if (auth()->user()->hasRole('prodi') || auth()->user()->hasRole('super_admin')) {
            if ($angkatan) {
                $portfolioQuery->where('users.angkatan', $angkatan);
            }
            if ($prodi) {
                $portfolioQuery->where('users.prodi', $prodi);
                }
        }
        $portfolioStatuses = $portfolioQuery->get()->pluck('total', 'status')->toArray();
        $chartData = [];
        foreach ($portfolioStatuses as $status => $count) {
            $chartData[] = [
                'label' => ucfirst($status),
                'value' => $count,
            ];
        }

        return [
            'datasets' => [
                [
                    'data' => array_column($chartData, 'value'),
                    'backgroundColor' => ['#993a36', '#fec11b', '#132144'],
                ],
            ],
            'labels' => array_column($chartData, 'label'),
        ];
    }
    protected function getType(): string
    {
        return 'pie';
    }
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
                'x' => ['display' => false],
                'y' => ['display' => false],
            ],
            'maintainAspectRatio' => false,
            'width' => 500,
            'height' => 500,
        ];
    }
}