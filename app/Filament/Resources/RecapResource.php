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
    protected static ?string $navigationLabel = 'Laporan';
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?string $navigationGroup = 'Data Mahasiswa';

    public static function getLabel(): string
    {
        return 'Laporan';
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
                'academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "Diterima" AND portfolios.jenis_pencapaian = "Hard Skill dan Soft Skill" THEN categories.poin ELSE 0 END), 0) as academic_points')
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1),
            ])

            ->addSelect([
                'non_academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "Diterima" AND portfolios.jenis_pencapaian = "Olahraga dan Seni" THEN categories.poin ELSE 0 END), 0) as non_academic_points')
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
                    ->label('Nama')
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
                    ->label('Poin Hard Skill dan Soft Skill')
                    ->sortable(),

                Tables\Columns\TextColumn::make('non_academic_points')
                    ->label('Poin Olahraga dan Seni')
                    ->sortable(),
            ])
            ->filters([
                SelectFilter::make('angkatan')
                    ->label('Angkatan')
                    ->options(fn () => User::whereNotNull('angkatan')
                        ->select('angkatan')
                        ->distinct()
                        ->orderBy('angkatan', 'desc')
                        ->pluck('angkatan', 'angkatan')
                        ->toArray()
                    )
                    ->query(function (Builder $query, $data) {
                        if (filled($data['value'])) {
                            $query->where('angkatan', $data['value']);
                        }
                        return $query;
                    }),

                SelectFilter::make('prodi')
                    ->label('Program Studi')
                    ->options(fn () => User::whereNotNull('prodi')
                        ->select('prodi')
                        ->distinct()
                        ->orderBy('prodi')
                        ->pluck('prodi', 'prodi')
                        ->toArray()
                    )
                    ->query(function (Builder $query, $data) {
                        if (filled($data['value'])) {
                            $query->where('prodi', $data['value']);
                        }
                            return $query;
                    }),
            ])
            ->defaultSort('name', 'asc')
            ->headerActions([
                Tables\Actions\Action::make('Unduh Laporan')
                    ->color('gray')
                    ->url(function ($livewire) {
                        $filters = $livewire->tableFilters;
                        return route('download.recap', [
                            'angkatan' => $filters['angkatan']['value'] ?? null,
                            'prodi' => $filters['prodi']['value'] ?? null,
                        ]);
                    })
                    ->openUrlInNewTab(),
                ExportAction::make()
                    ->exporter(RecapExporter::class)
                    ->label('Ekspor Laporan')
                    ->filename(fn() => 'Laporan_Rekapitulasi_' . auth()->user()->nim_nip . '_' . now()->format('dmY'))

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
