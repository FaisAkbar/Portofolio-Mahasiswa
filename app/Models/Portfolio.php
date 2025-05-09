<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    /**
     * Relasi ke kategori (Category)
     */
    public function category()
    {
        return $this->belongsTo(Category::class, "kategori_id");
    }

    /**
     * Relasi ke user (User)
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
