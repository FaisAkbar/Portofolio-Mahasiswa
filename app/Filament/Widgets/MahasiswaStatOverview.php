<?php

namespace App\Filament\Widgets;

use App\Models\Khs;
use App\Models\Portfolio;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class MahasiswaStatOverview extends BaseWidget
{
    use HasWidgetShield;

    protected static ?int $sort = 1;

    protected function getStats(): array
    {
        $khsCount = Khs::query()->where('user_id', auth()->id())->count();
        $latestKhs = Khs::query()->where('user_id', auth()->id())->orderBy('semester', 'desc')->first();

        return [
            Stat::make(
                'Average GPA',
                $khsCount ?
                    number_format(
                        Khs::query()
                            ->where('user_id', auth()->id())
                            ->sum('ip_semester') / $khsCount,
                        2
                    )
                    : '0.00' // Format 0 juga sebagai desimal
            ),
            Stat::make(
                'Latest IPS',
                $latestKhs
                    ? $latestKhs->ip_semester // If there is a record, get the ip_semester
                    : '0.00' // Return 0 if no khs are found
            ),

            Stat::make('Academic Point', Portfolio::query()
                ->where('user_id', auth()->id())
                ->where('jenis_pencapaian', 'Akademik')
                ->where('status', 'accepted')
                ->with('category')
                ->get()
                ->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                })),

            Stat::make('Non-Academic Point', Portfolio::query()
                ->where('user_id', auth()->id())
                ->where('jenis_pencapaian', 'Non-Akademik')
                ->where('status', 'accepted')
                ->with('category')
                ->get()
                ->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                }))

        ];
    }
}
