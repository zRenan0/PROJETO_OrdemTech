<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">        
        <link href="style_css/geral1.css" rel="stylesheet" type="text/css"/>
    <title>Login</title>
</head>
<body>
    <img src="img/logo.png"  alt="" width="400" height="auto" style="margin: 100px; " />
    <div class="container">
    <h2>Entrar</h2>

        <form action="/projeto2/Login" method="post">

            <input type="email" class="usuario" name="email" placeholder="Email" required>


            <input type="password" class="senha" name="senha" placeholder="Senha" required>

            <% if (request.getParameter("error") != null) { %>
                <p style="color:red;"><%= request.getParameter("error") %></p>
            <% } %>

            <button class="entrar" type="submit">Entrar</button>
        </form>
            
            <hr>
        
            <a href="cadastrar.jsp">
                <button class="cadastrar" type="button">Inscreva-se</button>
            </a>    
    
            <p style="color: black; text-align: center; margin-top:45px; margin-bottom: 0px;">Esqueceu a senha? <a href="resetar_senha.jsp">Clique aqui!</a></p>
    </div>
            

</body>
</html>
