<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Reserva;
use App\Models\Sala;

class ReservaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reservas = Reserva::with('sala')->get(); //Vai pegar todas as reservas com suas salas
        return view('reservas.index', compact('reservas')); //Vai passar as reservas para a view
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $salas = Sala::all(); //pega as salas
        return view('reservas.create', compact('salas'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $valida = $request->validate([
            'sala_id' => 'required|exists:salas,id',
            'usuario' => 'required|string|max:100',
            'data' => 'required|date',
            'horario' => 'required'
        ]);

        Reserva::create($valida)->with('success', 'Reserva criada com sucesso!'); //Cria a reserva com os dados validados
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
