<!DOCTYPE html>
<html lang="pt">
<head>

    <meta charset="UTF-8">
    <title>Cadastrar Exame</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>
    <h1>Cadastrar Exame Genético</h1>

    @if (session('success'))
        <p style="color: green;">{{ session('success') }}</p>
    @endif

    @if ($errors->any())
        <div style="color: red;">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('exames.store') }}" method="POST">
        @csrf

        <label>Paciente:
            <input type="text" name="paciente" value="{{ old('paciente') }}">
        </label>
        <br>

        <label>Número do Exame:
            <input type="text" name="exame_id" value="{{ old('exame_id') }}">
        </label>
        <br>

        <label>Tipo de Exame:
            <select name="tipo">
                <option value="">Selecione</option>
                <option value="Sequenciamento" {{ old('tipo') == 'Sequenciamento' ? 'selected' : '' }}>Sequenciamento</option>
                <option value="PCR" {{ old('tipo') == 'PCR' ? 'selected' : '' }}>PCR</option>
                <option value="Microarray" {{ old('tipo') == 'Microarray' ? 'selected' : '' }}>Microarray</option>
            </select>
        </label>
        <br>

        <label>Data de Coleta:
            <input type="date" name="data_coleta" value="{{ old('data_coleta') }}">
        </label>
        <br>

        <label>Laudo:
            <textarea name="laudo" rows="4" cols="50">{{ old('laudo') }}</textarea>
        </label>
        <br><br>

        <button type="submit">Cadastrar</button>
    </form>
</body>
</html>
