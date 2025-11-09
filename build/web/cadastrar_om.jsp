<%@ page import="java.util.List" %>
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
    <title>Ordens de Manutenção</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
                <li class="nav-item"><a href="fornecedores.jsp" class="nav-link">Fornecedores</a></li>
                <li class="nav-item"><a href="cadastrar_om.jsp" class="nav-link active">Ordens de Manutenção</a></li>
                <li class="nav-item"><a href="veiculos.jsp" class="nav-link">Veículos</a></li>
            </ul>
        </div>

        <!-- CONTEÚDO PRINCIPAL -->
        <div class="main-content flex-grow-1 p-4">
            <div class="d-flex justify-content-between mb-3">
                <h3>Ordens de Manutenção</h3>
                <a href="om_editar.jsp" class="btn btn-primary">+ Nova OM</a>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nº Ordem</th>
                        <th>Placa</th>
                        <th>Modelo</th>
                        <th>Data</th>
                        <th>Status</th>
                        <th>Descrição</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                <% for (OM om : ordens) { %>
                    <tr>
                        <td><%= om.getNumeroOrdem() %></td>
                        <td><%= om.getPlaca() %></td>
                        <td><%= om.getModelo() %></td>
                        <td><%= om.getData() %></td>
                        <td><%= om.getStatus() %></td>
                        <td><%= om.getDescricao() %></td>
                        <td>
                            <a href="OMServlet?acao=editar&id=<%= om.getId() %>" class="btn btn-sm btn-success">Editar</a>
                            <a href="OMServlet?acao=excluir&id=<%= om.getId() %>" class="btn btn-sm btn-danger"
                               onclick="return confirm('Deseja excluir esta OM?');">Excluir</a>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
