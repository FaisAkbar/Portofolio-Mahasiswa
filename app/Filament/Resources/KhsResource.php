<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KhsResource\Pages;
use App\Filament\Resources\KhsResource\RelationManagers;
use App\Models\Khs;
use App\Models\User;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\HtmlString;

class KhsResource extends Resource
{
    protected static ?string $model = Khs::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form->schema([
            Hidden::make('user_id')->default(fn() => auth()->id()),

            Forms\Components\TextInput::make('semester')
                ->label('Semester')
                ->integer()
                ->required(),

            Forms\Components\TextInput::make('ip_semester')
                ->label('IP Semester')
                ->numeric()
                ->step(0.01)
                ->minValue(0)
                ->maxValue(4.00)
                ->required(),

            Forms\Components\FileUpload::make('file_path')
                ->label('Upload PDF')
                ->disk('public') // pastikan 'public' sesuai dengan disk di config/filesystems.php
                ->directory(function ($get) {
                    $userId = $get('user_id');
                    $user = \App\Models\User::find($userId);
                    $nim_nip = $user?->nim_nip ?? 'unknown';
            
                    // Return nested directory path
                    return "khs/{$nim_nip}";
                })
                ->visibility('public')
                ->acceptedFileTypes(['application/pdf'])
                ->maxSize(2048)
                ->getUploadedFileNameForStorageUsing(function ($file, $get) {
                    $semester = $get('semester'); // ambil semester dari form
                    $extension = $file->getClientOriginalExtension();

                    return "{$semester}.{$extension}";
                })
                ->required(),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->label('Nama Mahasiswa')
                    ->sortable()
                    ->searchable(),

                TextColumn::make('user.nim_nip')
                    ->label('NIM/NIP')
                    ->sortable()
                    ->searchable(),

                TextColumn::make('semester')
                    ->label('Semester')
                    ->sortable(),

                TextColumn::make('ip_semester')
                    ->label('IP Semester')
                    ->sortable()
                    ->formatStateUsing(fn($state) => number_format($state, 2)), // Format 2 desimal

                TextColumn::make('file_path')
                    ->label('File KHS')
                    ->getStateUsing(fn($record) => basename($record->file_path))
                    ->formatStateUsing(function ($state, $record) {
                        if (!$record->file_path) {
                            return new HtmlString('-');
                        }

                        $url = Storage::disk('public')->url($record->file_path);

                        return new HtmlString("<a href='{$url}' target='_blank' class='text-primary-600 hover:underline'>View PDF</a>");
                    }),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListKhs::route('/'),
            'create' => Pages\CreateKhs::route('/create'),
            'edit' => Pages\EditKhs::route('/{record}/edit'),
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
