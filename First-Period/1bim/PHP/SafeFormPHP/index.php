<?php

$nome = $email = $mensagem = "";
$erroNome = $erroEmail = "";

//verifica se o fornulário foi enviado via POST

if ($_SERVER['REQUEST_METHOD'] == "POST") {

	//validações
	if (empty($_POST["nome"])) {
		$erroNome = "O campo nome é obrigatorio";
	} else {
		$nome = filter_input(INPUT_POST, "nome", FILTER_SANITIZE_STRING);
	}

	if (empty($_POST["email"])) {
		$erroEmail = "O campo email é obrigatorio";
	} else {
		$email = filter_input(INPUT_POST, "email", FILTER_VALIDATE_EMAIL);
	}
}

$mensagem = htmlspecialchars($_POST["mensagem"], ENT_QUOTES, "UTF-8");

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Formulario Seguro em PHP</title>
	<link rel="stylesheet" href="style.css">
</head>

<body>
	<h2>Formulario com Validação e Segurança</h2>
	<form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
		<label for="nome">Nome:</label>
		<input type="text" id="nome" name="nome" value="<?php echo $nome; ?>">
		<span style="color: red;"><?php echo $erroNome; ?></span>
		<label for="nome">Email:</label>
		<input type="text" id="email" name="email" value="<?php echo $email; ?>">
		<span style="color: red;"><?php echo $erroEmail; ?></span>
		<br>

		<label for="mensagem">Mensagem:</label>
		<textarea id="mensagem" name="mensagem"><?php echo $mensagem; ?></textarea>
		<input type="submit" value="Enviar" />
	</form>
	<?php
	//exibir os dados processados (caso nao tenha erro)
	
	if ($_SERVER["REQUEST_METHOD"] == "POST" && empty($erroNome) && empty($erroEmail)) {
		echo "<h3>Dados Recebidos:</h3>";
		echo "<p><strong>Nome:</strong>" . $nome . "</p>";
		echo "<p><strong>Email:</strong>" . $email . "</p>";
		echo "<p><strong>Mensagem:</strong>" . $mensagem . "</p>";

	}
	;

	?>
</body>

</html>