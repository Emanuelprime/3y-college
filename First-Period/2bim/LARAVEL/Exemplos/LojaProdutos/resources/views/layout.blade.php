<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exemplo Laravel</title>
</head>
<body>
<header>
<h2>Meu Sistema Laravel</h2>
<nav>
<a href="{{ url('/') }}">Início</a> |
<a href="{{ url('/produtos') }}">Produtos</a>
</nav>
</header>

<main>
@yield('content')
</main>
</body>

</html>