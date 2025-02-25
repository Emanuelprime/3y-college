<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Seguro em PHP</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Outfit', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            margin-bottom: 20px;
            font-weight: 700;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 700;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 700;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        span {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <h2>Formulario com Validação e Segurança</h2>
    <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<?php echo $nome; ?>">
        <span><?php echo $erroNome; ?></span>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<?php echo $email; ?>">
        <span><?php echo $erroEmail; ?></span>
        <br>
        
        <label for="mensagem">Mensagem:</label>
        <textarea id="mensagem" name="mensagem"><?php echo $mensagem; ?></textarea>
        <input type="submit" value="Enviar"/>
    </form>
    <?php 
        //exibir os dados processados (caso nao tenha erro)

        if($_SERVER["REQUEST_METHOD"]== "POST" && empty($erroNome) && empty($erroEmail)){
            echo "<h3>Dados Recebidos:</h3>";
            echo"<p><strong>Nome:</strong>". $nome . "</p>";
            echo"<p><strong>Email:</strong>". $email . "</p>";
            echo"<p><strong>Mensagem:</strong>". $mensagem . "</p>";

        };
        
    ?>
</body>
</html>