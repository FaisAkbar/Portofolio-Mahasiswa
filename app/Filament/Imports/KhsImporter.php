<?php

namespace App\Filament\Imports;

use App\Models\Khs;
use App\Models\User;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class KhsImporter extends Importer
{
    protected static ?string $model = Khs::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('nim_nip')
                ->label('NIM')
                ->exampleHeader('NIM')
                ->requiredMapping()
                ->rules([
                    'required',
                    Rule::exists('users', 'nim_nip'),
                ])
                ->fillRecordUsing(fn () => null)
                ->helperText('NIM harus valid dan sudah terdaftar.'),
            ImportColumn::make('semester')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer', 'min:1', 'max:14']),
            ImportColumn::make('ip_semester')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'numeric', 'between:0,4']),
        ];
    }

    public function resolveRecord(): ?Khs
    {
        $user = User::where('nim_nip', $this->data['nim_nip'])->first();

        if (!$user) {
            throw ValidationException::withMessages([
                'nim_nip' => 'NIM tidak ditemukan.',
            ]);
        }

        $exists = Khs::where('user_id', $user->id)
            ->where('semester', $this->data['semester'])
            ->exists();

        if ($exists) {
            throw ValidationException::withMessages([
                'semester' => "User dengan NIM/NIP {$this->data['nim_nip']} sudah memiliki data semester {$this->data['semester']}.",
            ]);
        }

        return new Khs([
            'user_id' => $user->id,
        ]);
    }

    protected function beforeCreate(): void
    {
        $user = User::where('nim_nip', $this->data['nim_nip'])->first();

        if ($user) {
            $this->record->user_id = $user->id;
        }
    }

    public function getValidationMessages(): array
    {
        return [
            'nim_nip.required' => 'Kolom NIM tidak boleh kosong.',
            'nim_nip.exists' => 'NIM tidak ditemukan dalam data pengguna.',
            'semester.required' => 'Semester wajib diisi.',
            'semester.integer' => 'Semester harus berupa angka.',
            'semester.between' => 'Semester harus antara 1 sampai 14.',
            'ip_semester.required' => 'IP Semester wajib diisi.',
            'ip_semester.numeric' => 'IP Semester harus berupa angka.',
            'ip_semester.between' => 'IP Semester harus antara 0.00 sampai 4.00.',
        ];
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Impor Nilai Akademik Mahasiswa telah selesai dengan ' . number_format($import->successful_rows) . ' ' . str('baris')->plural($import->successful_rows) . ' berhasil diimpor.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('baris')->plural($failedRowsCount) . ' gagal diimpor.';
        }

        return $body;
    }
}
