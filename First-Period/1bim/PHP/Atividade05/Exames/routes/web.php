<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ExameController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/exames/create', [ExameController::class, 'create'])->name('exames.create');
Route::post('/exames', [ExameController::class, 'store'])->name('exames.store');
