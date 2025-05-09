<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('portfolios', function (Blueprint $table) {
            $table->id();
            $table->string('nama_kegiatan');
            $table->foreignId('kategori_id')->constrained('categories')->onDelete('cascade');
            $table->date('tanggal_kegiatan');
            $table->string('jenis_pencapaian');
            $table->string('file_path');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->enum('status', ['revise', 'on-review', 'accepted'])->default('on-review');
            $table->text('feedback')->nullable();
            $table->foreignId('verified_by')->nullable()->constrained('users')->onDelete('set null');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('portfolios');
    }
};
