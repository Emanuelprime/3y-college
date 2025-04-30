@extends('layout')

@section('content')
<h1>Lista de Produtos</h1>
<ul>
@foreach ($produtos as $produto)
<li>
<a href="{{ url('/produtos/' . $produto['id']) }}">
{{ $produto['nome'] }} - R$ {{ number_format($produto['preco'], 2, ',', '.') }}
</a>
</li>
@endforeach
</ul>
@endsection