<?php

namespace App\View\Components;

use Illuminate\View\Component;

class CardFilme extends Component
{
public $titulo;
public $genero;
public $avaliacao;

public function __construct($titulo, $genero, $avaliacao)
{
$this->titulo = $titulo;
$this->genero = $genero;
$this->avaliacao = $avaliacao;
}

public function render()
{
return view('components.card-filme');
}
}