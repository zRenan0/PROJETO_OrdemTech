<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.FornecedorDAO" %>
<%@ page import="model.Fornecedor" %>
<%@ page import="model.OM" %>
<%@ page import="java.util.List" %>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OM om = (OM) request.getAttribute("om");
    boolean editando = (om != null);

    FornecedorDAO fornecedorDAO = new FornecedorDAO();
    List<Fornecedor> fornecedores = fornecedorDAO.listar();
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title><%= editando ? "Editar OM" : "Nova OM" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-dark bg-dark p-3">
    <span class="navbar-brand mb-0 h1">OrdemTech</span>
</nav>

<div class="container mt-4">
    <h3><%= editando ? "Editar Ordem de Manutenção" : "Nova Ordem de Manutenção" %></h3>

    <form action="OMServlet" method="post" class="row g-3 mt-2">
        <input type="hidden" name="acao" value="<%= editando ? "atualizar" : "inserir" %>">

        <% if(editando){ %>
            <input type="hidden" name="id" value="<%= om.getId() %>">
        <% } %>

        <div class="col-md-6">
            <label class="form-label">Fornecedor</label>
            <select name="id_fornecedor" class="form-select" required>
                <option value="">-- Selecione --</option>
                <% for (Fornecedor f : fornecedores) { %>
                    <option value="<%= f.getId() %>"
                        <%= editando && om.getIdFornecedor() == f.getId() ? "selected" : "" %>>
                        <%= f.getNome() %>
                    </option>
                <% } %>
            </select>
        </div>

        <div class="col-md-3">
            <label class="form-label">Placa</label>
            <input type="text" class="form-control" name="placa" value="<%= editando ? om.getPlaca() : "" %>" required>
        </div>

        <div class="col-md-3">
            <label class="form-label">Modelo</label>
            <input type="text" class="form-control" name="modelo" value="<%= editando ? om.getModelo() : "" %>" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Data</label>
            <input type="date" class="form-control" name="data" value="<%= editando && om.getData()!=null ? om.getData().toString() : "" %>" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Status</label>
            <select name="status" class="form-select" required>
                <option value="">Selecione</option>
                <option value="Aberta" <%= editando && "Aberta".equals(om.getStatus()) ? "selected" : "" %>>Aberta</option>
                <option value="Em andamento" <%= editando && "Em andamento".equals(om.getStatus()) ? "selected" : "" %>>Em andamento</option>
                <option value="Concluída" <%= editando && "Concluída".equals(om.getStatus()) ? "selected" : "" %>>Concluída</option>
            </select>
        </div>

        <div class="col-md-12">
            <label class="form-label">Descrição</label>
            <textarea class="form-control" name="descricao" rows="3"><%= editando ? om.getDescricao() : "" %></textarea>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-success">Salvar</button>
            <a href="cadastrar_om.jsp" class="btn btn-secondary">Cancelar</a>
        </div>

    </form>
</div>
</body>
</html>