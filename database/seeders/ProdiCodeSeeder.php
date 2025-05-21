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
        // Define the file path to the Excel file
        $filePath = database_path('seeders/data/prodicode.xlsx');

        // Check if the file exists
        if (!File::exists($filePath)) {
            $this->command->error("File not found: $filePath");
            return;
        }

        // Load the spreadsheet
        $spreadsheet = IOFactory::load($filePath);

        // Load the specific sheets
        $universityBranchesSheet = $spreadsheet->getSheetByName('univ');
        $facultiesSheet = $spreadsheet->getSheetByName('faculty');
        $prodisSheet = $spreadsheet->getSheetByName('prodi');

        // Convert the sheets to arrays
        $universityBranches = $universityBranchesSheet->toArray(null, true, true, true);
        $faculties = $facultiesSheet->toArray(null, true, true, true);
        $prodis = $prodisSheet->toArray(null, true, true, true);

        // Seed University Branches
        foreach (array_slice($universityBranches, 1) as $row) {
            // Ensure the row has valid data before inserting
            if (!isset($row['A']) || !isset($row['B'])) continue;

            $universityBranch = UniversityBranch::create([
                'university_branch' => $row['A'], // Assuming university branch is in column A
                'branch_code' => $row['B'],       // Assuming branch code is in column B
            ]);
        }

        // Seed Faculties
        foreach (array_slice($faculties, 1) as $row) {
            // Ensure the row has valid data before inserting
            if (!isset($row['A']) || !isset($row['B']) || !isset($row['C'])) continue;

            $faculty = Faculty::create([
                'faculty_name' => $row['A'], // Assuming faculty name is in column C
                'faculty_code' => $row['B'], // Assuming faculty code is in column D
                'university_branch_id' => $row['C'], // Link to university branch (column A)
            ]);
        }

        // Seed Prodis
        foreach (array_slice($prodis, 1) as $row) {
            // Ensure the row has valid data before inserting
            if (!isset($row['A']) || !isset($row['B']) || !isset($row['C'])) continue;

            Prodi::create([
                'prodi_name' => $row['A'],  // Assuming prodi name is in column E
                'prodi_code' => $row['B'],  // Assuming prodi code is in column F
                'faculty_id' => $row['C'], // Link to faculty (column C)
            ]);
        }
    }
}
