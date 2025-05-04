<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Category; // Ganti jika nama model kamu berbeda
use Illuminate\Support\Facades\Log;
use PhpOffice\PhpSpreadsheet\IOFactory;

class CategorySeeder extends Seeder
{
    public function run()
    {
        $filePath = database_path('seeders/data/category.xlsx');

        if (!File::exists($filePath)) {
            $this->command->error("File not found at: $filePath");
            return;
        }

        // Load file Excel
        $spreadsheet = IOFactory::load($filePath);
        $worksheet = $spreadsheet->getActiveSheet();
        $rows = $worksheet->toArray(null, true, true, true);

        // Lewati header, mulai dari baris ke-2
        foreach (array_slice($rows, 1) as $row) {
            $kegiatan        = $row['A'] ?? null;
            $tingkat         = $row['B'] ?? null;
            $peran_prestasi  = $row['C'] ?? null;
            $poin            = $row['D'] ?? null;

            // Simpan ke database
            Category::create([
                'kegiatan'        => $kegiatan,
                'tingkat_kegiatan'=> $tingkat,
                'peran_prestasi'  => $peran_prestasi,
                'poin'            => $poin,
            ]);
        }

        $this->command->info('CategorySeeder completed successfully.');
    }
}
