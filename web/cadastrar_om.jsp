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
    <title>Cadastrar Ordem de Manutenção</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style_css/dashboard.css">
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
        <div class="p-4 flex-grow-1">
            <h3>Cadastrar Ordem de Manutenção</h3>
                <form action="OMServlet" method="post">
                    <input type="hidden" name="acao" value="inserir">
                    <input type="text" name="nome" placeholder="Nome" required>
                    <input type="text" name="sigla" placeholder="Sigla" required>
                    <input type="text" name="cidade" placeholder="Cidade" required>
                    <button type="submit">Salvar</button>
                </form>

            <form class="row g-3 mt-3">
                <div class="col-md-4">
                    <label class="form-label">Placa</label>
                    <input type="text" class="form-control" name="placa">
                </div>
                <div class="col-md-4">
                    <label class="form-label">Modelo</label>
                    <input type="text" class="form-control" name="modelo">
                </div>
                <div class="col-md-4">
                    <label class="form-label">Data</label>
                    <input type="date" class="form-control" name="data">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Descrição</label>
                    <textarea class="form-control" rows="3" name="descricao"></textarea>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Status</label>
                    <select class="form-select" name="status">
                        <option value="Aberto">Aberto</option>
                        <option value="Agendado">Agendado</option>
                        <option value="Concluído">Concluído</option>
                    </select>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-success">Salvar</button>
                    <button type="reset" class="btn btn-secondary">Limpar</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
