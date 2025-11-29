<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.OM" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FornecedorDAO" %>
<%@ page import="model.Fornecedor" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    OM om = (OM) request.getAttribute("om");
    boolean editando = om != null;
%>
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
    <title><%= editando ? "Editar OM" : "Nova OM" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style_css/style_principal.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">
        <img src="img/logo.png" alt="Logo OrdemTech" class="logo">
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
    
    <a href="dashboard.jsp">
        <button class="back-btn" id="backBtn" aria-label="Voltar" title="Voltar">
            <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                <path d="M18.3 5.71 12 12l6.3 6.29-1.42 1.42L12 13.41l-6.29 6.3-1.42-1.42L10.59 12 4.29 5.71 5.71 4.29 12 10.59l6.29-6.3z"/>
            </svg>
        </button>
    </a>
    

    <h3><%= editando ? "Ordem de Manutenção" : "Nova Ordem de Manutenção" %></h3>

  

        <input type="hidden" name="acao" value="<%= editando ? "atualizar" : "inserir" %>">
        <% if (editando) { %>
            <input type="hidden" name="id" value="<%= om.getId() %>">
        <% } %>
        
<table class="table table-striped" style="margin-top: 30px;width: 300px; ">
    <thead>
        <tr>
            <th>
            <a  class="btn btn-primary btn-sm">
            Informações
            </a>
            </th>
            
            <th>
            <a href="OSServlet?acao=listar&idOM=<%= om.getId() %>" class="btn btn-dark btn-sm">
            Ordem de Serviço
            </a>
            </th>    
        </tr>
    </thead>

</table>


        <h4 class="mt-4 mb-2">Informações do Veículo</h4>

        <div class="card p-3 mb-4">
            <div class="row g-3">

                <div class="col-md-4">
                    <label class="form-label">Placa</label>
                    <input type="text" class="form-control" name="placa"
                           value="<%= editando ? om.getPlaca() : "" %>" required>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Modelo</label>
                    <input type="text" class="form-control" name="modelo"
                           value="<%= editando ? om.getModelo() : "" %>" required>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Data</label>
                    <input type="date" class="form-control" name="data"
                           value="<%= editando && om.getData() != null ? om.getData().toString() : "" %>" required>
                </div>

            </div>
        </div>



        <h4 class="mt-4 mb-2">Informações da Oficina</h4>

        <div class="card p-3 mb-4">
    <div class="row g-3">

        <% 
            FornecedorDAO fornecedorDAO = new FornecedorDAO();
            List<Fornecedor> listaFornecedores = fornecedorDAO.listar();

            // Se estiver editando, pega o fornecedor da OM
            Fornecedor fornecedorSelecionado = null;
            if (editando && om.getIdFornecedor() > 0) {
                fornecedorSelecionado = fornecedorDAO.buscarPorId(om.getIdFornecedor());
            }
        %>

<div class="col-md-6">
    <label class="form-label">Oficina</label>
    <input type="hidden" name="id_fornecedor" value="<%= fornecedorSelecionado != null ? fornecedorSelecionado.getId() : "" %>">
    <input type="text" class="form-control" 
           value="<%= fornecedorSelecionado != null ? fornecedorSelecionado.getNome() : "" %>" readonly>
</div>

<% if (fornecedorSelecionado != null) { %>
    <div class="col-md-6">
        <label class="form-label">CNPJ</label>
        <input type="text" class="form-control" value="<%= fornecedorSelecionado.getCnpj() %>" readonly>
    </div>

    <div class="col-md-6">
        <label class="form-label">UF</label>
        <input type="text" class="form-control" value="<%= fornecedorSelecionado.getUf() %>" readonly>
    </div>

    <div class="col-md-6">
        <label class="form-label">Cidade</label>
        <input type="text" class="form-control" value="<%= fornecedorSelecionado.getCidade() %>" readonly>
    </div>
<% } %>

    </div>
</div>

</body>
</html>
