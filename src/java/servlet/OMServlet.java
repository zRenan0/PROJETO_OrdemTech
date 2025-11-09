package servlet;

import dao.OMDAO;
import model.OM;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/OMServlet")
public class OMServlet extends HttpServlet {
    private OMDAO dao = new OMDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

        OM om = new OM();
        om.setPlaca(request.getParameter("placa"));
        om.setModelo(request.getParameter("modelo"));
        om.setData(Date.valueOf(request.getParameter("data")));
        om.setStatus(request.getParameter("status"));
        om.setDescricao(request.getParameter("descricao"));

        if ("inserir".equals(acao)) {
            dao.inserir(om);
        } else if ("atualizar".equals(acao)) {
            om.setId(Integer.parseInt(request.getParameter("id")));
            dao.atualizar(om);
        }

        response.sendRedirect("cadastrar_om.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if ("editar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            OM om = dao.buscarPorId(id);
            request.setAttribute("om", om);
            request.getRequestDispatcher("om_editar.jsp").forward(request, response);
        } else if ("excluir".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.excluir(id);
            response.sendRedirect("cadastrar_om.jsp");
        }
    }
}
