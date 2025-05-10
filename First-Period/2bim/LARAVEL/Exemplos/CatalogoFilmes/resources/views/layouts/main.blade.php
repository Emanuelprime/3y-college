<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>@yield('titulo')</title>
<style>
body { font-family: Arial, sans-serif; }
.container { width: 80%; margin: auto; }
.card { border: 1px solid #ccc; padding: 10px; margin: 10px; }
</style>
</head>
<body>
<div class="container">
<h1>@yield('titulo_pagina')</h1>
@yield('conteudo')
</div>
</body>
</html>