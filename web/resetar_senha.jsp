<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resetar Senha</title>
    <link rel="stylesheet" href="style_css/login.css">
</head>
<body>

<div class="container">
    <h2>Redefinir Senha</h2>

    <form action="ResetSenha" method="post">
        <label>Email cadastrado:</label>
        <input type="email" name="email" required>

        <label>Nova Senha:</label>
        <input type="password" name="novaSenha" required>

        <button type="submit">Salvar Nova Senha</button>

        <a href="login.jsp">Voltar ao Login</a>
    </form>

    <p style="color:red;">
        ${erro != null ? erro : ""}
    </p>
    <p style="color:green;">
        ${sucesso != null ? sucesso : ""}
    </p>
</div>

</body>
</html>
