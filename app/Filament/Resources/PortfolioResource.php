<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PortfolioResource\Pages;
use App\Models\Category;
use App\Models\Portfolio;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class PortfolioResource extends Resource
{
    protected static ?string $model = Portfolio::class;
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
        ->schema([
            Forms\Components\TextInput::make('nama_kegiatan')
                ->required()
                ->maxLength(255),

            Forms\Components\DatePicker::make('tanggal_kegiatan')
                ->label('Tanggal Kegiatan')
                ->required(),

            // 1. Pilih Kegiatan
            Forms\Components\Select::make('kegiatan')
                ->label('Kegiatan')
                ->options(fn () => Category::query()
                    ->select('kegiatan')
                    ->distinct()
                    ->pluck('kegiatan', 'kegiatan'))
                ->required()
                ->reactive()
                ->searchable()
                ->preload(),

            // 2. Pilih Tingkat
            Forms\Components\Select::make('tingkat_kegiatan')
                ->label('Tingkat Kegiatan')
                ->options(fn (Get $get) => Category::query()
                    ->where('kegiatan', $get('kegiatan'))
                    ->select('tingkat_kegiatan')
                    ->distinct()
                    ->pluck('tingkat_kegiatan', 'tingkat_kegiatan'))
                ->required()
                ->reactive()
                ->disabled(fn (Get $get) => blank($get('kegiatan')))
                ->searchable()
                ->preload(),

            // 3. Pilih Peran / Prestasi
            Forms\Components\Select::make('peran_prestasi')
                ->label('Peran / Prestasi')
                ->options(fn (Get $get) => Category::query()
                    ->where('kegiatan', $get('kegiatan'))
                    ->where('tingkat_kegiatan', $get('tingkat_kegiatan'))
                    ->select('peran_prestasi')
                    ->distinct()
                    ->pluck('peran_prestasi', 'peran_prestasi'))
                ->required()
                ->reactive()
                ->disabled(fn (Get $get) => blank($get('tingkat_kegiatan')))
                ->afterStateUpdated(function (Get $get, Set $set) {
                    $category = Category::where('kegiatan', $get('kegiatan'))
                        ->where('tingkat_kegiatan', $get('tingkat_kegiatan'))
                        ->where('peran_prestasi', $get('peran_prestasi'))
                        ->first();

                    if ($category) {
                        $set('kategori_id', $category->id);
                        $set('poin', $category->poin);
                    }
                })
                ->searchable()
                ->preload(),

            // 4. Otomatis dari pilihan di atas
            Forms\Components\TextInput::make('poin')
                ->label('Poin')
                ->disabled()
                ->required(),

            Forms\Components\Select::make('jenis_pencapaian')
                ->required()
                ->options([
                    'Akademik' => 'Akademik',
                    'Non-Akademik' => 'Non-Akademik',
                ]),

            // Hidden: kategori_id untuk disimpan
            Forms\Components\Hidden::make('kategori_id')->required(),

            Forms\Components\Hidden::make('user_id')
                ->default(auth()->id())
                ->required(),
        ]);
        
    }

    public static function table(Table $table): Table
{
    $user = Filament::auth()->user();
    $isMahasiswa = $user->hasRole('Mahasiswa');

    return $table
        ->columns([
            Tables\Columns\TextColumn::make('user.name')
                ->label('User')
                ->sortable()
                ->visible(!$isMahasiswa),
            Tables\Columns\TextColumn::make('nama_kegiatan')
                ->label('Nama Kegiatan')
                ->searchable(),
            Tables\Columns\TextColumn::make('kategori.kegiatan')
                ->label('Kegiatan')
                ->sortable(),
            Tables\Columns\TextColumn::make('kategori.tingkat_kegiatan')
                ->label('Tingkat Kegiatan')
                ->sortable(),
            Tables\Columns\TextColumn::make('kategori.peran_prestasi')
                ->label('Peran / Prestasi')
                ->sortable(),
            Tables\Columns\TextColumn::make('tanggal_kegiatan')
                ->label('Tanggal Kegiatan')
                ->date()
                ->sortable(),
            Tables\Columns\TextColumn::make('jenis_pencapaian')
                ->label('Jenis Pencapaian')
                ->sortable(),
            Tables\Columns\TextColumn::make('kategori.poin')
                ->label('Poin')
                ->sortable(),
            Tables\Columns\TextColumn::make('created_at')
                ->label('Dibuat')
                ->dateTime()
                ->sortable(),
        ])
        ->filters([
            //
        ])
        ->actions([
            Tables\Actions\EditAction::make(),
        ])
        ->bulkActions([
            Tables\Actions\DeleteBulkAction::make(),
        ]);
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
            'index' => Pages\ListPortfolios::route('/'),
            'create' => Pages\CreatePortfolio::route('/create'),
            'edit' => Pages\EditPortfolio::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        $user = Filament::auth()->user();

        // Jika Prodi, tampilkan semua data
        if ($user->hasRole('prodi')) {
            return parent::getEloquentQuery();
        }

        // Kalau bukan Prodi (termasuk mahasiswa), tampilkan data miliknya saja
        return parent::getEloquentQuery()->where('user_id', $user->id);
    }
}
