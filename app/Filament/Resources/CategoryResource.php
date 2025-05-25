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
    protected static ?string $navigationLabel = 'Category';
    protected static ?string $navigationIcon = 'heroicon-o-square-3-stack-3d';
    protected static ?string $navigationGroup = 'Admin Settings';




    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('kegiatan')
                    ->label('Event')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('tingkat_kegiatan')
                    ->label('Level of Event')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('peran_prestasi')
                    ->label('Role')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('poin')
                    ->numeric()
                    ->required()
                    ->label('Points'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('kegiatan')->searchable()
                    ->label('Event'),
                Tables\Columns\TextColumn::make('tingkat_kegiatan')->sortable()
                    ->label('Level of Event'),
                Tables\Columns\TextColumn::make('peran_prestasi')->sortable()
                    ->label('Role'),
                Tables\Columns\TextColumn::make('poin')->sortable()
                    ->label('Points'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([])
            ->actions([
                ActionGroup::make([
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
                    ->label('More actions')
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
