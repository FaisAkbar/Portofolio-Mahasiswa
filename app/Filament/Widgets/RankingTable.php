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
        $angkatan = $this->filters['angkatan'] ?? null;
        $prodi = $this->filters['prodi'] ?? null;
        $query = User::role('mahasiswa')
            ->select('users.id', 'users.name')
            ->leftJoin('khs', 'khs.user_id', '=', 'users.id')
            ->selectRaw('SUM(khs.ip_semester) as total_nilai')
            ->selectRaw('COUNT(khs.id) as total_khs')
            ->selectRaw('IF(COUNT(khs.id) > 0, SUM(khs.ip_semester) / COUNT(khs.id), 0) as ipk')
            ->groupBy('users.id', 'users.name');

        if (auth()->user()->hasRole('prodi') || auth()->user()->hasRole('super_admin')) {
            if ($angkatan) {
                $query->where('users.angkatan', $angkatan);
            }
            if ($prodi) {
                $query->where('users.prodi', $prodi);
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
