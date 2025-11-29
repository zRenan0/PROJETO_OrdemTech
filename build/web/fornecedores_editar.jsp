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
            <h3><%= editando ? "Editar Fornecedor" : "Cadastrar Fornecedor" %></h3>
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

                <div class="forms">
                    <label class="form-label">CNPJ</label>
                    <input type="text" class="form-control" name="cnpj"
                           value="<%= editando ? fornecedor.getCnpj() : "" %>" required>
                </div>

                <div class="forms">
                    <label class="form-label">UF</label>
                    <input type="text" class="form-control" name="uf" maxlength="2"
                           value="<%= editando ? fornecedor.getUf() : "" %>" required>
                </div>

                <div class="forms">
                    <label class="form-label">Cidade</label>
                    <input type="text" class="form-control" name="cidade"
                           value="<%= editando ? fornecedor.getCidade() : "" %>">
                </div>

                <div class="forms">
                    <button type="submit" class="btn btn-primary">
                        <%= editando ? "Salvar alterações" : "Salvar" %>
                    </button>
                    <a href="fornecedores.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
