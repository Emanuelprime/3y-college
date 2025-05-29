<?php

namespace App\Http\Controllers;

use App\Models\Exame;
use App\Http\Requests\ValidaRequest;

class ExameController extends Controller
{
    public function create()
    {
        return view('exames.create');
    }

    public function store(ValidaRequest $request)
    {
        Exame::create($request->validated());

        return redirect()->back()->with('success', 'Exame cadastrado com sucesso!');
    }
}
