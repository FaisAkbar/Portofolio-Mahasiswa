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

    protected ?string $heading = 'Statistik Mahasiswa';

    protected static ?int $sort = 1;

    protected function getStats(): array
    {
        $khsCount = Khs::query()->where('user_id', auth()->id())->count();
        $latestKhs = Khs::query()->where('user_id', auth()->id())->orderBy('semester', 'desc')->first();

        return [
            Stat::make(
                'IPK',
                $khsCount ?
                    number_format(
                        Khs::query()
                            ->where('user_id', auth()->id())
                            ->sum('ip_semester') / $khsCount,
                        2
                    )
                    : '0.00'
            ),
            Stat::make(
                'IP Semester terakhir',
                $latestKhs
                    ? $latestKhs->ip_semester
                    : '0.00'
            ),

            Stat::make('Poin Hard Skill dan Soft Skill', Portfolio::query()
                ->where('user_id', auth()->id())
                ->where('jenis_pencapaian', 'Hard Skill dan Soft Skill')
                ->where('status', 'Diterima')
                ->with('category')
                ->get()
                ->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                })),

            Stat::make('Poin Olahraga dan Seni', Portfolio::query()
                ->where('user_id', auth()->id())
                ->where('jenis_pencapaian', 'Olahraga dan Seni')
                ->where('status', 'Diterima')
                ->with('category')
                ->get()
                ->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                }))

        ];
    }
}
