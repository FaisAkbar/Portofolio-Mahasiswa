<?php

namespace App\Filament\Pages;

use App\Models\Prodi;
use App\Models\User;
use Filament\Facades\Filament;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Pages\Dashboard\Concerns\HasFiltersForm;

class Dashboard extends \Filament\Pages\Dashboard
{
    use HasFiltersForm;
    protected static ?int $sort = 15;
    
    public function filtersForm(Form $form): Form
    {
        $user = Filament::auth()->user();
        $isProdi = false;
        if($user) {
            $isProdi = $user->hasRole('prodi') || $user->hasRole('super_admin');
        }
        return $form
            ->schema([
                Section::make('Filter')
                    ->schema([
                        Select::make('year_code')
                            ->label('Kode Angkatan')
                            ->options(function () {
                                return User::selectRaw('DISTINCT SUBSTRING(nim_nip, 1, 2) as year_code')
                                    ->role('mahasiswa')
                                    ->pluck('year_code', 'year_code')
                                    ->toArray();
                            })
                            ->placeholder('Pilih Kode Angkatan'),

                        Select::make('prodi_code')
                            ->label('Kode Program Studi')
                            ->options(function () {
                                $prodis = Prodi::all();
                                $options = [];
                                foreach ($prodis as $prodi) {
                                    $options[$prodi->prodi_code] = $prodi->prodi_code . ' - ' . $prodi->prodi_name;
                                }

                                return $options;
                            })
                            ->placeholder('Pilih Kode Program Studi'),
                    ])
                    ->columns(2)
                    ->visible($isProdi),
            ]);
    }
}