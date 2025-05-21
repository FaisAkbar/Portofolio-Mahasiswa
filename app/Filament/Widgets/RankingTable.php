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
    protected static ?string $heading = 'IPK Ranking';
    protected static ?int $sort = 10;
    protected int | string | array $columnSpan = 'full';
    use HasWidgetShield, InteractsWithPageFilters;

    public function table(Tables\Table $table): Tables\Table
    {
        // Retrieve the filters from the request (if they exist)
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;

        // Start building the query for users with the 'mahasiswa' role
        $query = User::role('mahasiswa') // Filter users with the 'mahasiswa' role
            ->select('users.id', 'users.name') // Explicitly select the columns from users table
            ->leftJoin('khs', 'khs.user_id', '=', 'users.id') // Join KHS table to get the nilai
            ->selectRaw('SUM(khs.ip_semester) as total_nilai') // Sum of nilai from KHS table
            ->selectRaw('COUNT(khs.id) as total_khs') // Count KHS records
            ->selectRaw('IF(COUNT(khs.id) > 0, SUM(khs.ip_semester) / COUNT(khs.id), 0) as ipk') // Calculate IPK (nilai / count of KHS)
            ->groupBy('users.id', 'users.name'); // Group by user ID and name

        // Apply filters only for users with the 'prodi' role
        if (auth()->user()->hasRole('prodi')) {
            // Apply the year_code filter if it exists
            if ($yearCode) {
                $query->whereRaw('SUBSTRING(users.nim_nip, 1, 2) = ?', [$yearCode]);
            }

            // Apply the prodi_code filter if it exists
            if ($prodiCode) {
                $year = substr($prodiCode, 0, 2);  // Get the first 2 digits of prodiCode for year check
                if ((int)$year >= 24) {
                    // If the year is 24 or above, the prodi code starts at position 6 (index 5)
                    $query->whereRaw('SUBSTRING(users.nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    // If the year is < 24, the prodi code starts at position 4 (index 3)
                    $query->whereRaw('SUBSTRING(users.nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            }
        }

        // Return the table with the query
        return $table->query($query)
            ->columns([
                Tables\Columns\TextColumn::make('index')
                    ->label('No')
                    ->state(function ($record, $livewire) {
                        static $index = 0;
                        return ++$index;
                    }),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama')
                    ->sortable(),
                Tables\Columns\TextColumn::make('ipk')
                    ->label('IPK')
                    ->sortable()
                    ->numeric(decimalPlaces: 2),
            ]);
    }
}
