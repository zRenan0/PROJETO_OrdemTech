<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Fornecedor" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Fornecedor fornecedor = (Fornecedor) request.getAttribute("fornecedor");
    boolean editando = fornecedor != null;
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title><%= editando ? "Editar Fornecedor" : "Novo Fornecedor" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/projeto2/style_css/style_principal.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-dark bg-dark p-3">
        <span class="navbar-brand mb-0 h1">OrdemTech</span>
        <span class="text-light">
            <%= session.getAttribute("userNome") %> - <small>Administrador</small>
        </span>
    </nav>

    <div class="d-flex">
        <!-- MENU LATERAL -->
        <div class="bg-light border-end p-3" style="width: 250px; height: 100vh;">
            <h5>Menu</h5>
            <ul class="nav flex-column">
                <li class="nav-item"><a href="dashboard.jsp" class="nav-link">Início</a></li>
                <li class="nav-item"><a href="fornecedores.jsp" class="nav-link active">Fornecedores</a></li>
                <li class="nav-item"><a href="cadastrar_om.jsp" class="nav-link">Cadastrar OM</a></li>
                <li class="nav-item"><a href="veiculos.jsp" class="nav-link">Veículos</a></li>
            </ul>
        </div>

        <!-- CONTEÚDO PRINCIPAL -->
        <div class="main-content flex-grow-1 p-4">
            <h3><%= editando ? "Editar Fornecedor" : "Novo Fornecedor" %></h3>
            <form action="FornecedorServlet" method="post" class="row g-3 mt-2">
                <input type="hidden" name="acao" value="<%= editando ? "atualizar" : "inserir" %>">
                <% if (editando) { %>
                    <input type="hidden" name="id" value="<%= fornecedor.getId() %>">
                <% } %>

                <div class="col-md-6">
                    <label class="form-label">Nome</label>
                    <input type="text" class="form-control" name="nome"
                           value="<%= editando ? fornecedor.getNome() : "" %>" required>
                </div>

                <div class="col-md-3">
                    <label class="form-label">CNPJ</label>
                    <input type="text" class="form-control" name="cnpj"
                           value="<%= editando ? fornecedor.getCnpj() : "" %>" required>
                </div>

                <div class="col-md-3">
                    <label class="form-label">UF</label>
                    <input type="text" class="form-control" name="uf" maxlength="2"
                           value="<%= editando ? fornecedor.getUf() : "" %>" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Cidade</label>
                    <input type="text" class="form-control" name="cidade"
                           value="<%= editando ? fornecedor.getCidade() : "" %>">
                </div>

                <div class="col-12">
                    <button type="submit" class="btn btn-success">
                        <%= editando ? "Salvar alterações" : "Salvar" %>
                    </button>
                    <a href="fornecedores.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
