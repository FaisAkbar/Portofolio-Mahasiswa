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
        $user = auth()->user();
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;
        $portfolioQuery = Portfolio::select('status', DB::raw('count(*) as total'))
            ->groupBy('status');
        if ($user->hasRole('mahasiswa')) {
            $portfolioQuery->where('user_id', $user->id);
        }
        if ($yearCode) {
            $portfolioQuery->whereHas('user', function ($query) use ($yearCode) {
                $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
            });
        }
        if ($prodiCode) {
            $portfolioQuery->whereHas('user', function ($query) use ($prodiCode) {
                $year = substr($prodiCode, 0, 2);
                if ((int)$year >= 24) {
                    $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            });
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
                    'backgroundColor' => ['#FF6384', '#36A2EB', '#FFCE56'],
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