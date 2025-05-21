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
        // Retrieve the filters from the request (if they exist)
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;

        $query = User::role('mahasiswa') // Filter users with the 'mahasiswa' role
            ->select('users.id', 'users.name') // Select the required columns from users table
            ->leftJoin('portfolios', 'portfolios.user_id', '=', 'users.id') // LEFT JOIN to include users with no portfolios
            ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id'); // LEFT JOIN to include categories

        // Add filters only if the user has the 'prodi' role
        if (auth()->user()->hasRole('prodi')) {
            // Apply the year_code filter if it exists
            if ($yearCode) {
                $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
            }

            // Apply the prodi_code filter if it exists
            if ($prodiCode) {
                $year = substr($prodiCode, 0, 2);  // Get the first 2 digits of prodiCode for year check
                if ((int)$year >= 24) {
                    // If the year is 24 or above, the prodi code starts at position 6 (index 5)
                    $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    // If the year is < 24, the prodi code starts at position 4 (index 3)
                    $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            }
        }

        $query->selectRaw('
                IFNULL(SUM(CASE 
                    WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Non-Akademik" THEN categories.poin 
                    ELSE 0 
                END), 0) as total_points
            ') // First set points to 0 for all users, then sum categories.poin for accepted portfolios
            ->groupBy('users.id', 'users.name') // Group by user ID and name to calculate total points for each user
            ->orderByDesc('total_points'); // Order by total points in descending order

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
                Tables\Columns\TextColumn::make('total_points')
                    ->label('Total Points')
                    ->sortable()
            ]);
    }
}
