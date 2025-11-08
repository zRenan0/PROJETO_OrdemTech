<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Entrar</h2>

    <form action="/projeto2/Login" method="post">
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Senha:</label><br>
        <input type="password" name="senha" required><br><br>

        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;"><%= request.getParameter("error") %></p>
        <% } %>

        <button type="submit">Entrar</button>
    </form>

    <p>Não tem conta? <a href="cadastrar.jsp">Cadastre-se</a></p>
</body>
</html>
