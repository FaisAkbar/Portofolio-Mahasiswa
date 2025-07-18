<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Faculty extends Model
{
    use HasFactory;

    protected $guarded = ['id'];
    public function prodis()
    {
        return $this->hasMany(Prodi::class);
    }
    public function universityBranch()
    {
        return $this->belongsTo(UniversityBranch::class);
    }
}
