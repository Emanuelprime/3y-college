<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Sala</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Cadastrar Nova Sala</h1>
        <form action="{{ route('salas.store') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label class="form-label">Nome da Sala</label>
                <input type="text" class="form-control" name="nome" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Capacidade</label>
                <input type="number" class="form-control" name="capacidade" required>
            </div>
            <button type="submit" class="btn btn-success">Salvar</button>
        </form>
    </div>
</body>
</html>