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
        $angkatan = $this->filters['angkatan'] ?? null;
        $prodi = $this->filters['prodi'] ?? null;
        function applyFilters($query, $angkatan, $prodi)
        {
            if (auth()->user()->hasRole('prodi') || auth()->user()->hasRole('super_admin')) {
                if ($angkatan) {
                    $query->where('users.angkatan', $angkatan);
            }
                if ($prodi) {
                    $query->where('users.prodi', $prodi);
                }
            }

            return $query;
        }
        $totalMahasiswaQuery = User::query()
            ->role('mahasiswa');
        $totalMahasiswaQuery = applyFilters($totalMahasiswaQuery, $angkatan, $prodi);
        $totalMahasiswa = $totalMahasiswaQuery->count();
        $academicStudentsQuery = User::query()
            ->role('mahasiswa')
            ->whereHas('portfolios', function ($query) {
                $query->where('status', 'Diterima');
            });
        $academicStudentsQuery = applyFilters($academicStudentsQuery, $angkatan, $prodi);
        $academicStudents = $academicStudentsQuery
            ->get()
            ->filter(function ($user) {
                $academicPoints = $user->portfolios->where('jenis_pencapaian', 'Hard Skill dan Soft Skill')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                $nonAcademicPoints = $user->portfolios->where('jenis_pencapaian', 'Olahraga dan Seni')->sum(function ($portfolio) {
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
        $nonAcademicStudentsQuery = applyFilters($nonAcademicStudentsQuery, $angkatan, $prodi);
        $nonAcademicStudents = $nonAcademicStudentsQuery
            ->get()
            ->filter(function ($user) {
                $academicPoints = $user->portfolios->where('jenis_pencapaian', 'Hard Skill dan Soft Skill')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                $nonAcademicPoints = $user->portfolios->where('jenis_pencapaian', 'Olahraga dan Seni')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                return $nonAcademicPoints >= $academicPoints;
            })
            ->count();
        return [
            Stat::make('Total Mahasiswa', $totalMahasiswa),
            Stat::make('Mahasiswa Hard Skill dan Soft Skill', $academicStudents),
            Stat::make('Mahasiswa Olahraga dan Seni', $nonAcademicStudents),
        ];
    }
}
