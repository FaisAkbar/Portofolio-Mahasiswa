<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CategoryResource\Pages;
use App\Models\Category;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\Enums\ActionSize;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Table;

class CategoryResource extends Resource
{
    protected static ?string $model = Category::class;
    protected static ?string $navigationLabel = 'Kategori Prestasi';
    protected static ?string $navigationIcon = 'heroicon-o-square-3-stack-3d';
    protected static ?string $navigationGroup = 'Pengaturan Admin';
    protected static ?string $pluralModelLabel = 'Kategori Prestasi';
    protected static ?string $modelLabel = 'Kategori Prestasi';
    protected static ?string $slug = 'kategori';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('kegiatan')
                    ->label('Nama Kegiatan')
                    ->required()
                    ->helperText('Contoh: Lomba Karya Tulis Ilmiah')
                    ->maxLength(255),

                Forms\Components\TextInput::make('tingkat_kegiatan')
                    ->label('Tingkat Kegiatan')
                    ->required()
                    ->helperText('Contoh: Nasional, Provinsi, atau Lokal')
                    ->maxLength(255),

                Forms\Components\TextInput::make('peran_prestasi')
                    ->label('Peran Prestasi')
                    ->required()
                    ->helperText('Contoh: Peserta, Juara 1, atau Juara Harapan')
                    ->maxLength(255),

                Forms\Components\TextInput::make('poin')
                    ->numeric()
                    ->minValue(1)
                    ->helperText('Masukkan jumlah poin yang diberikan untuk kategori ini')
                    ->required()
                    ->label('Poin'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('kegiatan')->searchable()
                    ->label('Nama Kegiatan')
                    ->wrap(),
                Tables\Columns\TextColumn::make('tingkat_kegiatan')->sortable()
                    ->label('Tingkat Kegiatan'),
                Tables\Columns\TextColumn::make('peran_prestasi')->sortable()
                    ->label('Peran Prestasi'),
                Tables\Columns\TextColumn::make('poin')->sortable()
                    ->label('Poin'),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Tanggal Dibuat')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([])
            ->actions([
                ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Lihat Detail Data'),
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
                    ->label('Aksi')
                    ->icon('heroicon-m-ellipsis-vertical')
                    ->size(ActionSize::Small)
                    ->color('primary')
                    ->button()
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ])
            ->recordUrl(null);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCategories::route('/'),
            'create' => Pages\CreateCategory::route('/create'),
            'edit' => Pages\EditCategory::route('/{record}/edit'),
        ];
    }
}
