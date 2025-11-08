package servlet;

import dao.FornecedorDAO;
import model.Fornecedor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/FornecedorServlet")
public class FornecedorServlet extends HttpServlet {
    private FornecedorDAO dao = new FornecedorDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if ("inserir".equals(acao)) {
            Fornecedor f = new Fornecedor();
            f.setNome(request.getParameter("nome"));
            f.setCnpj(request.getParameter("cnpj"));
            f.setUf(request.getParameter("uf"));
            f.setCidade(request.getParameter("cidade"));
            dao.inserir(f);
            response.sendRedirect("fornecedores.jsp");

        } else if ("atualizar".equals(acao)) {
            Fornecedor f = new Fornecedor();
            f.setId(Integer.parseInt(request.getParameter("id")));
            f.setNome(request.getParameter("nome"));
            f.setCnpj(request.getParameter("cnpj"));
            f.setUf(request.getParameter("uf"));
            f.setCidade(request.getParameter("cidade"));
            dao.atualizar(f);
            response.sendRedirect("fornecedores.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if ("editar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Fornecedor f = dao.buscarPorId(id);
            request.setAttribute("fornecedor", f);
            request.getRequestDispatcher("fornecedores_editar.jsp").forward(request, response);

        } else if ("excluir".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.excluir(id);
            response.sendRedirect("fornecedores.jsp");
        }
    }
}
