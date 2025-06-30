<?php

namespace App\Filament\Resources\KhsResource\Pages;

use App\Filament\Resources\KhsResource;
use Filament\Actions;
use Filament\Facades\Filament;
use Filament\Resources\Pages\ListRecords;

class ListKhs extends ListRecords
{
    protected static string $resource = KhsResource::class;

    public function getSubheading(): ?string
    {
        $user = Filament::auth()->user();

        if ($user->hasRole('mahasiswa')) {
            return 'Halaman untuk menambah, mengelola, dan memantau Kartu Hasil Studi Anda';
        }

        if ($user->hasRole('prodi') || $user->hasRole('super_admin')) {
            return 'Halaman untuk meninjau data hasil studi mahasiswa';
        }

        return 'Daftar Portofolio';
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
