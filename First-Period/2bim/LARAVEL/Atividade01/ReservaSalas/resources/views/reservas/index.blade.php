<!DOCTYPE html>
<html>
<head>
  <title>Reservas</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
  <div class="container py-4">
    <h1 class="fw-bold mb-4">Reservas Ativas</h1>
    
    <a href="{{ route('reservas.create') }}" class="btn btn-primary btn-outfit mb-4">
      <i class="fas fa-plus"></i> Nova Reserva
    </a>

    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead class="table-primary">
          <tr>
            <th>Sala</th>
            <th>Usuário</th>
            <th>Data</th>
            <th>Horário</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          @foreach($reservas as $reserva)
          <tr>
            <td>{{ $reserva->sala->nome }}</td>
            <td>{{ $reserva->usuario }}</td>
            <td>{{ $reserva->data->format('d/m/Y') }}</td>
            <td>{{ $reserva->horario }}</td>
            <td>
              <button class="btn btn-sm btn-danger">
                <i class="fas fa-trash"></i>
              </button>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </div>

  <!-- Bootstrap JS + Ícones (Font Awesome) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/your-code.js" crossorigin="anonymous"></script>
</body>
</html>