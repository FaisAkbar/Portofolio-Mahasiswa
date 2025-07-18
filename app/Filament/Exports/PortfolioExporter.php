<?php

namespace App\Filament\Exports;

use App\Models\Portfolio;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class PortfolioExporter extends Exporter
{
    protected static ?string $model = Portfolio::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('id'),
            ExportColumn::make('user.name'),
            ExportColumn::make('category.kegiatan'),
            ExportColumn::make('tanggal_kegiatan'),
            ExportColumn::make('jenis_pencapaian'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        $body = 'Your portfolio export has completed and ' . number_format($export->successful_rows) . ' ' . str('row')->plural($export->successful_rows) . ' exported.';

        if ($failedRowsCount = $export->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to export.';
        }

        return $body;
    }
}
