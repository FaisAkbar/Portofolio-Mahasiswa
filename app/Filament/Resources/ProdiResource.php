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
    protected static ?string $pluralModelLabel = 'Program Studi';
    protected static ?string $modelLabel = 'Program Studi';
    protected static ?string $navigationGroup = 'Pengaturan Admin';
    protected static ?string $navigationIcon = 'heroicon-o-building-library';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('faculty_id')
                    ->label('Jurusan')
                    ->helperText('Pilih jurusan, atau buat baru jika belum ada')
                    ->relationship('faculty', 'faculty_name')
                    ->searchable()
                    ->preload()
                    ->createOptionForm([
                        Forms\Components\TextInput::make('faculty_name')
                            ->label('Jurusan')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('faculty_code')
                            ->label('Kode Jurusan')
                            ->helperText('Kode unik untuk jurusan ini biasanya terdapat pada kode NIM')
                            ->required(),
                        Forms\Components\Select::make('university_branch_id')
                            ->label('Cabang Universitas')
                            ->helperText('Pilih cabang universitas atau PSDKU')
                            ->relationship('universityBranch', 'university_branch')
                            ->createOptionForm([
                                Forms\Components\TextInput::make('university_branch')
                                    ->label('Nama Cabang Universitas')
                                    ->helperText('Contoh: PSDKU Pamekasan, PSDKU Kediri, dll.')
                                    ->required()
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('branch_code')
                                    ->label('Kode Cabang Universitas')
                                    ->helperText('Kode unik untuk cabang universitas ini')
                                    ->required(),
                            ])
                            ->searchable()
                            ->preload()
                            ->required()
                    ])
                    ->required(),

                Forms\Components\TextInput::make('prodi_name')
                    ->label('Nama Program Studi')
                    ->helperText('Contoh: Teknik Informatika, Sistem Informasi, dll.')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('prodi_code')
                    ->label('Kode Program Studi')
                    ->helperText('Kode unik untuk program studi ini, biasanya terdapat pada kode NIM')
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
                    ->label('Nama Program Studi')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('prodi_code')
                    ->label('Kode Program Studi')
                    ->searchable()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
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
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
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
            'index' => Pages\ListProdis::route('/'),
            'create' => Pages\CreateProdi::route('/create'),
            'edit' => Pages\EditProdi::route('/{record}/edit'),
        ];
    }
}
