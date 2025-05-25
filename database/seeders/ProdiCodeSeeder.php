<?php

namespace Database\Seeders;

use App\Models\Faculty;
use App\Models\Prodi;
use App\Models\ProdiCode;
use App\Models\UniversityBranch;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Maatwebsite\Excel\Facades\Excel;
use PhpOffice\PhpSpreadsheet\IOFactory;

class ProdiCodeSeeder extends Seeder
{
    public function run()
    {
        $filePath = database_path('seeders/data/prodicode.xlsx');
        if (!File::exists($filePath)) {
            $this->command->error("File not found: $filePath");
            return;
        }
        $spreadsheet = IOFactory::load($filePath);
        $universityBranchesSheet = $spreadsheet->getSheetByName('univ');
        $facultiesSheet = $spreadsheet->getSheetByName('faculty');
        $prodisSheet = $spreadsheet->getSheetByName('prodi');
        $universityBranches = $universityBranchesSheet->toArray(null, true, true, true);
        $faculties = $facultiesSheet->toArray(null, true, true, true);
        $prodis = $prodisSheet->toArray(null, true, true, true);
        foreach (array_slice($universityBranches, 1) as $row) {
            if (!isset($row['A']) || !isset($row['B'])) continue;

            $universityBranch = UniversityBranch::create([
                'university_branch' => $row['A'],
                'branch_code' => $row['B'],
            ]);
        }
        foreach (array_slice($faculties, 1) as $row) {
            if (!isset($row['A']) || !isset($row['B']) || !isset($row['C'])) continue;

            $faculty = Faculty::create([
                'faculty_name' => $row['A'],
                'faculty_code' => $row['B'],
                'university_branch_id' => $row['C'],
            ]);
        }
        foreach (array_slice($prodis, 1) as $row) {
            if (!isset($row['A']) || !isset($row['B']) || !isset($row['C'])) continue;

            Prodi::create([
                'prodi_name' => $row['A'],
                'prodi_code' => $row['B'],
                'faculty_id' => $row['C'],
            ]);
        }
    }
}
