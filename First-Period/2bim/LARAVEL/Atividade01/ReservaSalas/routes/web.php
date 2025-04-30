<?php
use App\Http\Controllers\SalaController;
use App\Http\Controllers\ReservaController;
use Illuminate\Support\Facades\Route;

Route::resource('salas', SalaController::class);
Route::resource('reservas', ReservaController::class);
Route::get('/', function () {
    return view('welcome');
});