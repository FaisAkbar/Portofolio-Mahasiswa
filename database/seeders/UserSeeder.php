<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        $filePath = database_path('seeders/data/user.xlsx');

        $spreadsheet = IOFactory::load($filePath);
        $sheet = $spreadsheet->getActiveSheet();
        $rows = $sheet->toArray(null, true, true, true);

        foreach (array_slice($rows, 1) as $row) {
            $user = User::create([
                'name'     => $row['A'], // Ganti sesuai urutan kolom
                'nim_nip'  => $row['B'],
                'email'    => $row['C'],
                'password' => Hash::make($row['D'] ?? 'password123'),
            ]);

            // Tambahkan roles jika ada
            if (!empty($row['E'])) {
                $roleNames = explode(',', $row['E']); // Bisa banyak role dipisah koma
                foreach ($roleNames as $roleName) {
                    $roleName = trim($roleName);
                    if (!empty($roleName)) {
                        $role = Role::firstOrCreate(['name' => $roleName]);
                        $user->assignRole($role);
                    }
                }
            }
        }
    }
}
