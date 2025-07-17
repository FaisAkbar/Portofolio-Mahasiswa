<?php

namespace App\Filament\Resources\KhsResource\Pages;

use App\Filament\Resources\KhsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateKhs extends CreateRecord
{
    protected static string $resource = KhsResource::class;

    protected static bool $canCreateAnother = false;
    
    // public function getSubheading(): ?string
    // {
    //     $user = auth()->user();

    //     if ($user->hasRole('mahasiswa')) {
    //         return 'Halaman untuk menambah Kartu Hasil Studi Anda';
    //     }

    //     if ($user->hasRole('prodi') || $user->hasRole('super_admin')) {
    //         return 'Halaman untuk menambahkan data hasil studi mahasiswa';
    //     }

    //     return 'Tambah Kartu Hasil Studi';
    // }

    // Mengubah judul dari "Buat KHS" menjadi "Tambah KHS"

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
