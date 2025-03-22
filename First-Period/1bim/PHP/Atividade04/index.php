<?php
session_start();

class Produto {
    private $nome;
    private $preco;
    private $quantidade;

    public function __construct($nome, $preco, $quantidade, $desconto = 0) {
        $this->nome = $nome;
        $this->preco = $preco;
        $this->quantidade = $quantidade;

        if ($desconto > 0 && $desconto <= 100) {
            $this->preco -= ($this->preco * ($desconto / 100));
        }
    }

    public function getNome() {
        return $this->nome;
    }

    public function getPreco() {
        return $this->preco;
    }

    public function getQuantidade() {
        return $this->quantidade;
    }

    public function setNome($novoNome) {
        $this->nome = $novoNome;
    }

    public function setPreco($novoPreco) {
        $this->preco = $novoPreco;
    }

    public function setQuantidade($novoQuantidade) {
        $this->quantidade = $novoQuantidade;
    }

    public function aplicarDesconto($quantia) {
        $novoPreco = $this->getPreco() * ((100 - $quantia) / 100);
        $this->setPreco($novoPreco);
    }
}

class Estoque {
    private $estoque;

    public function __construct() {
        if (!isset($_SESSION['estoque'])) {
            $_SESSION['estoque'] = [];
        }
        $this->estoque = $_SESSION['estoque'];
    }

    public function setEstoque($produto) {
        $this->estoque[] = $produto;
        $_SESSION['estoque'] = $this->estoque;
    }

    public function getEstoque() {
        if (count($this->estoque) === 0) {
            echo "<p>Não há produtos cadastrados no estoque.</p>";
            return;
        }
        foreach ($this->estoque as $produto) {
            echo "<p>Nome do Produto: " . $produto->getNome() . "<br>Preço do Produto: R$" . number_format($produto->getPreco(), 2, ',', '.') . "<br>Quantidade: " . $produto->getQuantidade() . "</p>";
        }
    }

    public function limparEstoque() {
        $_SESSION['estoque'] = [];
        $this->estoque = [];
    }

    public function calcularValorTotal() {
        $total = 0;
        foreach ($this->estoque as $produto) {
            $total += $produto->getPreco() * $produto->getQuantidade();
        }
        return $total;
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atividade Mão na Massa 04</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Sistema de Gestão de Produtos</h1>
    <nav>
        <form method="post">
            <input type="text" name="nome" placeholder="Nome do Produto" required><br>
            <input type="number" name="preco" placeholder="Preço do Produto" min="0" required><br>
            <input type="number" name="quantidade" placeholder="Quantidade" min="0" step="any" required><br>
            <input type="number" name="desconto" placeholder="Desconto (%)" min="0" max="100" required><br>
            <button type="submit">Enviar</button>
            <button type="reset">Limpar Tudo</button>
        </form>

        <form method="post">
            <button type="submit" name="limparEstoque">Apagar Estoque</button>
        </form>

        <form method="post">
            <button type="submit" name="calcularValorTotal">Calcular Valor Total</button>
        </form>
    </nav>
</body>
</html>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['nome'];
    $preco = floatval($_POST['preco']);
    $quantidade = intval($_POST['quantidade']);
    $desconto = isset($_POST['desconto']) ? floatval($_POST['desconto']) : 0;

    $produto = new Produto($nome, $preco, $quantidade, $desconto);
    $estoque = new Estoque();
    $estoque->setEstoque($produto);

    echo "<h2>Produto cadastrado com sucesso.</h2>";
    $estoque->getEstoque();
}

if (isset($_POST['limparEstoque'])) {
    $estoque = new Estoque();
    $estoque->limparEstoque();
    echo "<h2>Estoque limpo.</h2>";
}

if (isset($_POST['calcularValorTotal'])) {
    $estoque = new Estoque();
    $total = $estoque->calcularValorTotal();
    echo "<h2>Valor total do estoque: R$" . number_format($total, 2, ',', '.') . "</h2>";
}
?>