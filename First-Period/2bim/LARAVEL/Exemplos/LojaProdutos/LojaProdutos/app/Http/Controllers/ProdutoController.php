<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    //Metodo para lsitar produtos

    public function index()
    {
        $produtos =[
            ['id' => 1, 'nome' =>'Notebook','preco' => 4500],
            ['id' => 2, 'nome' =>'Mouse','preco' => 300],
            ['id' => 3, 'nome' =>'Teclado','preco' => 400],
        ];

        return view('produtos.index', compact('produtos'));
    }

    public function show($id){
        $produtos =[
            1 => ['nome' => 'Notebook', 'preco' => 4500],
            2 => ['nome' => 'Mouse', 'preco' => 300],
            3 => ['nome' => 'Teclado', 'preco' => 400],
        ];

        if(!isset($produtos[$id])){
            return "Produto não encontrado!";
        }

        return view('produtos.show', ['produto' => $produtos[$id]]);
    }
}
