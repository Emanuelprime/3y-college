<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('alimentos', function (Blueprint $table) {
            $table->id();
            $table->string('nome');
            $table->integer('quantidade');
            $table->date('validade')->nullable();
            $table->string('categoria')->nullable();  // <- Criar categorias de alimentos (frutas, legumes, carnes, etc.).
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('alimentos');
    }
};
