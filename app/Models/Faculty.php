<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Faculty extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    // One-to-many relationship with Prodi
    public function prodis()
    {
        return $this->hasMany(Prodi::class);
    }

    // Belongs to UniversityBranch
    public function universityBranch()
    {
        return $this->belongsTo(UniversityBranch::class);
    }
}
