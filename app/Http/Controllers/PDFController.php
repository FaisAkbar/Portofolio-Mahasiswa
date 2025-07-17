<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Khs;
use App\Models\Portfolio;
use App\Models\Prodi;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Filament\Facades\Filament;
use Illuminate\Http\Request;

class PDFController extends Controller
{
    public function download_portfolio(){
        // User
        $user = Filament::auth()->user();

        // Portfolio
        $portfolios = Portfolio::where('user_id', $user->id)
                        ->where('status', 'Diterima')
                        ->get();
        $usedKegiatans = Category::whereIn('id', $portfolios->pluck('kategori_id')->unique())
            ->pluck('kegiatan')
            ->unique()
            ->values();

        // IPK
        $khsRecords = Khs::where('user_id', $user->id)->get();
        $ipk = $khsRecords->count() > 0
            ? round($khsRecords->avg('ip_semester'), 2)
            : 0.0;

        $prodiName = $user->prodi ?? 'Prodi Tidak Diketahui';

        // Download the PDF
        $pdf = Pdf::loadView('portfolioPDF', compact('portfolios', 'user', 'ipk', 'prodiName', 'usedKegiatans'));
        return $pdf->download('Portofolio.pdf');
    }

    public function download_recap(Request $request){
        $query = User::role('mahasiswa')
            ->select('users.id', 'users.name', 'users.nim_nip')
            ->addSelect([
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
            ->addSelect([
                'academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "Diterima" AND portfolios.jenis_pencapaian = "Hard Skill dan Soft Skill" THEN categories.poin ELSE 0 END), 0) as academic_points')
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1),
            ])
            ->addSelect([
                'non_academic_points' => Portfolio::selectRaw('IFNULL(SUM(CASE WHEN portfolios.status = "Diterima" AND portfolios.jenis_pencapaian = "Olahraga dan Seni" THEN categories.poin ELSE 0 END), 0) as non_academic_points')
                    ->leftJoin('categories', 'categories.id', '=', 'portfolios.kategori_id')
                    ->whereColumn('portfolios.user_id', 'users.id')
                    ->limit(1),
            ]);

        // 1. Angkatan Filter
        if ($request->filled('angkatan')) {
            $query->where('angkatan', $request->input('angkatan'));
        }

        // 2. Prodi Filter
        if ($request->filled('prodi')) {
            $query->where('prodi', $request->input('prodi'));
        }

        $recaps = $query->get();
        $pdf = Pdf::loadView('recapPDF', compact('recaps'));

        return $pdf->download('Recap.pdf');
    }
}
