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
    <title>Fornecedores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/projeto2/style_css/style_principal.css" rel="stylesheet" type="text/css"/>
</head>
<body>
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

        <!-- CONTEÚDO PRINCIPAL -->
        <div class="main-content flex-grow-1 p-4">
            <div class="d-flex justify-content-between mb-3">
                <h3>Fornecedores</h3>
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
