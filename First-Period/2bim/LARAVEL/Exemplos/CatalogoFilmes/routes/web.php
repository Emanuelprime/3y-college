<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
use App\Http\Controllers\FilmeController;

Route::get('/filmes', [FilmeController::class, 'index'])->name('filmes.index');
Route::post('/filmes', [FilmeController::class, 'store'])->name('filmes.store');
