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
                ->helperText('NIM/NIP must be unique and not empty.'),
            
            ImportColumn::make('email')
                ->requiredMapping()
                ->rules([
                    'required',
                    'email',
                    'max:255',
                    Rule::unique('users')->ignore(request()->user()->id),
                ])
                ->helperText('Email must be valid and unique.'),
            
            ImportColumn::make('password')
                ->requiredMapping()
                ->rules(['required', 'max:255'])
                ->castStateUsing(function (string $state) {
                    if (blank($state)) {
                        return null;
                    }
                    return Hash::make($state);
                })
                ->helperText('Password must be hashed after import.'),
            
            ImportColumn::make('roles')
                ->requiredMapping()
                ->fillRecordUsing(function (User $record, string $state): void {
                })
                ->helperText('Role must be filled (e.g., mahasiswa or prodi).'),
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
            'name.required' => 'The name column must not be empty.',
            'nim_nip.required' => 'The NIM/NIP column must not be empty.',
            'email.required' => 'The email address is required.',
            'email.email' => 'Please enter a valid email address.',
            'password.required' => 'Password is required.',
            'password.min' => 'Password must be at least 8 characters long.',
            'nim_nip.unique' => 'The NIM/NIP has already been taken.',
            'email.unique' => 'The email address is already in use.',
        ];
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your user import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}
