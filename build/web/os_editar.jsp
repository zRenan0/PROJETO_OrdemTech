<%@ page import="model.OM" %>
<%@ page import="model.OS" %>
<%@ page import="dao.FornecedorDAO" %>
<%@ page import="model.Fornecedor" %>
<%@ page import="model.OsItem" %>
<%@ page import="java.util.List" %>


<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OS os = (OS) request.getAttribute("os");
    OM om = (OM) request.getAttribute("om");

    if (os == null || om == null) {
        out.println("<h3 style='color:red;'>Erro: OS ou OM não encontrada.</h3>");
        return;
    }
    
    FornecedorDAO fornecedorDAO = new FornecedorDAO();
    Fornecedor fornecedor = fornecedorDAO.buscarPorId( om.getIdFornecedor() );
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Ordem de Serviço</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style_css/style_principal.css" rel="stylesheet" type="text/css"/>
    <style>
        .tabela-os th {
            background-color: #002244;
            color: white;
            text-align: center;
        }
        .tabela-os td {
            text-align: center;
            vertical-align: middle;
        }
        .btn-add {
            background-color: #007bff;
            color: white;
            border: none;
        }
        .btn-excluir {
            background-color: #e74c3c;
            color: white;
            font-size: 12px;
            padding: 4px 10px;
        }
        .descricao-box {
            background: #e6e6e6;
            padding: 8px;
            border-radius: 5px;
        }
    </style>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">
        <img src="img/logo.png" class="logo" alt="">
    </div>

    <ul class="menu">
        <li><a href="dashboard.jsp">Ordens de manutenção</a></li>
        <li><a href="fornecedores.jsp">Fornecedores</a></li>
        <li><a href="cadastrar_om.jsp">Cadastrar OM</a></li>
    </ul>

    <span class="usuario">
        <p> Usuário - <%= session.getAttribute("userNome") %></p>
    </span>
</div>

<!-- CONTEÚDO -->
<div class="main-content p-4">
    
        <a href="OSServlet?acao=listar&idOM=<%= om.getId() %>">
            <button class="back-btn" id="backBtn" aria-label="Voltar" title="Voltar">
                <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <path d="M18.3 5.71 12 12l6.3 6.29-1.42 1.42L12 13.41l-6.29 6.3-1.42-1.42L10.59 12 4.29 5.71 5.71 4.29 12 10.59l6.29-6.3z"/>
                </svg>
            </button>
        </a>
    <h4><strong>Ordens de Serviço</strong></h4>

    <div style="margin-top: 15px;">
        <p>
            <strong>Modelo:</strong><%= om.getModelo() %><br>
            <strong>Placa:</strong> <%= om.getPlaca() %>
        </p>

        <p>
            <strong>Fornecedor:</strong><%= fornecedor.getNome() %><br>
            <strong>CNPJ:</strong><%= fornecedor.getCnpj() %>

        </p>
    </div>

    <hr>

    <!-- Descrição -->
    <p><strong>Descrição:</strong></p>
    <div class="descricao-box"><%= os.getDescricao() %>
    </div>

    <!-- Botão adicionar -->
        <div class="text-end mt-3">
            <button type="button" class="btn btn-add" data-bs-toggle="modal" data-bs-target="#modalItem">
                + Adicionar item
            </button>
        </div>
    
<div class="modal fade" id="modalItem" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Adicionar Item à OS</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <form action="OsItemServlet" method="post" class="p-3">

        <input type="hidden" name="acao" value="inserir">
        <input type="hidden" name="idOS" value="<%= os.getId() %>">

        <label class="mt-2">Tipo</label>
        <select name="tipo" class="form-control" required>
            <option value="">Selecione</option>
            <option value="Peça">Peça</option>
            <option value="Mão de obra">Mão de obra</option>
        </select>
        
        <label class="mt-2">Descrição</label>
        <input type="text" name="descricao" class="form-control" required>

        <label class="mt-2">Quantidade</label>
        <input type="number" name="quantidade" class="form-control" required>

        <label class="mt-2">Valor</label>
        <input type="number" step="0.01" name="valor" class="form-control" required>

        <button type="submit" class="btn btn-primary mt-3">Salvar</button>

      </form>

    </div>
  </div>
</div>



    <table class="table table-bordered tabela-os mt-4">
        <thead>
            <tr>
                <th>P/MO</th>
                <th>Descrição</th>
                <th>Quantidade</th>
                <th>Valor</th>
                <th>Ações</th>
            </tr>
        </thead>

            <tbody>
            <%
                List<OsItem> itens = (List<OsItem>) request.getAttribute("itens");
                
                double total = 0;

                    for (OsItem it : itens) {
                        total += it.getValor() * it.getQuantidade();
                    }

                    request.setAttribute("total", total);

                if (itens != null && !itens.isEmpty()) {

                    for (OsItem it : itens) {
            %>
                        <tr>
                            <td><%= it.getTipo() %></td>
                            <td><%= it.getDescricao() %></td>
                            <td><%= it.getQuantidade() %></td>
                            <td>R$ <%= it.getValor() %></td>

                            <td>
                                <a href="OsItemServlet?acao=excluir&id=<%= it.getId() %>&idOS=<%= os.getId() %>"
                                    "class="btn btn-sm btn-danger"
                                    onclick="return confirm('Tem certeza que deseja excluir este item?');"
                                   class="btn btn-excluir">Excluir</a>
                            </td>
                        </tr>
            <%
                    }

                } else {
            %>
                    <tr>
                        <td colspan="5" class="text-center text-muted">Nenhum item cadastrado.</td>
                    </tr>
            <%
                }
            %>
            </tbody>
    </table>

    <!-- Rodapé -->
<p>
    <strong>Tipo de OS:</strong> <%= os.getTipoOS() %>

    <span style="float:right;">
        <strong>Valor total:</strong> R$ <%= String.format("%.2f", (Double) request.getAttribute("total")) %>
    </span>
</p>

</div>

</body>
</html>
