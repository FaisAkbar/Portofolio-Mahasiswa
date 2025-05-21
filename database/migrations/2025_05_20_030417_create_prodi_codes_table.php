<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Create the university_branches table
        Schema::create('university_branches', function (Blueprint $table) {
            $table->id();
            $table->string('university_branch');
            $table->string('branch_code');
            $table->timestamps();
        });

        // Create the faculties table
        Schema::create('faculties', function (Blueprint $table) {
            $table->id();
            $table->string('faculty_name')->nullable();
            $table->string('faculty_code')->nullable();
            $table->unsignedBigInteger('university_branch_id'); // Foreign key to university_branches
            $table->timestamps();

            // Define the foreign key constraint to university_branches
            $table->foreign('university_branch_id')
                ->references('id')
                ->on('university_branches')
                ->onDelete('cascade');
        });

        // Create the prodis table
        Schema::create('prodis', function (Blueprint $table) {
            $table->id();
            $table->string('prodi_name');
            $table->string('prodi_code');
            $table->unsignedBigInteger('faculty_id'); // Foreign key to faculties
            $table->timestamps();

            // Define the foreign key constraint to faculties
            $table->foreign('faculty_id')
                ->references('id')
                ->on('faculties')
                ->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('prodis');
        Schema::dropIfExists('faculties');
        Schema::dropIfExists('university_branches');
    }
};
