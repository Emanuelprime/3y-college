<?php

namespace App\Http\Controllers;

use App\Models\Sala;
use Illuminate\Http\Request;

class SalaController extends Controller
{
    // Exibe todas as salas
    public function index()
    {
        $salas = Sala::all();
        return response()->json($salas);
    }

    // Mostra o formulário de criação (caso esteja usando views)
    public function create()
    {
        
        return view('salas.create');
    }

    // Armazena uma nova sala
    public function store(Request $request)
    {
        $request->validate([
            'nome' => 'required|string|max:255',
            'capacidade' => 'required|integer',
        ]);

        $sala = Sala::create($request->all());

        return redirect()->route('reservas.index')->with('success', 'Sala criada com sucesso!');
    }

    // Exibe uma sala específica
    public function show(string $id)
    {
        $sala = Sala::findOrFail($id);
        return response()->json($sala);
    }

    // Mostra o formulário de edição (caso esteja usando views)
    public function edit(string $id)
    {
        $sala = Sala::findOrFail($id);
        return response()->json($sala);
    }

    // Atualiza uma sala existente
    public function update(Request $request, string $id)
    {
        $request->validate([
            'nome' => 'sometimes|required|string|max:255',
            'capacidade' => 'sometimes|required|integer',
        ]);

        $sala = Sala::findOrFail($id);
        $sala->update($request->all());

        return response()->json($sala);
    }

    // Remove uma sala
    public function destroy(string $id)
    {
        $sala = Sala::findOrFail($id);
        $sala->delete();

        return response()->json(['message' => 'Sala removida com sucesso']);
    }
}
