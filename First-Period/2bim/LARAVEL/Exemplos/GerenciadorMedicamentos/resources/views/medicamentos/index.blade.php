@extends("layouts.main")

@section('titulo','Lista de Medicamentos')

@section('conteudo')

<!-- Exibição de mensagens de sucesso -->

@if(session('sucesso'))
    <p style="color: green;">{{session('sucesso')}}</p>
@endif

<!-- Formulario de adição de medicamentos -->

<form method="POST" action="{{route('medicamentos.store') }}">
    @csrf
    <input type="text" name="nome" placeholder="Nome do medicamento" required>
    <textarea name="descricao" placeholder="Descrição(opcional)"></textarea>
    <input type="number" name="quantidade" placeholder="Quantidade" required>
    <button type="submit">Adicionar</button>
</form>

<!-- Exibição dos medicamentos -->
 <ul>
    @foreach($medicamentos as $medicamentos)
    <li>
        <strong>{{ $medicamento->nome}}</strong>-{{ $medicamento->descricao??'Sem descrição' }}-
        Quantidade: {{ $medicamento->qualidade }}
    </li>
    @endforeach
 </ul>

 @endsection