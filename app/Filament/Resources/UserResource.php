<?php

namespace App\Filament\Resources;

use App\Filament\Imports\UserImporter;
use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Models\User;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\Enums\ActionSize;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Actions\ImportAction;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Hash;

class UserResource extends Resource
{
    protected static ?string $model = User::class;
    protected static ?string $navigationLabel = 'Pengguna';
    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationGroup = 'Pengaturan Admin';
    protected static ?string $pluralModelLabel = 'Pengguna';
    protected static ?string $modelLabel = 'Pengguna';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->label('Nama')
                    ->required()
                    ->helperText('Masukkan Nama lengkap pengguna'),
                Forms\Components\TextInput::make('nim_nip')
                    ->label('NIM/NIP')
                    ->required()
                    ->helperText('Masukkan Nomor Induk Mahasiswa/Nomor Induk Pegawai')
                    ->unique(ignoreRecord: true),
                Forms\Components\TextInput::make('email')
                    ->label('Email')
                    ->email()
                    ->required()
                    ->helperText('Masukkan alamat email pengguna atau email kampus bagi mahasiswa'),
                Forms\Components\TextInput::make('prodi')
                    ->label('Program Studi')
                    ->helperText('Masukkan Program Studi pengguna, kosongkan jika tidak relevan'),
                Forms\Components\TextInput::make('angkatan')
                    ->label('Angkatan')
                    ->helperText('Masukkan Angkatan pengguna, kosongkan jika tidak relevan'),
                Forms\Components\TextInput::make('password')
                    ->label('Kata Sandi')
                    ->password()
                    ->dehydrateStateUsing(fn($state) => Hash::make($state))
                    ->dehydrated(fn($state) => filled($state))
                    // ->visibleOn('create')
                    ->helperText('Masukkan kata sandi untuk pengguna baru. Kosongkan jika tidak ingin mengubah kata sandi pengguna yang sudah ada'),
                Forms\Components\Select::make('roles')
                    ->relationship('roles', 'name')
                    ->label('Peran Pengguna')
                    ->multiple()
                    ->preload()
                    ->searchable()
                    ->required()
                    ->helperText('Pilih peran yang sesuai untuk pengguna')
            ]);
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
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('email')
                    ->label('Email')
                    ->searchable()
                    ->icon('heroicon-m-envelope')
                    ->iconColor('primary')
                    ->sortable(),
                Tables\Columns\TextColumn::make('prodi')
                    ->label('Program Studi')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('angkatan')
                    ->label('Angkatan')
                    ->searchable()
                    ->sortable(),
            ])
            ->defaultSort('name', 'asc')
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
            ->headerActions([
                ImportAction::make()
                    ->importer(UserImporter::class)
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

    public static function getEloquentQuery(): Builder
    {
        $user = Filament::auth()->user();
        if ($user->hasRole('prodi')) {
            return User::whereHas('roles', function ($query) {
                $query->where('name', 'mahasiswa');
            });
        }
        return parent::getEloquentQuery();
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
