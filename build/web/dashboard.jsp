<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.OMDAO" %>
<%@ page import="model.OM" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Busca todas as OMs cadastradas
    OMDAO dao = new OMDAO();
    List<OM> ordens = dao.listar();   // 🔹 trocado de listarAbertas() para listar()
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Ordens de Manutenção</title>
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

<div class="main-content p-4 flex-grow-1">
    <h3 class="titulo">Ordens de Manutenção</h3>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>OM</th>
                <th>Status</th>
                <th>Placa</th>
                <th>Modelo</th>
                <th>Data</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (OM om : ordens) {
            %>
                <tr>
                    <td><%= om.getNumeroOrdem() %></td>
                    <td><span class="badge <%= "Aberta".equals(om.getStatus()) ? "bg-warning text-dark" : "bg-success" %>">
                        <%= om.getStatus() %></span></td>
                    <td><%= om.getPlaca() %></td>
                    <td><%= om.getModelo() %></td>
                    <td><%= om.getData() %></td>
                    <td>
                        <a href="OMServlet?acao=editar&id=<%= om.getId() %>" class="btn btn-sm btn-success">Editar</a>
                        <a href="OMServlet?acao=excluir&id=<%= om.getId() %>" class="btn btn-sm btn-danger"
                           "class="btn btn-sm btn-danger"
                           onclick="return confirm('Tem certeza que deseja excluir esta OM?');"   
                           >Excluir</a>
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
