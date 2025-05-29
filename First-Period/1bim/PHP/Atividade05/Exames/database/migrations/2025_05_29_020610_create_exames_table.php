<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
{
    Schema::create('exames', function (Blueprint $table) {
        $table->id();
        $table->string('paciente', 100);
        $table->string('exame_id')->unique();
        $table->enum('tipo', ['Sequenciamento', 'PCR', 'Microarray']);
        $table->date('data_coleta');
        $table->string('laudo', 500)->nullable();
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exames');
    }
};
