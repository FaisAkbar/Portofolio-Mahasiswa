<?php

namespace App\Filament\Widgets;

use App\Models\User;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Illuminate\Support\Facades\Log;

class ProdiStateOverview extends BaseWidget
{
    use HasWidgetShield, InteractsWithPageFilters;

    protected ?string $heading = 'Statistik Halaman Prodi';

    protected function getStats(): array
    {
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;
        function applyFilters($query, $yearCode, $prodiCode)
        {
            if ($yearCode) {
                $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
            }

            if ($prodiCode) {
                $year = substr($prodiCode, 0, 2);
                if ((int)$year >= 24) {
                    $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            }

            return $query;
        }
        $totalMahasiswaQuery = User::query()
            ->role('mahasiswa');
        $totalMahasiswaQuery = applyFilters($totalMahasiswaQuery, $yearCode, $prodiCode);
        $totalMahasiswa = $totalMahasiswaQuery->count();
        $academicStudentsQuery = User::query()
            ->role('mahasiswa')
            ->whereHas('portfolios', function ($query) {
                $query->where('status', 'Diterima');
            });
        $academicStudentsQuery = applyFilters($academicStudentsQuery, $yearCode, $prodiCode);
        $academicStudents = $academicStudentsQuery
            ->get()
            ->filter(function ($user) {
                $academicPoints = $user->portfolios->where('jenis_pencapaian', 'Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                $nonAcademicPoints = $user->portfolios->where('jenis_pencapaian', 'Non-Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                return $academicPoints > $nonAcademicPoints;
            })
            ->count();
        $nonAcademicStudentsQuery = User::query()
            ->role('mahasiswa')
            ->whereHas('portfolios', function ($query) {
                $query->where('status', 'Diterima');
            });
        $nonAcademicStudentsQuery = applyFilters($nonAcademicStudentsQuery, $yearCode, $prodiCode);
        $nonAcademicStudents = $nonAcademicStudentsQuery
            ->get()
            ->filter(function ($user) {
                $academicPoints = $user->portfolios->where('jenis_pencapaian', 'Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                $nonAcademicPoints = $user->portfolios->where('jenis_pencapaian', 'Non-Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                return $nonAcademicPoints >= $academicPoints;
            })
            ->count();
        return [
            Stat::make('Total Mahasiswa', $totalMahasiswa),
            Stat::make('Mahasiswa Akademik', $academicStudents),
            Stat::make('Mahasiswa Non-Akademik', $nonAcademicStudents),
        ];
    }
}
