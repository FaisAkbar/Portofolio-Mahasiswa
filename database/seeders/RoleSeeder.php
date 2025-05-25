<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Illuminate\Support\Facades\File;

class RoleSeeder extends Seeder
{
    public function run()
    {
        $filePath = database_path('seeders/data/role.xlsx');

        if (!File::exists($filePath)) {
            $this->command->error("File not found: $filePath");
            return;
        }

        $spreadsheet = IOFactory::load($filePath);
        $worksheet = $spreadsheet->getActiveSheet();
        $rows = $worksheet->toArray(null, true, true, true);
        foreach (array_slice($rows, 1) as $row) {
            $name = trim($row['A']);

            if (!$name) continue;

            Role::firstOrCreate([
                'name' => $name,
                'guard_name' => 'web',
            ]);
        }

        $this->command->info('Roles successfully seeded from role.xlsx.');
    }
}
