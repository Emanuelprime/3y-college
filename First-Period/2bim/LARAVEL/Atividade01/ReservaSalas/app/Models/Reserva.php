<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    public function sala()
    {
        return $this->belongsTo(sala::class);
    }
}
