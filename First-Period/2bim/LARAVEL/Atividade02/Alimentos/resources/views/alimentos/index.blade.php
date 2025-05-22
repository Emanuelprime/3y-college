<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
</head>
</html>

@extends('layouts.main')

@section('content')
    <h1>Lista de Alimentos</h1>

    @if(session('sucesso'))
        <p style="color:green;">{{ session('sucesso') }}</p>
    @endif

    <a href="{{ route('alimentos.create') }}">Adicionar Novo Alimento</a>

    <div class="container">
        <div class="container-dentro">
            <ul class="lista">
                @foreach($alimentos as $alimento)
                    <li class="lista-dentro">
                        <strong>{{ strtoupper($alimento->nome) }}</strong> - <strong>Categoria:</strong> {{ $alimento->categoria ?? 'Sem Categoria' }} - <strong>Quantidade:</strong> {{ $alimento->quantidade }} - <strong>Validade:</strong> {{ $alimento->validade ?? 'Sem validade' }}

                        <a href="{{ route('alimentos.edit', $alimento) }}">Editar</a>

                        <form action="{{ route('alimentos.destroy', $alimento) }}" method="post" style="display:inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit">Excluir</button>
                        </form>

                        @if($alimento->quantidade < 10) <!-- <- Exibir um alerta quando um alimento estiver com estoque baixo. -->
                            <span style="color: red; font-weight: bold;"><u>ESTOQUE BAIXO!!</u></span>
                        @endif

                    </li>
                @endforeach
            </ul>
        </div>
    </div>
@endsection