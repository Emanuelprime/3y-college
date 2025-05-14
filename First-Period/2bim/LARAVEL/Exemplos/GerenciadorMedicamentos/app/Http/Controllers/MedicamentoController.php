<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Medicamento;

class MedicamentoController extends Controller
{
public function index()
{
$medicamentos = Medicamento::all();
return view('medicamentos.index', compact('medicamentos'));
}

public function store(Request $request)
{
$request->validate([
'nome' => 'required|min:3'
]);

Medicamento::create([
'nome' => $request->nome,
'descricao' => $request->descricao,
'quantidade' => $request->quantidade
]);

return redirect()->route('medicamentos.index')->with('sucesso', 'Medicamento
adicionado!');
}

}