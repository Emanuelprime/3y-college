<?php
if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$fraseUser = $_POST['atividade1'];
	$pattern = '/[aeiouAEIOU]/';
	$replacement = "*";
	$Resposta = preg_replace($pattern, $replacement, $fraseUser);
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$numero = $_POST['atividade2'];
	$primo = 'é um número primo';
	if ($numero < 2) {
		$primo = 'não é um número primo';
	}
	for ($i = 2; $i <= sqrt($numero); $i++) {
		if ($numero % $i == 0) {
			$primo = 'não é um número primo';
			break;
		}
	}

}
function inverte($fraseUser2)
{
	$armazenador = [];
	$len = strlen($fraseUser2);
	for ($i = $len - 1; $i >= 0; $i--) {
		$armazenador[] = $fraseUser2[$i];
	}
	return implode('', $armazenador);

}
if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$fraseUser2 = $_POST['atividade3'];
	$invertida = inverte($fraseUser2);
}


function verificaNumero($numero2)
{

	if ($numero2 === 0) {
		$valorNumero = 'é zero';
	} elseif ($numero2 > 0) {
		$valorNumero = ' é positivo';
	} else {
		$valorNumero = ' é negativo';
	}
	return $valorNumero;
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$numero2 = $_POST['atividade4'];
	$valorNumero = verificaNumero($numero2);
}


if ($_SERVER['REQUEST_METHOD'] == "POST") {

	$fraseUser3 = $_POST['atividade5'];
	$palavra = explode(" ", $fraseUser3);
	$quantidadePalavra = count($palavra);
	$palavrasSeparadas = [];
	foreach ($palavra as $letras) {
		$palavrasSeparadas[] = trim($letras);
	}
	$palavrasSeparadas = implode("<br>", $palavrasSeparadas);

}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$fraseUser4 = $_POST['atividade6'];
	$fraseInvertida = inverte($fraseUser4);
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$arrayNumero = range(1, 20);
	foreach ($arrayNumero as $key => $value) {
		if ($value % 3 == 0) {
			$arrayNumero[$key] = 'X';
		}
	}
	$arrayNumero = implode(' ', $arrayNumero);
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$fraseUser5 = $_POST['atividade8'];
	$busca = '/\s+/';
	$colocar = "";
	$fraseSemEspaco = preg_replace($busca, $colocar, $fraseUser5);
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$numberFibonacci = 10;
	$fibonacci = [];
	for ($i = 0; $i < $numberFibonacci; $i++) {
		if ($i == 0) {
			$fibonacci[] = 1;
		} elseif ($i == 1) {
			$fibonacci[] = 1;
		} else {
			$fibonacci[] = $fibonacci[$i - 1] + $fibonacci[$i - 2];
		}

	}
	$fibonacci = implode(' ', $fibonacci);
}


if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$fraseUser6 = strtolower(str_replace(' ', '', $_POST['atividade10']));
	$alfabeto = range('a', 'z');
	$letrasPresentes = array_unique(str_split($fraseUser6));

	if (count($letrasPresentes) === 26 && !array_diff($alfabeto, $letrasPresentes)) {
		$pangrama = 'é um pangrama';
		$letrasFaltando = '';
	} else {
		$pangrama = 'não é um pangrama';
		$letrasFaltando = implode(' ', array_diff($alfabeto, $letrasPresentes));
	}
}


?>







<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Atividade 01 - PHP</title>
	<link rel="stylesheet" href="./style.css">
</head>

<body>
	<h1>Atividade Aula 02 Mão na Massa:</h1>
	<form method="POST" action="">
		<h2> Atividade - 1 - Substitua todas as vogais em uma string por asteriscos (*)</h2>
		<input type="text" name="atividade1" placeholder="Insira uma frase" required>
		<span><?php
		if (!empty($fraseUser)) {
			echo "<h3> A frase original é: $fraseUser</h3>";
			echo "<h3> A frase sem vogais é: $Resposta</h3>";
		} ?></span>


		<h2> Atividade - 2 - Verifique se um número é primo ou não</h2>
		<input type="number" name="atividade2" placeholder="Insira um número" required>
		<span><?php
		if (!empty($numero)) {
			echo "<h3> O numero $numero " . $primo . "</h3>";
		} ?></span>


		<h2> Atividade - 3 - Inverta uma string sem usar a função strrev().</h2>
		<input type="text" name="atividade3" placeholder="Insira outra frase" required>
		<span><?php
		if (isset($fraseUser2) && !empty($fraseUser2)) {
			echo "<h3> A frase original é: $fraseUser2</h3>";
			echo "<h3> A frase invertida é: $invertida</h3>";
		} ?></span>

		<h2> Atividade - 4 - Crie uma função que receba um número e retorne se é positivo, negativo ou zero.</h2>
		<input type="number" name="atividade4" placeholder="Insira um número" required>
		<span><?php
		if (!empty($numero2) || $numero2 == 0) {
			echo "<h3> O numero $numero2 " . $valorNumero . "</h3>";
		} ?></span>

		<h2> Atividade - 5 - Conte o número de palavras em uma frase e imprima cada palavra em uma nova
			linha.</h2>
		<input type="text" name="atividade5" placeholder="Insira mais uma frase" required>
		<span><?php
		if (!empty($fraseUser3)) {
			echo "<h3> A frase original é: $fraseUser3</h3>";
			echo "<h3> Aquantidade de letras é: $quantidadePalavra </h3>";
			echo "<h3> A frase original é: " . $palavrasSeparadas . "</h3>";

		} ?></span>

		<h2> Atividade - 6 - Crie uma função que verifique se uma palavra é um palíndromo.</h2>
		<input type="text" name="atividade6" placeholder="Insira uma frase" required>
		<span><?php
		if (!empty($fraseUser4)) {
			echo "<h3> A frase original: $fraseUser4 </h3>";
			echo "<h3> A frase invertida: $fraseInvertida </h3>";
			if ($fraseUser4 == $fraseInvertida) {
				$palindromo = 'é um palindromo';
			} else {
				$palindromo = 'não é um palindromo';
			}
			echo "<h3> A frase $palindromo </h3>";
		} ?></span>

		<h2> Atividade - 7 - Crie um programa que imprima os números de 1 a 20, substituindo múltiplos de 3
			por X.</h2>
		<span><?php
		echo $arrayNumero;
		?></span>

		<h2> Atividade - 8 - Crie uma função que remova os espaços em branco de uma string.</h2>
		<input type="text" name="atividade8" placeholder="Insira uma frase" required>
		<span><?php
		if (!empty($fraseUser5)) {
			echo "<h3> A frase original é: $fraseUser5</h3>";
			echo "<h3> A frase sem vogais é: $fraseSemEspaco</h3>";
		} ?></span>

		<h2> Atividade - 9 - Crie um programa que calcule e imprima os números Fibonacci até o décimo
			termo.</h2>
		<span><?php
		echo "<h3> O fibonacci é: " . $fibonacci . "</h3>";
		?></span>

		<h2> Atividade - 10 - Crie uma função que receba um texto e retorne se é um pangrama (contém todas
			as letras do alfabeto pelo menos uma vez).</h2>
		<input type="text" name="atividade10" placeholder="Insira uma frase" required>
		<span><?php
		echo "<h3> A frase original é: $fraseUser6</h3>";
		echo "<h3> A frase $pangrama </h3>";
		if (!empty($letrasFaltando)) {
			echo "<h3> As letras que faltam são: $letrasFaltando </h3>";
		}
		?></span>


		<button type="submit">Enviar</button>
	</form>

</body>

</html>