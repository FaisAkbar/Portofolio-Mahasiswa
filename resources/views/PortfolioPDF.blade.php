<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diploma Supplement Certificate</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
        }
        .header img {
            max-width: 150px;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .sub-header {
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }
        .section {
            margin-top: 30px;
        }
        .section h2 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table td {
            padding: 8px;
            border: 1px solid #ddd;
        }
        .table th {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <img src="dummy-image.jpg" alt="Institution Logo">
        <h1>Kementerian Pendidikan, Kebudayaan, Riset, dan Teknologi</h1>
        <h1>POLITEKNIK NEGERI MALANG</h1>
        <h1>STATE POLYTECHNIC OF MALANG</h1>
        <div class="sub-header">
            <h2>SURAT KETERANGAN PENDAMPING IJAZAH</h2>
            <h2>Diploma Supplement Certificate</h2>
        </div>
    </div>

    <div class="section">
        <table class="table">
            <tr>
                <th colspan="2">1. INFORMASI TENTANG IDENTITAS DIRI PEMEGANG SKPI</th>
            </tr>
            <tr>
                <td>1.1 Nama Lengkap (Full Name)</td>
                <td>Hu Tao</td>
            </tr>
            <tr>
                <td>1.2 Nomor Induk Mahasiswa (Student Identification Number)</td>
                <td>2041720022</td>
            </tr>
            <tr>
                <td>1.3 Tempat dan Tanggal Lahir (Place and Date of Birth)</td>
                <td>Malang, November 14, 2002</td>
            </tr>
            <tr>
                <td>1.4 Tanggal Masuk (Date of Admission)</td>
                <td>August 31, 2020</td>
            </tr>
            <tr>
                <td>1.5 Tanggal Kelulusan (Date of Graduation)</td>
                <td>July 31, 2024</td>
            </tr>
            <tr>
                <td>1.6 Nomor Ijazah (Certificate Number)</td>
                <td>0500253531020140048</td>
            </tr>
            <tr>
                <td>1.7 Gelar/Sebutan Lulusan (Academic Degree)</td>
                <td>Sarjana Terapan Komputer (S.Tr.Kom.)</td>
            </tr>
        </table>
    </div>

    <div class="section">
        <table class="table">
            <tr>
                <th colspan="2">XX. Portfolios</th>
            </tr>
            @foreach($portfolios as $portfolio)
            <tr>
                <td>Nama Kegiatan</td>
                <td>{{ $portfolio->nama_kegiatan }}</td>
            </tr>
            <tr>
                <td>Kategori</td>
                <td>{{ $portfolio->category->kegiatan }}</td>
            </tr>
            <tr>
                <td>Poin</td>
                <td>{{ $portfolio->category->poin }}</td>
            </tr>
            @endforeach
        </table>
    </div>
</div>

</body>
</html>