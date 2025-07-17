<?php

namespace App\Filament\Resources\PortfolioResource\Pages;

use App\Filament\Resources\PortfolioResource;
use Filament\Actions;
use Filament\Facades\Filament;
use Filament\Resources\Pages\ListRecords;

class ListPortfolios extends ListRecords
{
    protected static string $resource = PortfolioResource::class;

    public function getSubheading(): ?string
    {
        $user = Filament::auth()->user();

        if ($user->hasRole('mahasiswa')) {
            return 'Halaman untuk mencatat, mengelola, dan memantau semua pencapaian Anda';
        }

        if ($user->hasRole('prodi') || $user->hasRole('super_admin')) {
            return 'Halaman untuk meninjau dan memverifikasi pencapaian mahasiswa';
        }

        return 'Daftar Nilai Non Akademik';
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
