<?php

namespace App\Filament\Widgets;

use App\Models\User;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Filament\Widgets\TableWidget as BaseWidget;

class NonAcademicRankingTable extends BaseWidget
{
    protected static ?string $heading = 'Non-Academic Ranking';
    protected static ?int $sort = 8;
    // protected int | string | array $columnSpan = 'full';
    use HasWidgetShield, InteractsWithPageFilters;

    public function table(Tables\Table $table): Tables\Table
    {
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;

        $query = User::role('mahasiswa')
            ->select('users.id', 'users.name')
            ->leftJoin('portfolios', 'portfolios.user_id', '=', 'users.id')
            ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id');
        if (auth()->user()->hasRole('prodi') || auth()->user()->hasRole('super_admin')) {
            if ($yearCode) {
                $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
            }
            if ($prodiCode) {
                $year = substr($prodiCode, 0, 2);
                if ((int)$year >= 24) {
                    $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            }
        }

        $query->selectRaw('
                IFNULL(SUM(CASE 
                    WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Non-Akademik" THEN categories.poin 
                    ELSE 0 
                END), 0) as total_points
            ')
            ->groupBy('users.id', 'users.name')
            ->orderByDesc('total_points');
        return $table->query($query)
            ->columns([
                Tables\Columns\TextColumn::make('index')
                    ->label('No')
                    ->state(function ($record, $livewire) {
                        static $index = 0;
                        return ++$index;
                    }),
                Tables\Columns\TextColumn::make('name')
                    ->label('Name')
                    ->sortable(),
                Tables\Columns\TextColumn::make('total_points')
                    ->label('Total Points')
                    ->sortable()
            ]);
    }
}
