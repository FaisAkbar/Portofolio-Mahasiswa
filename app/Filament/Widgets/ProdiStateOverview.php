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

    protected function getStats(): array
    {
        // Retrieve the filters from the request (if they exist)
        $yearCode = $this->filters['year_code'] ?? null;
        $prodiCode = $this->filters['prodi_code'] ?? null;

        // Function to apply filters for year_code and prodi_code to the query
        function applyFilters($query, $yearCode, $prodiCode)
        {
            if ($yearCode) {
                $query->whereRaw('SUBSTRING(nim_nip, 1, 2) = ?', [$yearCode]);
            }

            if ($prodiCode) {
                $year = substr($prodiCode, 0, 2);  // Get the first 2 digits of prodiCode for year check
                
                // Determine the correct starting position for prodi code extraction based on the year
                if ((int)$year >= 24) {
                    // If the year is 24 or above, the prodi code starts at position 6 (index 5)
                    $query->whereRaw('SUBSTRING(nim_nip, 6, 3) = ?', [$prodiCode]);
                } else {
                    // If the year is < 24, the prodi code starts at position 4 (index 3)
                    $query->whereRaw('SUBSTRING(nim_nip, 4, 3) = ?', [$prodiCode]);
                }
            }

            return $query;
        }

        // Get total mahasiswa users
        $totalMahasiswaQuery = User::query()
            ->role('mahasiswa');

        // Apply filters to the total mahasiswa query
        $totalMahasiswaQuery = applyFilters($totalMahasiswaQuery, $yearCode, $prodiCode);

        // Get the total count of mahasiswa users after applying filters
        $totalMahasiswa = $totalMahasiswaQuery->count();

        // Get academic students with filters applied
        $academicStudentsQuery = User::query()
            ->role('mahasiswa')
            ->whereHas('portfolios', function ($query) {
                $query->where('status', 'accepted');
            });

        // Apply filters to the academic students query
        $academicStudentsQuery = applyFilters($academicStudentsQuery, $yearCode, $prodiCode);

        // Get the filtered academic students and then apply the custom filtering logic
        $academicStudents = $academicStudentsQuery
            ->get()
            ->filter(function ($user) {
                $academicPoints = $user->portfolios->where('jenis_pencapaian', 'Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                $nonAcademicPoints = $user->portfolios->where('jenis_pencapaian', 'Non-Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                return $academicPoints > $nonAcademicPoints; // Only include users where academic points are higher
            })
            ->count(); // Count academic students

        // Get non-academic students with filters applied
        $nonAcademicStudentsQuery = User::query()
            ->role('mahasiswa')
            ->whereHas('portfolios', function ($query) {
                $query->where('status', 'accepted');
            });

        // Apply filters to the non-academic students query
        $nonAcademicStudentsQuery = applyFilters($nonAcademicStudentsQuery, $yearCode, $prodiCode);

        // Get the filtered non-academic students and then apply the custom filtering logic
        $nonAcademicStudents = $nonAcademicStudentsQuery
            ->get()
            ->filter(function ($user) {
                $academicPoints = $user->portfolios->where('jenis_pencapaian', 'Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                $nonAcademicPoints = $user->portfolios->where('jenis_pencapaian', 'Non-Akademik')->sum(function ($portfolio) {
                    return $portfolio->category->poin;
                });

                return $nonAcademicPoints >= $academicPoints; // Only include users where non-academic points are higher
            })
            ->count(); // Count non-academic students

        // Return the stats with the filters applied
        return [
            Stat::make('Total Mahasiswa Users', $totalMahasiswa),
            Stat::make('Academic Students', $academicStudents),
            Stat::make('Non-Academic Students', $nonAcademicStudents),
        ];
    }
}
