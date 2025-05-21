<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recap PDF</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <h1>Recap of Mahasiswa</h1>

    <table>
        <thead>
            <tr>
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
                    <td>{{ $recap->name }}</td>
                    <td>{{ $recap->nim_nip }}</td>
                    <td>{{ number_format($recap->ipk, 2) }}</td> <!-- Format IPK to 2 decimal places -->
                    <td>{{ $recap->academic_points }}</td>
                    <td>{{ $recap->non_academic_points }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

</body>
</html>
