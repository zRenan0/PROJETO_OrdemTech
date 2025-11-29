<%-- 
    Document   : cadastrar
    Created on : 15 de out. de 2025, 22:58:33
    Author     : Bruno
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Usuário</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style_css/style_login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <img src="img/logo.png" alt="" width="300" height="auto" style="margin: 50px"/>
        <a href="login.jsp">
            <button class="back-btn" id="backBtn" aria-label="Voltar" title="Voltar">
                <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <path d="M15.41 7.41 14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
                </svg>
            </button>
        </a>    

        <div class="container">
            <!-- Formulário de Cadastro -->
            <form action="${pageContext.request.contextPath}/CadastrarUsuario" method="post">


                <div class="nome">
                    <label class="form-label">Nome</label>
                    <input type="text" class="form-nome" id="inputnome" name="nome" required>
                </div>

                <div class="sobrenome">
                    <label class="form-label">Sobrenome</label>
                    <input type="text" class="form-sobrenome" id="inputsobrenome" name="sobrenome" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" id="inputEmail4" name="email" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Senha</label>
                    <input type="password" class="form-control" id="inputPassword4" name="senha" required>
                </div>            

                <button type="submit" class="login">Cadastrar</button>
            </form>    
        </div>
    </body>
</html>
