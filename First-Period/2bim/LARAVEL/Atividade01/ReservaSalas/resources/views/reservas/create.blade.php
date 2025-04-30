<!DOCTYPE html>
<html>
<head>
    <title>Nova Reserva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Nova Reserva</h1>
        <form action="{{ route('reservas.store') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label class="form-label">Sala</label>
                <select class="form-select" name="sala_id" required>
                    @foreach($salas as $sala)
                    <option value="{{ $sala->id }}">{{ $sala->nome }}</option>
                    @endforeach
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Responsável</label>
                <input type="text" class="form-control" name="usuario" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Data</label>
                <input type="date" class="form-control" name="data" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Horário</label>
                <input type="time" class="form-control" name="horario" required>
            </div>
            <button type="submit" class="btn btn-success">Reservar</button>
        </form>
    </div>
</body>
</html>