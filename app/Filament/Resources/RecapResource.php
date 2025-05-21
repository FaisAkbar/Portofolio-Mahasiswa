<?php

namespace App\Filament\Resources;

use App\Filament\Exports\RecapExporter;
use App\Filament\Resources\RecapResource\Pages;
use App\Filament\Resources\RecapResource\RelationManagers;
use App\Models\Khs;
use App\Models\Portfolio;
use App\Models\Prodi;
use App\Models\Recap;
use App\Models\User;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Forms\Components\Select;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class RecapResource extends Resource
{
    protected static ?string $model = Recap::class;
    protected static ?string $navigationLabel = 'Recap';
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?string $navigationGroup = 'Data Mahasiswa';

    public static function getLabel(): string
    {
        return 'Recap';
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    // Custom query to include calculated fields and allow sorting
    public static function getEloquentQuery(): Builder
    {
        // Base query for selecting users with the 'mahasiswa' role
        $query = User::role('mahasiswa') // Filter users with the 'mahasiswa' role
            ->select('users.id', 'users.name', 'users.nim_nip') // Explicitly select the columns from users table

            // Subquery for calculating IPK (GPA)
            ->addSelect([
                'total_nilai' => KHS::selectRaw('SUM(khs.ip_semester)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1), // Only one value per user
                'total_khs' => KHS::selectRaw('COUNT(khs.id)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1), // Only one value per user
                'ipk' => KHS::selectRaw('IF(COUNT(khs.id) > 0, SUM(khs.ip_semester) / COUNT(khs.id), 0)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1), // Only one value per user
            ])

            // Subquery for calculating Academic Points (Default to 0 if no portfolio exists)
            ->addSelect([
                'academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Akademik" THEN categories.poin ELSE 0 END), 0) as academic_points') 
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1), // Only one value per user
            ])

            // Subquery for calculating Non-Academic Points (Default to 0 if no portfolio exists)
            ->addSelect([
                'non_academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Non-Akademik" THEN categories.poin ELSE 0 END), 0) as non_academic_points')
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1), // Only one value per user
            ]);

        return $query;
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label('Name')
                    ->searchable()
                    ->sortable(),
                
                Tables\Columns\TextColumn::make('nim_nip')
                    ->label('NIM/NIP')
                    ->sortable(),
                
                // IPK Calculation is done in the query
                Tables\Columns\TextColumn::make('ipk')
                    ->label('IPK')
                    ->sortable()
                    ->numeric(decimalPlaces: 2),

                // Academic Points Calculation is done in the query
                Tables\Columns\TextColumn::make('academic_points')
                    ->label('Academic Points')
                    ->sortable(),

                // Non-Academic Points Calculation is done in the query
                Tables\Columns\TextColumn::make('non_academic_points')
                    ->label('Non-Academic Points')
                    ->sortable(),
            ])
            ->filters([
                // Year Code Filter
                SelectFilter::make('year_code')
                    ->options(function () {
                        // Dynamically get unique year codes from nim_nip (first 2 digits)
                        return User::selectRaw('DISTINCT SUBSTRING(nim_nip, 1, 2) as year_code')
                            ->role('mahasiswa')
                            ->pluck('year_code', 'year_code')
                            
                            ->toArray();
                    })
                    ->query(function (Builder $query, $data) {
                        // Check if $data is null, empty, or set to "All" (empty string)
                        if (empty($data['value']) || $data['value'] === '') {
                            return $query;  // No filter applied, show all records
                        }

                        // Apply the filter by the first 2 digits of nim_nip if $data is set
                        return $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$data['value']]);
                    }),

                // Prodi Code Filter
                // Define the custom filter for prodi_code
                SelectFilter::make('prodi_code')
                    ->label('Prodi Code')
                    ->options(function () {
                        // Fetch all prodi codes and names from the prodis table
                        $prodis = Prodi::all();
                        $options = [];

                        // Format the options as 'prodi_code - prodi_name'
                        foreach ($prodis as $prodi) {
                            $options[$prodi->prodi_code] = $prodi->prodi_code . ' - ' . $prodi->prodi_name;
                        }

                        return $options;
                    })->query(function (Builder $query, $data) {
                        // Check if $data is null, empty, or set to "All" (empty string)
                        if (empty($data['value']) || $data['value'] === '') {
                            return $query;  // No filter applied, show all records
                        }

                        // Extract the prodi code from the value
                        $prodiCode = $data['value'];

                        // Check the year (first 2 digits of nim_nip)
                        $year = substr($prodiCode, 0, 2);

                        // Determine the starting position for extracting prodi code
                        if ((int)$year >= 24) {
                            // If year is 24 or above, the prodi code starts from the 6th character (index 5)
                            return $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                        } else {
                            // If year is 23 or below, the prodi code starts from the 4th character (index 3)
                            return $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                        }
                    }), 
                    
            ])
            ->headerActions([
                Tables\Actions\Action::make('Generate Recap')
                    ->color('gray')
                    ->url(fn() => route('download.recap'))
                    ->openUrlInNewTab(),
                ExportAction::make()->exporter(RecapExporter::class)
            ])
            ->recordUrl(null);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListRecaps::route('/'),
            'create' => Pages\CreateRecap::route('/create'),
            'edit' => Pages\EditRecap::route('/{record}/edit'),
        ];
    }
}
