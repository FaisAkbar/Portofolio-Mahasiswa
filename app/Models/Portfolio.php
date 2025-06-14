<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class Portfolio extends Model
{
    use HasFactory;

    protected $guarded = ['id'];
    public function category()
    {
        return $this->belongsTo(Category::class, "kategori_id");
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    protected static function booted(): void
    {
        /**
         * Logic for cleaning up old files during an UPDATE.
         */
        static::updating(function ($user) {
            if ($user->isDirty('file_path')) {
                $oldAvatar = $user->getOriginal('file_path');

                if (!empty($oldAvatar)) {
                    if (Storage::disk('public')->exists($oldAvatar)) {
                        Storage::disk('public')->delete($oldAvatar);
                    }
                }
            }
        });

        /**
         * Logic for cleaning up files when the entire record is DELETED.
         */
        static::deleting(function ($user) {
            if (!empty($user->file_path) && Storage::disk('public')->exists($user->file_path)) {
                Storage::disk('public')->delete($user->file_path);
            }
        });
    }
}
