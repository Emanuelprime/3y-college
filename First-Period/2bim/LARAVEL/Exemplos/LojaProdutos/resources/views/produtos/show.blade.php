@extends('layout')

@section('content')
<h1>Detalhes do Produto</h1>
<p><strong>Nome: </strong>{{ $produto['nome'] }}</p>
<p><strong>Preço:</strong> R$ {{ number_format($produto['preco'], 2, ',', '.') }}</p>
<a href="{{ url('/produtos') }}">Voltar para lista</a>
@endsection