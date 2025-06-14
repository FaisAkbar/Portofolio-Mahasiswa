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
    protected static ?string $navigationGroup = 'Student Data';

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

    public static function getEloquentQuery(): Builder
    {

        $query = User::role('mahasiswa')
            ->select('users.id', 'users.name', 'users.nim_nip')

            ->addSelect([
                'total_nilai' => KHS::selectRaw('SUM(khs.ip_semester)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1),
                'total_khs' => KHS::selectRaw('COUNT(khs.id)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1),
                'ipk' => KHS::selectRaw('IF(COUNT(khs.id) > 0, SUM(khs.ip_semester) / COUNT(khs.id), 0)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1),
            ])

            ->addSelect([
                'academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Akademik" THEN categories.poin ELSE 0 END), 0) as academic_points') 
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1),
            ])

            ->addSelect([
                'non_academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Non-Akademik" THEN categories.poin ELSE 0 END), 0) as non_academic_points')
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1),
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

                Tables\Columns\TextColumn::make('ipk')
                    ->label('IPK')
                    ->sortable()
                    ->numeric(decimalPlaces: 2),

                Tables\Columns\TextColumn::make('academic_points')
                    ->label('Academic Points')
                    ->sortable(),

                Tables\Columns\TextColumn::make('non_academic_points')
                    ->label('Non-Academic Points')
                    ->sortable(),
            ])
            ->filters([
                SelectFilter::make('year_code')
                    ->options(function () {
                        return User::selectRaw('DISTINCT SUBSTRING(nim_nip, 1, 2) as year_code')
                            ->role('mahasiswa')
                            ->pluck('year_code', 'year_code')
                            
                            ->toArray();
                    })
                    ->query(function (Builder $query, $data) {
                        if (empty($data['value']) || $data['value'] === '') {
                            return $query;
                        }

                        return $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$data['value']]);
                    }),

                SelectFilter::make('prodi_code')
                    ->label('Prodi Code')
                    ->options(function () {
                        $prodis = Prodi::all();
                        $options = [];
                        foreach ($prodis as $prodi) {
                            $options[$prodi->prodi_code] = $prodi->prodi_code . ' - ' . $prodi->prodi_name;
                        }

                        return $options;
                    })->query(function (Builder $query, $data) {
                        if (empty($data['value']) || $data['value'] === '') {
                            return $query;
                        }
                        $prodiCode = $data['value'];
                        $year = substr($prodiCode, 0, 2);
                        if ((int)$year >= 24) {
                            return $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                        } else {
                            return $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                        }
                    }), 
                    
            ])
            ->headerActions([
                Tables\Actions\Action::make('Generate Recap')
                    ->color('gray')
                    ->url(function ($livewire) {
                        $filters = $livewire->tableFilters;
                        return route('download.recap', [
                            'year_code' => $filters['year_code']['value'] ?? null,
                            'prodi_code' => $filters['prodi_code']['value'] ?? null,
                        ]);
                    })
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
