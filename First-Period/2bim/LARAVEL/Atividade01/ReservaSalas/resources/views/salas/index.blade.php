<!DOCTYPE html>
<html>
<head>
    <title>Salas Disponíveis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Salas Disponíveis</h1>
        <a href="{{ route('salas.create') }}" class="btn btn-primary mb-3">Nova Sala</a>
        
        <table class="table">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Capacidade</th>
                </tr>
            </thead>
            <tbody>
                @foreach($salas as $sala)
                <tr>
                    <td>{{ $sala->nome }}</td>
                    <td>{{ $sala->capacidade }} pessoas</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>
</html>