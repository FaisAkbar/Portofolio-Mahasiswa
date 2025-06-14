<?php

namespace App\Filament\Resources;

use App\Filament\Exports\PortfolioExporter;
use App\Filament\Resources\PortfolioResource\Pages;
use App\Models\Category;
use App\Models\Portfolio;
use Filament\Actions\ActionGroup as ActionsActionGroup;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Support\Enums\ActionSize;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\HtmlString;

class PortfolioResource extends Resource
{
    protected static ?string $model = Portfolio::class;
    protected static ?string $navigationLabel = 'Portfolio';
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationGroup = 'Student Data';
    protected static ?string $slug = 'portfolio';
    
    public static function form(Form $form): Form
    {
        $user = Filament::auth()->user();
        $isMahasiswa = $user->hasRole('mahasiswa');
        $isProdi = $user->hasRole('prodi') || $user->hasRole('super_admin');

        $formSchema = [
            Forms\Components\TextInput::make('nama_kegiatan')
                ->label('Event Name')
                ->required()
                ->maxLength(255)
                ->disabled($isProdi),

            Forms\Components\DatePicker::make('tanggal_kegiatan')
                ->label('Event Date')
                ->required()
                ->disabled($isProdi),

            Forms\Components\Select::make('kegiatan')
                ->label('Event')
                ->options(fn() => Category::query()
                    ->select('id', 'kegiatan')
                    ->distinct()
                    ->pluck('kegiatan', 'kegiatan'))
                ->required()
                ->reactive()
                ->searchable()
                ->preload()
                ->disabled($isProdi)
                ->afterStateHydrated(function ($component, $get) {
                    $kategori_id = $get('kategori_id');
                    $category = Category::find($kategori_id);
                    $component->state($category ? $category->kegiatan : null);
                })
                ->afterStateUpdated(function (Get $get, Set $set) {
                    $set('tingkat_kegiatan', null);
                    $set('peran_prestasi', null);
                    $set('poin', null);
                }),

            Forms\Components\Select::make('tingkat_kegiatan')
                ->label('Level of Event')
                ->options(fn(Get $get) => Category::query()
                    ->where('kegiatan', $get('kegiatan'))
                    ->select('tingkat_kegiatan')
                    ->distinct()
                    ->pluck('tingkat_kegiatan', 'tingkat_kegiatan'))
                ->required()
                ->reactive()
                ->disabled(fn(Get $get) => blank($get('kegiatan')) || $isProdi)
                ->searchable()
                ->preload()
                ->afterStateHydrated(function ($component, $get) {
                    $kategori_id = $get('kategori_id');
                    $category = Category::find($kategori_id);
                    $component->state($category ? $category->tingkat_kegiatan : null);
                })
                ->afterStateUpdated(function (Get $get, Set $set) {
                    $set('peran_prestasi', null);
                    $set('poin', null);
                }),

            Forms\Components\Select::make('peran_prestasi')
                ->label('Role')
                ->options(fn(Get $get) => Category::query()
                    ->where('kegiatan', $get('kegiatan'))
                    ->where('tingkat_kegiatan', $get('tingkat_kegiatan'))
                    ->select('peran_prestasi')
                    ->distinct()
                    ->pluck('peran_prestasi', 'peran_prestasi'))
                ->required()
                ->reactive()
                ->disabled(fn(Get $get) => blank($get('tingkat_kegiatan')) || $isProdi)
                ->afterStateHydrated(function ($component, $get) {
                    $kategori_id = $get('kategori_id');
                    $category = Category::find($kategori_id);
                    $component->state($category ? $category->peran_prestasi : null);
                })
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

            Forms\Components\TextInput::make('poin')
                ->label('Points')
                ->afterStateHydrated(function ($component, $get) {
                    $kategori_id = $get('kategori_id');
                    $category = Category::find($kategori_id);
                    $component->state($category ? $category->poin : null);
                })
                ->disabled()
                ->required(),

            Forms\Components\Select::make('jenis_pencapaian')
                ->label('Achievement Type')
                ->required()
                ->options([
                    'Akademik' => 'Akademik',
                    'Non-Akademik' => 'Non-Akademik',
                ])
                ->disabled($isProdi),

            Forms\Components\FileUpload::make('file_path')
                ->label('Upload PDF')
                ->disk('public')
                ->directory(function ($get) {
                    $userId = $get('user_id');
                    $user = \App\Models\User::find($userId);
                    $nim_nip = $user?->nim_nip ?? 'unknown';
                    return "portofolio/{$nim_nip}";
                })
                ->visibility('public')
                ->acceptedFileTypes(['application/pdf'])
                ->maxSize(2048)
                ->getUploadedFileNameForStorageUsing(function ($file, $get) {
                    $extension = $file->getClientOriginalExtension();
                    $timestamp = time();
                    return "{$timestamp}.{$extension}";
                })
                ->required()
                ->disabled($isProdi),

            Forms\Components\Hidden::make('kategori_id')->required(),

            Forms\Components\Hidden::make('user_id')
                ->default(auth()->id())
                ->required(),

            Forms\Components\Select::make('status')
                ->label('Status')
                ->options([
                    'revise' => 'Revise',
                    'on-review' => 'On Review',
                    'accepted' => 'Accepted',
                ])
                ->required()
                ->visible(!$isMahasiswa),

            Forms\Components\TextArea::make('feedback')
                ->label('Feedback')
                ->required()
                ->visible(!$isMahasiswa),
        ];

        return $form->schema($formSchema);
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
                    ->searchable()
                    ->sortable()
                    ->visible($isProdi),
                Tables\Columns\TextColumn::make('nama_kegiatan')
                    ->label('Event')
                    ->searchable(),
                Tables\Columns\TextColumn::make('jenis_pencapaian')
                    ->label('Achievement Type')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('category.poin')
                    ->label('Points')
                    ->sortable(),
                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->sortable(),
                Tables\Columns\TextColumn::make('feedback')
                    ->label('Feedback')
                    ->searchable(),
                Tables\Columns\TextColumn::make('tanggal_kegiatan')
                    ->label('Event Date')
                    ->searchable(),
                // Tables\Columns\TextColumn::make('file_path')
                //     ->label('File PDF')
                //     ->getStateUsing(fn($record) => basename($record->file_path))
                //     ->formatStateUsing(function ($state, $record) {
                //         if (!$record->file_path) {
                //             return new HtmlString('-');
                //         }

                //         $url = Storage::disk('public')->url($record->file_path);

                //         return new HtmlString("<a href='{$url}' target='_blank' class='text-primary-600 hover:underline'>View PDF</a>");
                //     }),
            ])
            ->defaultSort('created_at', 'desc')
            ->filters([
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'revise' => 'Revise',
                        'on-review' => 'On Review',
                        'accepted' => 'Accepted',
                    ])
                    ->multiple(),
                Tables\Filters\SelectFilter::make('jenis_pencapaian')
                    ->options([
                        'Akademik' => 'Akademik',
                        'Non-Akademik' => 'Non Akademik',
                    ])
                    ->multiple()
            ])
            ->actions([
                ActionGroup::make([
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
            ->headerActions([
                Tables\Actions\Action::make('Generate Portfolio')
                    ->color('gray')
                    ->url(fn() => route('download.portfolio'))
                    ->openUrlInNewTab()
                    ->visible($isMahasiswa),
                ExportAction::make()->exporter(PortfolioExporter::class)->visible($isProdi)
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ])
            ->recordUrl(null);
    }

    public static function getEloquentQuery(): Builder
    {
        $user = Filament::auth()->user();
        if ($user->hasRole('prodi') || $user->hasRole('super_admin')) {
            return parent::getEloquentQuery();
        }
        return parent::getEloquentQuery()->where('user_id', $user->id);
    }

    public static function getRelations(): array
    {
        return [];
    }
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPortfolios::route('/'),
            'create' => Pages\CreatePortfolio::route('/create'),
            'edit' => Pages\EditPortfolio::route('/{record}/edit'),
        ];
    }
}
