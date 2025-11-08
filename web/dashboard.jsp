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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordens de Manutenção</title>

    <!-- Bootstrap -->
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

    <!-- CONTAINER PRINCIPAL -->
    <div class="d-flex">
        <!-- MENU LATERAL -->
        <div class="bg-light border-end p-3" style="width: 250px; height: 100vh;">
            <h5>Menu</h5>
            <ul class="nav flex-column">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="dashboard.jsp" class="nav-link">Inicío</a>
                    </li>
                    <li class="nav-item">
                        <a href="fornecedores.jsp" class="nav-link">Fornecedores</a>
                    </li>
                    <li class="nav-item">
                        <a href="cadastrar_om.jsp" class="nav-link">Cadastrar OM</a>
                    </li>
                    <li class="nav-item">
                        <a href="veiculos.jsp" class="nav-link">Veículos</a>
                    </li>
                </ul>
            </ul>
        </div>

        <!-- CONTEÚDO -->
        <div class="p-4 flex-grow-1">
            <h3>Ordens de Manutenção</h3>
            <button class="btn btn-primary mb-3">+ Adicionar</button>

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
                    <tr>
                        <td>714192</td>
                        <td><span class="badge bg-warning text-dark">Aberto</span></td>
                        <td>ABC-1234</td>
                        <td>Toyota Corolla</td>
                        <td>20/10/2025</td>
                        <td>
                            <button class="btn btn-sm btn-success">Editar</button>
                            <button class="btn btn-sm btn-danger">Excluir</button>
                        </td>
                    </tr>
                    <tr>
                        <td>714188</td>
                        <td><span class="badge bg-info text-dark">Agendado</span></td>
                        <td>XYZ-5678</td>
                        <td>Fiat Uno</td>
                        <td>21/10/2025</td>
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
