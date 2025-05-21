<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UniversityBranch extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function faculties()
    {
        return $this->hasMany(Faculty::class);
    }
}
