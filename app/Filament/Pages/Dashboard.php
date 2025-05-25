<?php

namespace App\Filament\Pages;

use App\Models\Prodi;
use App\Models\User;
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
        return $form
            ->schema([
                Section::make('Filter Options')
                    ->schema([
                        Select::make('year_code')
                            ->label('Year Code')
                            ->options(function () {
                                return User::selectRaw('DISTINCT SUBSTRING(nim_nip, 1, 2) as year_code')
                                    ->role('mahasiswa')
                                    ->pluck('year_code', 'year_code')
                                    ->toArray();
                            })
                            ->placeholder('Select Year Code'),

                        Select::make('prodi_code')
                            ->label('Prodi Code')
                            ->options(function () {
                                $prodis = Prodi::all();
                                $options = [];
                                foreach ($prodis as $prodi) {
                                    $options[$prodi->prodi_code] = $prodi->prodi_code . ' - ' . $prodi->prodi_name;
                                }

                                return $options;
                            })
                            ->placeholder('Select Prodi Code'),
                    ])
                    ->columns(2),
            ]);
    }
}