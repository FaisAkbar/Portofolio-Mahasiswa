<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KhsResource\Pages;
use App\Filament\Resources\KhsResource\RelationManagers;
use App\Models\Khs;
use App\Models\User;
use Filament\Actions\ActionGroup;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Form;
use Filament\Notifications\Actions\ActionGroup as NotificationsActionsActionGroup;
use Filament\Resources\Resource;
use Filament\Support\Enums\ActionSize;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Actions\ActionGroup as ActionsActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\HtmlString;
use Illuminate\Validation\Rules\Unique;

class KhsResource extends Resource
{
    protected static ?string $model = Khs::class;
    protected static ?string $navigationLabel = 'KHS';
    protected static ?string $navigationIcon = 'heroicon-o-book-open';
    protected static ?string $navigationGroup = 'Student Data';

    public static function form(Form $form): Form
    {
        return $form->schema([
            Hidden::make('user_id')->default(fn() => auth()->id()),

            Forms\Components\TextInput::make('semester')
                ->label('Semester')
                ->integer()
                ->required()
                ->unique(
                    table: 'khs',
                    column: 'semester',
                    ignoreRecord: true,
                    modifyRuleUsing: function (Unique $rule, $get) {
                        return $rule->where('user_id', $get('user_id'));
                    }
                )
                ->validationMessages([
                    'unique' => 'You have already entered this semester. Please enter another semester.',
                ]),

            Forms\Components\TextInput::make('ip_semester')
                ->label('IP Semester')
                ->numeric()
                ->step(0.01)
                ->minValue(0)
                ->maxValue(4.00)
                ->required(),

            Forms\Components\FileUpload::make('file_path')
                ->label('Upload PDF')
                ->disk('public')
                ->directory(function ($get) {
                    $userId = $get('user_id');
                    $user = \App\Models\User::find($userId);
                    $nim_nip = $user?->nim_nip ?? 'unknown';
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
        $user = Filament::auth()->user();
        $isMahasiswa = $user->hasRole('mahasiswa');
        $isProdi = $user->hasRole('prodi') || $user->hasRole('super_admin');
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Name')
                    ->sortable()
                    ->searchable()
                    ->visible($isProdi),

                Tables\Columns\TextColumn::make('user.nim_nip')
                    ->label('NIM/NIP')
                    ->sortable()
                    ->searchable()
                    ->visible($isProdi),

                Tables\Columns\TextColumn::make('semester')
                    ->label('Semester')
                    ->sortable(),

                Tables\Columns\TextColumn::make('ip_semester')
                    ->label('IP Semester')
                    ->sortable()
                    ->formatStateUsing(fn($state) => number_format($state, 2)),

                // TextColumn::make('file_path')
                //     ->label('File KHS')
                //     ->getStateUsing(fn($record) => basename($record->file_path))
                //     ->formatStateUsing(function ($state, $record) {
                //         if (!$record->file_path) {
                //             return new HtmlString('-');
                //         }

                //         $url = Storage::disk('public')->url($record->file_path);

                //         return new HtmlString("<a href='{$url}' target='_blank' class='text-primary-600 hover:underline'>View PDF</a>");
                //     }),
            ])
            ->defaultSort('semester', 'asc')
            ->filters([
                //
            ])
            ->actions([
                ActionsActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->url(fn($record) => Storage::disk('public')->url($record->file_path))
                        ->openUrlInNewTab()
                        ->label('View PDF')
                        ->icon('heroicon-o-eye'),
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
            'index' => Pages\ListKhs::route('/'),
            'create' => Pages\CreateKhs::route('/create'),
            'edit' => Pages\EditKhs::route('/{record}/edit'),
        ];
    }
    public static function getEloquentQuery(): Builder
    {
        $user = Filament::auth()->user();

        if ($user->hasRole('prodi') || $user->hasRole('super_admin')) {
            return parent::getEloquentQuery();
        }
        return parent::getEloquentQuery()->where('user_id', $user->id);
    }
}
