<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sala extends Model
{
    protected $fillable = ['nome', 'capacidade'];

    public function reservas()
    {
        return $this->hasMany(Reserva::class);
    }
}
