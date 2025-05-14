<?php

use App\Http\Controllers\MedicamentoController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/medicamentos',[MedicamentoController::class,'index'])->name('medicamentos.index');
Route::post('/medicamentos',[MedicamentoController::class,'store'])->name('medicamentos.store');

