<%@ page import="java.util.List" %>
<%@ page import="dao.FornecedorDAO" %>
<%@ page import="model.Fornecedor" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    FornecedorDAO dao = new FornecedorDAO();
    List<Fornecedor> fornecedores = dao.listar();
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Fornecedores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/projeto2/style_css/style_principal.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-dark bg-dark p-3">
        <span class="navbar-brand mb-0 h1">OrdemTech</span>
        <span class="text-light"><%= session.getAttribute("userNome") %> - <small>Administrador</small></span>
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
            <div class="d-flex justify-content-between mb-3">
                <h3>Cadastro de Fornecedores</h3>
                <a href="fornecedores_editar.jsp" class="btn btn-primary">+ Adicionar</a>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CNPJ</th>
                        <th>UF</th>
                        <th>Cidade</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Fornecedor f : fornecedores) { %>
                    <tr>
                        <td><%= f.getNome() %></td>
                        <td><%= f.getCnpj() %></td>
                        <td><%= f.getUf() %></td>
                        <td><%= f.getCidade() %></td>
                        <td>
                            <a href="FornecedorServlet?acao=editar&id=<%= f.getId() %>" class="btn btn-sm btn-success">Editar</a>
                            <a href="FornecedorServlet?acao=excluir&id=<%= f.getId() %>" class="btn btn-sm btn-danger"
                               onclick="return confirm('Tem certeza que deseja excluir este fornecedor?');">Excluir</a>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
