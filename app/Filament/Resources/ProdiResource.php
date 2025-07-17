<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProdiResource\Pages;
use App\Filament\Resources\ProdiResource\RelationManagers;
use App\Models\Prodi;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\Enums\ActionSize;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProdiResource extends Resource
{
    protected static ?string $model = Prodi::class;
    protected static ?string $navigationLabel = 'Program Studi';
    protected static ?string $pluralModelLabel = 'Program Studi';
    protected static ?string $modelLabel = 'Program Studi';
    protected static ?string $navigationGroup = 'Pengaturan Admin';
    protected static ?string $navigationIcon = 'heroicon-o-building-library';

    public static function getEloquentQuery(): Builder
    {
        return User::query()
            ->selectRaw('MIN(id) as id, prodi, COUNT(*) as jumlah_mahasiswa')
            ->whereNotNull('prodi')
            ->groupBy('prodi');
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('prodi')
                    ->label('Program Studi')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('jumlah_mahasiswa')
                    ->label('Jumlah Mahasiswa')
                    ->sortable(),
            ])
            ->actions([
                Action::make('editProdi')
                    ->label('Edit')
                    ->icon('heroicon-o-pencil')
                    ->fillForm(fn ($record) => [
                        'new_prodi' => $record->prodi,
                    ])
                    ->form([
                        Forms\Components\TextInput::make('new_prodi')
                            ->label('Nama Prodi Baru')
                            ->required()
                            ->maxLength(100),
                    ])
                    ->action(function (array $data, $record) {
                        User::where('prodi', $record->prodi)
                            ->update(['prodi' => $data['new_prodi']]);
                    })
                    ->modalHeading('Edit Nama Program Studi')
                    ->modalSubmitActionLabel('Simpan Perubahan')
                    ->requiresConfirmation()
                    ->color('primary'),
            ])
            ->recordUrl(null)
            ->paginated(false);
    }


    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProdis::route('/'),
        ];
    }
}
