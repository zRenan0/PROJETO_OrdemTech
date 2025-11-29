<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.OM" %>

<%
    // Verifica login
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // OM recebida do OSServlet
    OM om = (OM) request.getAttribute("om");

    if (om == null) {
        out.println("<h3 style='color:red;'>Nenhuma OM selecionada.</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar OS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style_css/style_principal.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="sidebar">
    <div class="logo">
        <img src="img/logo.png" alt="Logo OrdemTech" class="logo">
    </div>

    <ul class="menu">
        <li><a href="dashboard.jsp">Ordens de Manutenção</a></li>
        <li><a href="fornecedores.jsp">Fornecedor</a></li>
        <li><a href="cadastrar_om.jsp">Cadastrar OM</a></li>
    </ul>

    <span class="usuario">
        <%= session.getAttribute("userNome") %> - <small>Administrador</small>
    </span>
</div>

<div class="main-content p-4 flex-grow-1">

    <h3>Cadastrar Ordem de Serviço</h3>
    
        <div class="forms">
            <label class="form-label">Veículo</label>
            <p class="form-control" style="background: #f5f5f5;">
                <strong>Placa:</strong> <%= om.getPlaca() %> <br>
                <strong>Modelo:</strong> <%= om.getModelo() %>
            </p>
        </div>
            
<form action="OSServlet" method="post">
    <input type="hidden" name="acao" value="inserir">
    <input type="hidden" name="idOM" value="<%= om.getId() %>">

    <label>Tipo OS</label>
    <select name="tipo_os" class="form-control" required>
        <option value="">Selecione...</option>
        <option value="sinistro">Sinistro</option>
        <option value="corretiva">Corretiva</option>
        <option value="preventiva">Preventiva</option>
    </select>

    <label>Descrição</label>
    <textarea name="descricao" class="form-control" required></textarea>

    <button class="btn btn-primary mt-3">Salvar</button>
</form>

</div>

</body>
</html>
