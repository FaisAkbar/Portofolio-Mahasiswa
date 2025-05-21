<?php

namespace App\Filament\Exports;

use App\Models\Recap;
use App\Models\User;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class RecapExporter extends Exporter
{
    protected static ?string $model = User::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('id'),
            ExportColumn::make('name')
            -> label('Nama'),
            ExportColumn::make('nim_nip')
            ->label('NIM/NIP'),
            // ipk
            ExportColumn::make('ipk')
            ->label('IPK')
            ->formatStateUsing(function ($state) {
                return number_format($state, 2);
            }),
            // academic_points
            ExportColumn::make('academic_points')
            ->label('Poin Akademik'),
            
            // non_academic_points
            ExportColumn::make('non_academic_points')
            ->label('Poin Non Akademik')
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        $body = 'Your Recap File export has completed and ' . number_format($export->successful_rows) . ' ' . str('row')->plural($export->successful_rows) . ' exported.';

        if ($failedRowsCount = $export->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to export.';
        }

        return $body;
    }
}
