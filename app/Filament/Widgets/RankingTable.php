<?php

namespace App\Filament\Widgets;

use App\Models\Portfolio;
use App\Models\User;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Filament\Widgets\TableWidget as BaseWidget;

class RankingTable extends BaseWidget
{
    protected static ?string $heading = 'Tabel Peringkat IPK';
    protected static ?int $sort = 10;
    protected static bool $isLazy = false;
    protected int | string | array $columnSpan = 'full';
    use HasWidgetShield, InteractsWithPageFilters;

    public function table(Tables\Table $table): Tables\Table
    {
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;
        $query = User::role('mahasiswa')
            ->select('users.id', 'users.name')
            ->leftJoin('khs', 'khs.user_id', '=', 'users.id')
            ->selectRaw('SUM(khs.ip_semester) as total_nilai')
            ->selectRaw('COUNT(khs.id) as total_khs')
            ->selectRaw('IF(COUNT(khs.id) > 0, SUM(khs.ip_semester) / COUNT(khs.id), 0) as ipk')
            ->groupBy('users.id', 'users.name');

        if (auth()->user()->hasRole('prodi') || auth()->user()->hasRole('super_admin')) {
            if ($yearCode) {
                $query->whereRaw('SUBSTRING(users.nim_nip, 1, 2) = ?', [$yearCode]);
            }

            if ($prodiCode) {
                $year = substr($prodiCode, 0, 2);
                if ((int)$year >= 24) {
                    $query->whereRaw('SUBSTRING(users.nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    $query->whereRaw('SUBSTRING(users.nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            }
        }

        return $table->query($query)
            ->columns([
                Tables\Columns\TextColumn::make('index')
                    ->label('No')
                    ->rowIndex(),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama')
                    ->sortable(),
                Tables\Columns\TextColumn::make('ipk')
                    ->label('IPK')
                    ->sortable()
                    ->numeric(decimalPlaces: 2)
                    // sort descending
                    ->default('ipk', 'desc'),
            ])
            ->defaultSort('ipk', 'desc')
            ->defaultPaginationPageOption(5)
            ->paginated([5, 10, 25, 50]);
    }
}
