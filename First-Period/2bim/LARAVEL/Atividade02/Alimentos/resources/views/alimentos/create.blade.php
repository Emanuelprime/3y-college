@extends('layouts.main')

@section('content')
    <h1>Adicionar Alimento</h1>

    <form action="{{route('alimentos.store') }}" method="post">
        @csrf
        <input type="text" name="nome" placeholder="Nome" required>
        <input type="text" name="categoria" placeholder="Categoria">
        <input type="number" name="quantidade" placeholder="Quantidade" required>
        <input type="date" name="validade">
        <button type="submit">Salvar</button>
    </form>
@endsection