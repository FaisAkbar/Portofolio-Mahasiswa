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
        if ($user) {
            $isProdi = $user->hasRole('prodi') || $user->hasRole('super_admin');
        }
        return $form
            ->schema([
                Section::make('Filter')
                    ->schema([
                        Select::make('angkatan')
                            ->label('Angkatan')
                            ->options(function () {
                                return User::query()
                                    ->whereNotNull('angkatan')
                                    ->where('angkatan', '!=', '')
                                    ->select('angkatan')
                                    ->distinct()
                                    ->orderBy('angkatan', 'desc')
                                    ->pluck('angkatan', 'angkatan')
                                    ->toArray();
                            })
                            ->placeholder('Pilih Angkatan'),

                        Select::make('prodi')
                            ->label('Program Studi')
                            ->options(function () {
                                return User::query()
                                    ->whereNotNull('prodi')
                                    ->where('prodi', '!=', '')
                                    ->select('prodi')
                                    ->distinct()
                                    ->orderBy('prodi')
                                    ->pluck('prodi', 'prodi')
                                    ->toArray();
                            })
                            ->placeholder('Pilih Program Studi'),
                    ])
                    ->columns(2)
                    ->visible($isProdi),
            ]);
    }
}
