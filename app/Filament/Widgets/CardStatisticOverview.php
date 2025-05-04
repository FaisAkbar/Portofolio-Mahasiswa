<?php

namespace App\Filament\Widgets;

use App\Models\Portfolio;
use App\Models\User;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class CardStatisticOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            // Stat::make('Mahasiswa', User::role('mahasiswa')->count()),
            // Stat::make('Prodi', User::role('prodi')->count()),
            // Stat::make('Portofolio', Portfolio::count()),
        ];
    }
}
