<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FilmeController extends Controller
{
public function index()
{
// Criamos uma lista de filmes fictícios
$filmes = [
['titulo' => 'O Poderoso Chefão', 'genero' => 'Drama', 'avaliacao' => 9.2],
['titulo' => 'Interestelar', 'genero' => 'Ficção Científica', 'avaliacao' => 8.6],
['titulo' => 'Toy Story', 'genero' => 'Animação', 'avaliacao' => 8.3],

];

// Passamos os filmes para a view
return view('filmes.index', compact('filmes'));
}

public function store(Request $request)
{
// Validação simples: título e gênero são obrigatórios
$request->validate([
'titulo' => 'required',
'genero' => 'required',
'avaliacao' => 'required'
]);

// Redireciona de volta com mensagem de sucesso
return redirect()->route('filmes.index')->with('sucesso', 'Filme adicionado com
sucesso!');
}
}