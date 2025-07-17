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
    protected static ?string $navigationLabel = 'Non Akademik';
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationGroup = 'Data Mahasiswa';
    protected static ?string $slug = 'non-akademik';
    protected static ?string $pluralModelLabel = 'Nilai Non Akademik';
    protected static ?string $modelLabel = 'Nilai Non Akademik';
    // protected ?string $subheading = 'This is the subheading.';

    public static function form(Form $form): Form
    {
        $user = Filament::auth()->user();
        $isMahasiswa = $user->hasRole('mahasiswa');
        $isProdi = $user->hasRole('prodi') || $user->hasRole('super_admin');

        $formSchema = [
            Forms\Components\TextInput::make('nama_kegiatan')
                ->label('Nama Kegiatan')
                ->helperText('Masukkan nama kegiatan Anda')
                ->required()
                ->maxLength(255)
                ->disabled($isProdi),

            Forms\Components\DatePicker::make('tanggal_kegiatan')
                ->label('Tanggal Kegiatan')
                ->helperText('Masukkan tanggal kegiatan Anda')
                ->required()
                ->disabled($isProdi),

            Forms\Components\Select::make('kegiatan')
                ->label('Jenis Kegiatan')
                ->helperText('Pilih jenis kegiatan yang sesuai')
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
                ->label('Tingkat Kegiatan')
                ->helperText('Pilih tingkat kegiatan yang sesuai')
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
                ->label('Peran Prestasi')
                ->helperText('Pilih peran atau prestasi yang sesuai')
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
                ->label('Poin')
                ->afterStateHydrated(function ($component, $get) {
                    $kategori_id = $get('kategori_id');
                    $category = Category::find($kategori_id);
                    $component->state($category ? $category->poin : null);
                })
                ->disabled()
                ->required(),

            Forms\Components\Select::make('jenis_pencapaian')
                ->label('Jenis Pencapaian')
                ->helperText('Pilih jenis pencapaian yang sesuai')
                ->required()
                ->options([
                    'Hard Skill dan Soft Skill' => 'Hard Skill dan Soft Skill',
                    'Olahraga dan Seni' => 'Olahraga dan Seni',
                ])
                ->disabled($isProdi),

            Forms\Components\FileUpload::make('file_path')
                ->label('Unggah PDF')
                ->helperText('Unggah file serifikat atau dokumen pendukung dalam format PDF. Maksimal ukuran 2MB.')
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
                    'Revisi' => 'Revisi',
                    'Dalam Tinjauan' => 'Dalam Tinjauan',
                    'Diterima' => 'Diterima',
                ])
                ->required()
                ->visible(!$isMahasiswa),

            Forms\Components\Textarea::make('feedback')
                ->label('Umpan Balik')
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
                    ->label('Nama')
                    ->searchable()
                    ->sortable()
                    ->visible($isProdi),
                Tables\Columns\TextColumn::make('nama_kegiatan')
                    ->label('Nama Kegiatan')
                    ->wrap()
                    ->searchable(),
                Tables\Columns\TextColumn::make('jenis_pencapaian')
                    ->label('Jenis Pencapaian')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('category.poin')
                    ->label('Poin')
                    ->sortable(),
                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->color(fn($record) => match ($record->status) {
                        'Revisi' => 'danger',
                        'Dalam Tinjauan' => 'primary',
                        'Diterima' => 'success',
                    })
                    ->badge()
                    ->sortable(),
                Tables\Columns\TextColumn::make('feedback')
                    ->label('Umpan Balik')
                    ->searchable(),
                Tables\Columns\TextColumn::make('tanggal_kegiatan')
                    ->label('Tanggal Kegiatan')
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
                        'Revisi' => 'Revisi',
                        'Dalam Tinjauan' => 'Dalam Tinjauan',
                        'Diterima' => 'Diterima',
                    ])
                    ->multiple(),
                Tables\Filters\SelectFilter::make('jenis_pencapaian')
                    ->options([
                        'Hard Skill dan Soft Skill' => 'Hard Skill dan Soft Skill',
                        'Olahraga dan Seni' => 'Olahraga dan Seni',
                    ])
                    ->multiple()
            ])
            ->actions([
                ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->url(fn($record) => Storage::disk('public')->url($record->file_path))
                        ->openUrlInNewTab()
                        ->label('Lihat PDF')
                        ->icon('heroicon-o-eye'),
                    Tables\Actions\ViewAction::make()
                        ->label('Lihat Detail Data'),
                    Tables\Actions\EditAction::make()
                        ->label($isMahasiswa ? 'Edit' : 'Validasi Data'),
                    Tables\Actions\DeleteAction::make(),
                ])
                    ->label('Aksi')
                    ->icon('heroicon-m-ellipsis-vertical')
                    ->size(ActionSize::Small)
                    ->color('primary')
                    ->button()
            ])
            ->headerActions([
                Tables\Actions\Action::make('Unduh Portofolio')
                    ->color('gray')
                    ->url(fn() => route('download.portfolio'))
                    ->openUrlInNewTab()
                    ->visible($isMahasiswa),
                ExportAction::make()
                    ->exporter(PortfolioExporter::class)
                    ->filename(fn() => 'NonAkademik_' . auth()->user()->nim_nip . '_' . now()->format('dmY'))
                ->label('Ekspor Data Non Akademik')
                ->visible($isProdi)
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
