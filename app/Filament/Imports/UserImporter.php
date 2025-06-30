<?php

namespace App\Filament\Imports;

use App\Models\User;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\Rule;

class UserImporter extends Importer
{
    protected static ?string $model = User::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('name')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            
            ImportColumn::make('nim_nip')
                ->requiredMapping()
                ->rules([
                    'required',
                    'max:255',
                    Rule::unique('users')->ignore(request()->user()->id),
                ])
                ->helperText('NIM/NIP harus unik dan tidak boleh kosong.'),
            
            ImportColumn::make('email')
                ->requiredMapping()
                ->rules([
                    'required',
                    'email',
                    'max:255',
                    Rule::unique('users')->ignore(request()->user()->id),
                ])
                ->helperText('Email harus valid dan unik.'),
            
            ImportColumn::make('password')
                ->requiredMapping()
                ->rules(['required', 'max:255'])
                ->castStateUsing(function (string $state) {
                    if (blank($state)) {
                        return null;
                    }
                    return Hash::make($state);
                })
                ->helperText('Password harus diisi dan minimal 8 karakter.'),
            
            ImportColumn::make('roles')
                ->requiredMapping()
                ->fillRecordUsing(function (User $record, string $state): void {
                })
                ->helperText('Role harus diisi (misalnya, mahasiswa atau prodi).'),
        ];
    }

    public function resolveRecord(): ?User
    {
        // return User::firstOrNew([
        //     // Update existing records, matching them by `$this->data['column_name']`
        //     'email' => $this->data['email'],
        // ]);

        return new User();
    }

    protected function afterCreate(): void
    {
        $roleName = $this->data['roles'];
        $role = DB::table('roles')->where('name', $roleName)->first();
        $userId = DB::table('users')->where('nim_nip', $this->record->nim_nip)->value('id');
        if ($role) {
            DB::table('model_has_roles')->insert([
                'role_id' => $role->id,
                'model_type' => 'App\Models\User',
                'model_id' => $userId,
            ]);
        }
    }

    public function getValidationMessages(): array
    {
        return [
            'name.required' => 'Kolom nama tidak boleh kosong.',
            'nim_nip.required' => 'Kolom NIM/NIP tidak boleh kosong.',
            'email.required' => 'Alamat email harus diisi.',
            'email.email' => 'Silakan masukkan alamat email yang valid.',
            'password.required' => 'Password harus diisi.',
            'password.min' => 'Password harus minimal 8 karakter.',
            'nim_nip.unique' => 'NIM/NIP sudah terdaftar.',
            'email.unique' => 'Alamat email sudah digunakan.',
        ];
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Proses impor pengguna Anda telah selesai dan ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' berhasil diimpor.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' gagal diimpor.';
        }

        return $body;
    }
}
