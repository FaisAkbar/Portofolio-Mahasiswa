<?php

namespace App\Http\Controllers;

use App\Models\Portfolio;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class PortfolioPDFController extends Controller
{
    public function downloadpdf(){
        $portfolios = Portfolio::all();

        $pdf = Pdf::loadView('portfolioPDF', compact('portfolios'));
        
        return $pdf->download('hutao_furina.pdf');
    }
}
