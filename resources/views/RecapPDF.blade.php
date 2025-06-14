<?php
$image = "/images/logo.png";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recap PDF</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Times New Roman', Times, serif;
            background-color: white;
            color: black;
            line-height: 1.4;
            margin: 0;
            padding: 0;
        }

        @page {
            margin: 15mm 5mm 20mm 5mm;
            @top-center {
                content: element(running-header);
            }
        }

        @page:first {
            margin: 5mm 5mm 20mm 5mm;
            @top-center {
                content: element(running-header);
            }
        }

        .running-header {
            position: running(running-header);
            width: 100%;
            border-bottom: 3px solid #000;
        }

        .logo {
            width: 80px;
            height: 80px;
            display: block;
            margin-right: 10px;
        }

        .header-text {
            font-weight: bold;
            font-size: 14px;
            line-height: 1.3;
            text-align: center;
        }

        .header-text .ministry {
            font-size: 16px;
        }

        .header-text .institution {
            font-size: 15px;
        }

        .header-text .department {
            font-size: 14px;
        }

        .contact-info {
            font-size: 11px;
            line-height: 1.2;
        }

        .container {
            max-width: 210mm;
            margin: 0;
            background: white;
            padding: 0;
        }

        .title {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            text-decoration: underline;
            page-break-after: avoid;
            margin: 1em 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 1em 1em;
        }

        .container th, .container td {
            border: 1px solid black;
        }

        th, td {
            text-align: left;
            padding: 4px 12px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

    <div class="running-header">
        <table class="header" width="100%">
            <tr>
                <td width="100px" style="text-align: center;">
                    <img src="{{ public_path() . $image }}" class="logo" alt="Logo Polinema">
                </td>
                <td>
                    <div class="header-text">
                        <div class="ministry">KEMENTERIAN PENDIDIKAN, KEBUDAYAAN, RISET, DAN TEKNOLOGI</div>
                        <div class="institution">POLITEKNIK NEGERI MALANG</div>
                        <div class="department">JURUSAN TEKNOLOGI INFORMASI</div>
                        <div class="contact-info">
                            Jalan Soekarno-Hatta No.9 Jatimulyo, Lowokwaru, Malang, 65141<br>
                            Telepon (0341) 404424 - 404425, Fax (0341) 404420,<br>
                            https://www.polinema.ac.id
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    
    <div class="container">
        <div class="title">RECAP MAHASISWA</div>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>NIM/NIP</th>
                    <th>IPK</th>
                    <th>Academic Points</th>
                    <th>Non-Academic Points</th>
                </tr>
            </thead>
            <tbody>
                @foreach($recaps as $recap)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $recap->name }}</td>
                        <td>{{ $recap->nim_nip }}</td>
                        <td>{{ number_format($recap->ipk, 2) }}</td>
                        <td>{{ $recap->academic_points }}</td>
                        <td>{{ $recap->non_academic_points }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

</body>

</html>
