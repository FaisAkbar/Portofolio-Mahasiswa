<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProdiResource\Pages;
use App\Filament\Resources\ProdiResource\RelationManagers;
use App\Models\Prodi;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\Enums\ActionSize;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Storage;

class ProdiResource extends Resource
{
    protected static ?string $model = Prodi::class;
    protected static ?string $navigationLabel = 'Program Studi';
    protected static ?string $navigationGroup = 'Admin Settings';
    protected static ?string $navigationIcon = 'heroicon-o-building-library';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('faculty_id')
                    ->label('Departement')
                    ->relationship('faculty', 'faculty_name')
                    ->searchable()
                    ->preload()
                    ->createOptionForm([
                        Forms\Components\TextInput::make('faculty_name')
                            ->label('Departement')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('faculty_code')
                            ->label('Departement Code')
                            ->required(),
                        Forms\Components\Select::make('university_branch_id')
                            ->relationship('universityBranch', 'university_branch')
                            ->createOptionForm([
                                Forms\Components\TextInput::make('university_branch')
                                    ->required()
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('branch_code')
                                    ->label('Branch Code')
                                    ->required(),
                            ])
                            ->searchable()
                            ->preload()
                            ->required()
                    ])
                    ->required(),

                Forms\Components\TextInput::make('prodi_name')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('prodi_code')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                // Tables\Columns\TextColumn::make('faculty.universityBranch.university_branch')
                //     ->label('University Branch')
                //     ->searchable()
                //     ->sortable(),

                // Tables\Columns\TextColumn::make('faculty.universityBranch.branch_code')
                //     ->label('Branch Code')
                //     ->searchable()
                //     ->sortable(),

                // Tables\Columns\TextColumn::make('faculty.faculty_name')
                //     ->label('Departement Name')
                //     ->searchable()
                //     ->sortable(),

                // Tables\Columns\TextColumn::make('faculty.faculty_code')
                //     ->label('Departement Code')
                //     ->searchable()
                //     ->sortable(),

                Tables\Columns\TextColumn::make('prodi_name')
                    ->label('Prodi Name')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('prodi_code')
                    ->label('Prodi Code')
                    ->searchable()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
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
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
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
            'index' => Pages\ListProdis::route('/'),
            'create' => Pages\CreateProdi::route('/create'),
            'edit' => Pages\EditProdi::route('/{record}/edit'),
        ];
    }
}
