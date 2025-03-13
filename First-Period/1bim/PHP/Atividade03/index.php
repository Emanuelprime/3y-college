<?php

session_start();
class Aluno
{
    private $nome;
    private $matricula;
    private $curso;

    public function __construct($nome, $matricula, $curso)
    {
        $this->nome = $nome;
        $this->matricula = $matricula;
        $this->curso = $curso;
    }

    public function getNome()
    {
        return $this->nome;
    }
    public function getCurso()
    {
        return $this->curso;
    }
    public function getMatricula()
    {
        return $this->matricula;
    }
}

class CadastroAlunos
{
    private $alunos = [];

    public function cadastrarAluno(Aluno $aluno)
    {
        $this->alunos[] = $aluno;
    }

    public function getAlunos()
    {
        return $this->alunos;
    }

   


}
if(!isset($_SESSION['cadastro'])){
    $_SESSION['cadastro'] = new CadastroAlunos();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $matricula = $_POST['matricula'];
    $curso = $_POST['curso'];
    $aluno = new Aluno($nome, $matricula, $curso);
    $_SESSION['cadastro']->cadastrarAluno($aluno);
    header("location: " .  $_SERVER['PHP_SELF']);
    exit();

}


$alunosCadastrados = $_SESSION['cadastro']->getAlunos();



?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atividade03</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <h1>Atividade Aula 05 Mão na Massa</h1>
    <form method="POST" action="">
        <h2>Sistema de Cadastro de Alunos em PHP</h2>

        <input type="text" name="nome" placeholder="Nome" required>
        <input type="text" name="matricula" placeholder="Matricula" required>
        <input type="text" name="curso" placeholder="Curso" required>
        <button type="submit">Cadastrar</button>

    </form>

    <h2>Alunos Cadastrados</h2>
    <table>
        <tr>
            <th>Nome</th>
            <th>Matricula</th>
            <th>Curso</th>
        </tr>
        <?php
        foreach ($alunosCadastrados as $aluno) {
            echo "<tr>";
            echo "<td>" . $aluno->getNome() . "</td>";
            echo "<td>" . $aluno->getMatricula() . "</td>";
            echo "<td>" . $aluno->getCurso() . "</td>";
            echo "</tr>";
        }
        ?>
    </table>

</body>

</html>