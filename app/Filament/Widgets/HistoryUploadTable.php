<?php

namespace App\Filament\Widgets;

use App\Models\Portfolio;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class HistoryUploadTable extends BaseWidget
{
    use HasWidgetShield;

    protected static ?int $sort = 7;
    protected int | string | array $columnSpan = 'full';
    public function table(Table $table): Table
    {
        return $table
            ->query(
                Portfolio::where('user_id', auth()->id())  // Get portfolios of the logged-in user
                    ->orderBy('created_at', 'desc') // Order by created_at in descending order (latest on top)
            )
            ->columns([
                Tables\Columns\TextColumn::make('index')
                    ->label('No')
                    ->state(function ($record, $livewire) {
                        static $index = 0;
                        return ++$index;
                    }),
                Tables\Columns\TextColumn::make('nama_kegiatan')
                    ->label('Nama Kegiatan'),
                Tables\Columns\TextColumn::make('jenis_pencapaian')
                    ->label('Jenis Pencapaian'),
                Tables\Columns\TextColumn::make('nama_kegiatan')
                    ->label('Nama Kegiatan'),
                Tables\Columns\TextColumn::make('status')
                    ->label('Status'),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Created At')
                    ->dateTime(), // Format the date column
                // Add any additional columns you want from the Portfolio table
            ]);
    }
}
