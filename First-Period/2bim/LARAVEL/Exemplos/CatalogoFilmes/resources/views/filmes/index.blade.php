@extends('layouts.main')

@section('titulo', 'Catálogo de Filmes')

@section('titulo_pagina', 'Lista de Filmes')

@section('conteudo')

<!-- Exibe mensagens de erro -->
@error('titulo')
<p style="color: red;">Erro: {{ $message }}</p>
@enderror
@error('genero')
<p style="color: red;">Erro: {{ $message }}</p>
@enderror

<!-- Exibe mensagem de sucesso -->
@if(session('sucesso'))
<p style="color: green;">{{ session('sucesso') }}</p>
@endif

<!-- Formulário para adicionar filmes -->
<form method="POST" action="{{ route('filmes.store') }}">
@csrf
<input type="text" name="titulo" placeholder="Título do Filme">
<input type="text" name="genero" placeholder="Gênero">
<button type="submit">Adicionar</button>
</form>

<!-- Loop para exibir filmes -->
@foreach($filmes as $filme)
<x-card-filme :titulo="$filme['titulo']" :genero="$filme['genero']"
:avaliacao="$filme['avaliacao']" />
@endforeach

@endsection