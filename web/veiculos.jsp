<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Veículos</title>
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
                <li class="nav-item"><a href="dashboard.jsp" class="nav-link">Inicío</a></li>
                <li class="nav-item"><a href="fornecedores.jsp" class="nav-link">Fornecedores</a></li>
                <li class="nav-item"><a href="cadastrar_om.jsp" class="nav-link active">Cadastrar OM</a></li>
                <li class="nav-item"><a href="veiculos.jsp" class="nav-link">Veículos</a></li>
            </ul>
        </div>

        <!-- CONTEÚDO -->
            <h3>Cadastro de Veículos</h3>
            <form action="VeiculoServlet" method="post">
                <input type="hidden" name="acao" value="inserir">
                <input type="text" name="placa" placeholder="Placa" required>
                <input type="text" name="modelo" placeholder="Modelo" required>
                <input type="number" name="ano" placeholder="Ano" required>
                <input type="text" name="status" placeholder="Status" required>
                <button type="submit">Salvar</button>
            </form>


            <!-- TABELA DE VEÍCULOS -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Placa</th>
                        <th>Modelo</th>
                        <th>Ano</th>
                        <th>Status</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ABC-1234</td>
                        <td>Toyota Corolla</td>
                        <td>2020</td>
                        <td><span class="badge bg-success">Ativo</span></td>
                        <td>
                            <button class="btn btn-sm btn-success">Editar</button>
                            <button class="btn btn-sm btn-danger">Excluir</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
