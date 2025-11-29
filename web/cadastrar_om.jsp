<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FornecedorDAO" %>
<%@ page import="model.Fornecedor" %>
<%@ page import="dao.OMDAO" %>
<%@ page import="model.OM" %>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    OMDAO dao = new OMDAO();
    List<OM> ordens = dao.listar();
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar OM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/projeto2/style_css/style_principal.css" rel="stylesheet" type="text/css"/>
</head>
<body >
    
    <div class="sidebar">
        <div class="logo">
          <img src="img/logo.png" alt="Logo OrdemTech" class="logo" >
        </div>

        <ul class="menu">
          <li><a href="dashboard.jsp"><i class="fas fa-home"></i> Ordens de Manutenção</a></li>
          <li><a href="fornecedores.jsp"><i class="fas fa-tasks"></i> Fornecedor</a></li>
          <li><a href="cadastrar_om.jsp"><i class="fas fa-users"></i> Cadastrar OM</a></li>
        </ul>
            <span class="usuario">
                <p> Usuário - <%= session.getAttribute("userNome") %></p>
            </span>
      </div>
            
            
<div class="main-content p-4 flex-grow-1">
    <h3>Cadastrar Ordem de Manutenção</h3>

    <form action="OMServlet" method="post">
        <input type="hidden" name="acao" value="inserir"> <!-- 🔹 ESSENCIAL -->

        <div class="forms">
            <label for="placa" class="form-label">Placa</label>
            <input type="text" name="placa" id="placa" class="form-control" required>
        </div>

        <div class="forms">
            <label for="modelo" class="form-label">Modelo</label>
            <input type="text" name="modelo" id="modelo" class="form-control" required>
        </div>

        <div class="forms" >
            <label for="data" class="form-label">Data</label>
            <input type="date" name="data" id="data" class="form-control" required>
        </div>

        <div class="forms" >
            <label for="status" class="form-label">Status</label>
            <select name="status" id="status" class="form-select">
                <option value="Aberta">Aberta</option>
                <option value="Em andamento">Em andamento</option>
                <option value="Encerrada">Encerrada</option>
            </select>
        </div>

        <div class="forms" >
            <label for="descricao" class="form-label">Descrição</label>
            <textarea name="descricao" id="descricao" class="form-control"></textarea>
        </div>

        <!-- SELECT DE FORNECEDORES -->
        <div  class="forms">
            <label for="idFornecedor" class="form-label">Fornecedor</label>
            <select name="idFornecedor" id="idFornecedor" class="form-select" required>
                <%
                    FornecedorDAO fdao = new FornecedorDAO();
                    List<Fornecedor> fornecedores = fdao.listar();
                    for (Fornecedor f : fornecedores) {
                %>
                    <option value="<%= f.getId() %>"><%= f.getNome() %></option>
                <%
                    }
                %>
            </select>
        </div>

        <button   type="submit" class="btn btn-primary">Salvar</button>
    </form>
            
</div>
</body>
</html>