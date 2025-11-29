<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OS" %>
<%@ page import="model.OM" %>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OM om = (OM) request.getAttribute("om");
    List<OS> listaOS = (List<OS>) request.getAttribute("listaOS");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OS da OM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style_css/style_principal.css" rel="stylesheet">

</head>

<body>

<div class="sidebar">
    <div class="logo">
        <img src="img/logo.png" class="logo">
    </div>

    <ul class="menu">
        <li><a href="dashboard.jsp">Ordens de Manutenção</a></li>
        <li><a href="fornecedores.jsp">Fornecedor</a></li>
        <li><a href="cadastrar_om.jsp">Cadastrar OM</a></li>
    </ul>

    <span class="usuario">
        <p> Usuário - <%= session.getAttribute("userNome") %></p>
    </span>
</div>


<div class="main-content p-4 flex-grow-1">

    <a href="dashboard.jsp">
        <button class="back-btn" id="backBtn" aria-label="Voltar" title="Voltar">
            <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                <path d="M18.3 5.71 12 12l6.3 6.29-1.42 1.42L12 13.41l-6.29 6.3-1.42-1.42L10.59 12 4.29 5.71 5.71 4.29 12 10.59l6.29-6.3z"/>
            </svg>
        </button>
    </a>
    
        <h3>Ordens de Serviço</h3>
        
    <table class="table table-striped" style="margin-top: 30px;width: 300px;">
        <thead>
            <tr>
                <th>
                    <a href="OMServlet?acao=editar&id=<%= om.getId() %>" class="btn btn-primary btn-sm">Informações</a>
                </th>
                <th>
                    <a class="btn btn-dark btn-sm">Ordem de Serviço</a>
                </th>
            </tr>
        </thead>
    </table>

    <div class="text-end mb-3">
        <a href="OSServlet?acao=form&idOM=<%= om.getId() %>" class="btn btn-primary">
            + Adicionar OS
        </a>
    </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID OS</th>
                    <th>Tipo</th>
                    <th>Descrição</th>
                    <th>Ações</th>
                </tr>
            </thead>

            <tbody>
                <%
                    List<OS> lista = (List<OS>) request.getAttribute("listaOS");

                    if (lista != null && !lista.isEmpty()) {
                        for (OS os : lista) {
                %>

                <tr>
                    <td><%= os.getId() %></td>
                    <td><%= os.getTipoOS() %></td>
                    <td><%= os.getDescricao() %></td>

                    <td>
                        <a href="OsItemServlet?acao=form&idOS=<%= os.getId() %>" 
                           class="btn btn-sm btn-success">Editar</a>

    <a href="OSServlet?acao=excluir&id=<%= os.getId() %>&idOM=<%= om.getId() %>"
   class="btn btn-sm btn-danger"
   onclick="return confirm('Tem certeza que deseja excluir esta OS?');">
   Excluir
</a>
                    </td>
                </tr>

                <%
                        }
                    } else {
                %>

                <tr>
                    <td colspan="4" class="text-center text-muted">
                        Nenhuma OS encontrada para esta OM.
                    </td>
                </tr>

                <% 
                    } 
                %>
            </tbody>
        </table>

</div>

</body>
</html>
