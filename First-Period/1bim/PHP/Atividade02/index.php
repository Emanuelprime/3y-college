<?php
$status = "";
$notas = "";
$mostrarNotas = false;
$numeros =[];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nomeAluno = $_POST['nomeAluno'] ?? '';
    $notaAluno = $_POST['notaAluno'] ?? '';
    $mostrarNotas = isset($_POST['mostrarNotas']);
    $limparNotas = isset($_POST['limparNotas']);
    //adiciona nota do aluno
    if (!empty($nomeAluno) && !empty($notaAluno) && !$mostrarNotas) {
        $aluno = '<strong>Nome:</strong> ' . $nomeAluno . '<br><strong>Nota:</strong> ' . $notaAluno . '<br>';
        $file = fopen("notas.txt", "a+");
        if ($file) {
            $verificaAluno = "";
            if(filesize("notas.txt") > 0){
            $verificaAluno = fread($file, filesize("notas.txt"));} // Lê o arquivo
            fclose($file);

            //verificação para ver se o nomeAluno está no verificaAluno, se não estiver (=false) ele adiciona o aluno 
            if (strpos($verificaAluno, $nomeAluno) === false) {
                $file = fopen("notas.txt", "a");
                fwrite($file, $aluno . "\n");
                fclose($file);
                $status = "Nota cadastrada com sucesso!";
            } else {
                $status = "Aluno já cadastrado!";
            }
        } else {
            $status = "Erro ao abrir o Arquivo!";
        }
    }

        //pega todos os numeros do arquivo notas.txt
    if(file_exists("notas.txt")){
        $file = fopen("notas.txt", "r");
        if($file){
            while (($linha = fgets($file)) !== false){
                preg_match_all('/\d+/', $linha, $matches);
                
                //se o matches não estiver vazio, ele adiciona o primeiro numero do array matches[0] no array numeros
                if(!empty($matches[0])){
                    $numeros[] = $matches[0][0];
                }
            }
            fclose($file);
        }
        
    }
    function mediaAlunos($numeros){ //função para calcular a média dos alunos
        if(empty($numeros)){
            return "Não foi possivel calcular média, pois não há notas cadastradas";
        }
        $soma = array_sum($numeros);
        $media = $soma / count($numeros);
        return number_format($media, 2);
    } //chama a função mediaAlunos e formata o resultado para 2 casas decimais
    $media =  mediaAlunos($numeros);

    if ($mostrarNotas) { //mostra as notas cadastradas
        $file = fopen("notas.txt", "r+");
        if ($file) {
            if (filesize("notas.txt") > 0) {
                $notas = fread($file, filesize("notas.txt"));
            }
            fclose($file);
        } else {
            $status = "Erro ao abrir o arquivo!";
        }
    }

    if ($limparNotas) { //limpa as notas cadastradas escrevendo um arquivo vazio
        $file = fopen("notas.txt", "w");
        if ($file) {
            fwrite($file, "");
            fclose($file);
            $status = "Notas apagadas com sucesso!";
            $notas = "";
        } else {
            $status = "Erro ao abrir o arquivo!";
        }
    }

}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Armazenamento de Notas</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <h1>Sistema de Armazenamento de Notas</h1>
    <form method="post" action="">
        <label for="nomeAluno">Insira o Nome Completo do Aluno</label>
        <input type="text" name="nomeAluno" required>
        <br>
        <label for="notaAluno">Insira a nota do Aluno</label>
        <input type="number" name="notaAluno" min="0" max="10" required>
        <br>
        <input type="submit" value="Enviar">
        <p><?php echo $status; ?></p>
    </form>
    <div name="notas">
        <h2>Notas Cadastradas</h2>
        <form method="post" action="" class="notas">
            <div class="botoes">
                <input type="submit" name="limparNotas" value="Limpar Notas">
                <input type="submit" name="mostrarNotas" value="Mostrar Notas">
            </div>

        </form>
        <?php
        echo nl2br($notas);
        ?>
        <h3>Média dos Alunos</h3>

        <p><?php echo $media; ?></p>

    </div>
</body>

</html>