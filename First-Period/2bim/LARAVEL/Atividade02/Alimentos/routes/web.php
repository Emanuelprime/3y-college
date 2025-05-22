<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AlimentoController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/alimentos',[AlimentoController::class,'index'])->name('alimentos.index');
Route::get('/alimentos/create',[AlimentoController::class,'create'])->name('alimentos.create');
Route::post('/alimentos',[AlimentoController::class,'store'])->name('alimentos.store');
Route::get('/alimentos/{alimento}/edit',[AlimentoController::class,'edit'])->name('alimentos.edit');
Route::put('/alimentos/{alimento}',[AlimentoController::class,'update'])->name('alimentos.update');
Route::delete('/alimentos/{alimento}',[AlimentoController::class,'destroy'])->name('alimentos.destroy');