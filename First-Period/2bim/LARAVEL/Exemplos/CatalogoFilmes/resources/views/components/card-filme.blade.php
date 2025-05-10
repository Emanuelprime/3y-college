<div class="card">
<h3>{{ $titulo }}</h3>
<p>Gênero: {{ $genero }}</p>
<p>Avaliação:
@if($avaliacao >= 9)
<span style="color: green;"> {{ $avaliacao }}</span>
@elseif($avaliacao >= 7)
<span style="color: orange;"> {{ $avaliacao }}</span>
@else
<span style="color: red;"> {{ $avaliacao }}</span>
@endif
</p>
</div>