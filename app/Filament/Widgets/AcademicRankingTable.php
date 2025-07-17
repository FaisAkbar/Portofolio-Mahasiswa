<?php

namespace App\Filament\Widgets;

use App\Models\User;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Filament\Widgets\TableWidget as BaseWidget;
use Illuminate\Support\Facades\Log;

class AcademicRankingTable extends BaseWidget
{
    protected static ?string $heading = 'Peringkat Hard Skill dan Soft Skill';
    protected static ?int $sort = 9;
    protected static bool $isLazy = false;
    // protected int | string | array $columnSpan = 'full';
    use HasWidgetShield, InteractsWithPageFilters;

    public function table(Tables\Table $table): Tables\Table
    {
        $angkatan = $this->filters['angkatan'] ?? null;
        $prodi = $this->filters['prodi'] ?? null;

        $query = User::role('mahasiswa')
            ->select('users.id', 'users.name')
            ->leftJoin('portfolios', 'portfolios.user_id', '=', 'users.id')
            ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id');
        if (auth()->user()->hasRole('prodi') || auth()->user()->hasRole('super_admin')) {
            if ($angkatan) {
                $query->where('users.angkatan', $angkatan);
            }
            if ($prodi) {
                $query->where('users.prodi', $prodi);
            }
        }

        $query->selectRaw('
                IFNULL(SUM(CASE 
                    WHEN portfolios.status = "Diterima" AND portfolios.jenis_pencapaian = "Hard Skill dan Soft skill" THEN categories.poin 
                    ELSE 0 
                END), 0) as total_points
            ')
            ->groupBy('users.id', 'users.name');
            
        return $table->query($query)
            ->columns([
                Tables\Columns\TextColumn::make('index')
                    ->label('No')
                    ->rowIndex(),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama')
                    ->sortable(),
                Tables\Columns\TextColumn::make('total_points')
                    ->label('Total Poin')
                    ->sortable()
                    ->default('total_points', 'desc'),
            ])
            ->defaultSort('total_points', 'desc')
            ->defaultPaginationPageOption(5)
            ->paginated([5, 10, 25, 50]);
    }
}
