<?php

namespace App\Http\Controllers;

use App\Models\Khs;
use App\Models\Portfolio;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class PDFController extends Controller
{
    public function download_portfolio(){
        $portfolios = Portfolio::all();

        $pdf = Pdf::loadView('portfolioPDF', compact('portfolios'));
        
        return $pdf->download('Portofolio.pdf');
    }

    public function download_recap(){
        $recaps = User::role('mahasiswa') // Filter users with the 'mahasiswa' role
            ->select('users.id', 'users.name', 'users.nim_nip') // Explicitly select the columns from users table
            ->addSelect([
                // Subquery for calculating total nilai (total grades), total KHS, and IPK (GPA)
                'total_nilai' => Khs::selectRaw('SUM(khs.ip_semester)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1),
                'total_khs' => KHS::selectRaw('COUNT(khs.id)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1),
                'ipk' => KHS::selectRaw('IF(COUNT(khs.id) > 0, SUM(khs.ip_semester) / COUNT(khs.id), 0)')
                    ->whereColumn('khs.user_id', 'users.id')
                    ->limit(1),
            ])
            // Subquery for calculating Academic Points
            ->addSelect([
                'academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Akademik" THEN categories.poin ELSE 0 END), 0) as academic_points') 
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1),
            ])
            // Subquery for calculating Non-Academic Points
            ->addSelect([
                'non_academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "accepted" AND portfolios.jenis_pencapaian = "Non-Akademik" THEN categories.poin ELSE 0 END), 0) as non_academic_points')
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1),
            ])
            ->get(); // Execute the query and fetch the data

        // Generate the PDF with the recaps data
        $pdf = Pdf::loadView('recapPDF', compact('recaps'));
        
        // Return the PDF download response
        return $pdf->download('Recap.pdf');
    }
}
