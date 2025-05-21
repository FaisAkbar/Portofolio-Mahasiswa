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
                        // Year Code Filter
                        Select::make('year_code')
                            ->label('Year Code')
                            ->options(function () {
                                // Dynamically get unique year codes from nim_nip (first 2 digits)
                                return User::selectRaw('DISTINCT SUBSTRING(nim_nip, 1, 2) as year_code')
                                    ->role('mahasiswa')
                                    ->pluck('year_code', 'year_code')
                                    ->toArray();
                            })
                            ->placeholder('Select Year Code'),

                        // Prodi Code Filter
                        Select::make('prodi_code')
                            ->label('Prodi Code')
                            ->options(function () {
                                // Fetch all prodi codes and names from the prodis table
                                $prodis = Prodi::all();
                                $options = [];

                                // Format the options as 'prodi_code - prodi_name'
                                foreach ($prodis as $prodi) {
                                    $options[$prodi->prodi_code] = $prodi->prodi_code . ' - ' . $prodi->prodi_name;
                                }

                                return $options;
                            })
                            ->placeholder('Select Prodi Code'),
                    ])
                    ->columns(2), // Display the filters in three columns
            ]);
    }
}