<?php
$image = "/images/logo.png";
$ttd = "/images/ttdd.png";
$formatter = new \IntlDateFormatter(
    'id_ID',
    \IntlDateFormatter::LONG,
    \IntlDateFormatter::NONE,
    'Asia/Jakarta',
    \IntlDateFormatter::GREGORIAN,
    'd MMMM yyyy'
);
$currentDate = $formatter->format(new \DateTime());
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Portofolio Mahasiswa - Politeknik Negeri Malang</title>
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
            margin: 15mm 15mm 20mm 15mm;
            @top-center {
                content: element(running-header);
            }
        }

        @page:first {
            margin: 5mm 15mm 20mm 15mm;
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
            margin: 0 auto;
            background: white;
            padding: 30px 10px;
        }

        .title {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            text-decoration: underline;
            page-break-after: avoid;
            margin-bottom: 0.5em;
        }

        .student-info {
            margin-bottom: 30px;
            font-size: 13px;
            page-break-after: avoid;
            page-break-inside: avoid;
        }

        .student-info table {
            width: 100%;
            border-collapse: collapse;
        }

        .student-info td {
            padding: 3px 0;
            vertical-align: top;
        }

        .student-info .label {
            width: 150px;
            font-weight: bold;
        }

        .student-info .colon {
            width: 20px;
            text-align: center;
        }

        .section {
            margin-bottom: 25px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .section-title {
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 10px;
            page-break-after: avoid;
        }

        .activity-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
            page-break-inside: auto;
        }

        .activity-table thead {
            display: table-header-group;
        }

        .activity-table tbody {
            display: table-row-group;
        }

        .activity-table th,
        .activity-table td {
            border: 1px solid #000;
            padding: 8px 5px;
            text-align: left;
            vertical-align: top;
            page-break-inside: avoid;
        }

        .activity-table th {
            background-color: #f5f5f5;
            font-weight: bold;
            text-align: center;
            page-break-after: avoid;
        }

        .final-table {
            width: 100%;
            text-align: right;
            margin-top: 40px;
            page-break-inside: avoid;
        }

        .final-table td {
            border: none;
        }

        img.tanda-tangan {
            width: 150px;
            height: 150px;
            margin-top: 10px;
        }

    </style>
</head>

<body>
    <div class="running-header">
        <table width="100%">
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
        <div class="title">PORTOFOLIO MAHASISWA</div>

        <div class="student-info">
            <table>
                <tr>
                    <td class="label">Nama Mahasiswa</td>
                    <td class="colon">:</td>
                    <td><?= $user->name ?></td>
                </tr>
                <tr>
                    <td class="label">NIM</td>
                    <td class="colon">:</td>
                    <td><?= $user->nim_nip ?></td>
                </tr>
                <tr>
                    <td class="label">Program Studi</td>
                    <td class="colon">:</td>
                    <td><?= $prodiName ?></td>
                </tr>
                <tr>
                    <td class="label">IPK</td>
                    <td class="colon">:</td>
                    <td><?= $ipk ?></td>
                </tr>
            </table>
        </div>

        @php $alphabet = range('A', 'Z'); @endphp

        @foreach ($usedKegiatans as $index => $kegiatan)
            <div class="section">
                <div class="section-title">{{ $alphabet[$index] }}. {{ $kegiatan }}</div>
                    <table class="activity-table">
                        <thead>
                            <tr>
                                <th class="no-col">No</th>
                                <th>Nama Kegiatan</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $items = $portfolios->where('category.kegiatan', $kegiatan)->values();
                                $maxRows = max(1, $items->count());
                            @endphp

                            @for ($i = 0; $i < $maxRows; $i++)
                                <tr>
                                    <td class="row-number">{{ $i + 1 }}</td>
                                    <td>{{ $items[$i]->nama_kegiatan ?? '' }}</td>
                                </tr>
                            @endfor
                        </tbody>
                    </table>
            </div>
        @endforeach

        <div class="section">
            <table class="final-table">
                <tr>
                    <td>Malang, <?= $currentDate ?></td>
                </tr>
                <tr>
                    <td><img src="{{ public_path() . $ttd }}" alt="Tanda Tangan" class="tanda-tangan"></td>
                </tr>
                <tr>
                    <td><u>Fawaa'el Akbar Firdaus</u></td>
                </tr>
                <tr>
                    <td>NIP. 2141720215</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
