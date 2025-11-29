package servlet;

import dao.OSDAO;
import dao.OMDAO;
import model.OS;
import model.OM;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/OSServlet")
public class OSServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");


        if ("excluir".equals(acao)) {

            int id = Integer.parseInt(request.getParameter("id"));
            int idOM = Integer.parseInt(request.getParameter("idOM"));

            OSDAO dao = new OSDAO();
            dao.excluir(id);

            response.sendRedirect("OSServlet?acao=lista&idOM=" + idOM);
            return;
        }


        if ("form".equals(acao)) {

            int idOM = Integer.parseInt(request.getParameter("idOM"));

            OMDAO omDao = new OMDAO();
            OM om = omDao.buscarPorId(idOM);

            request.setAttribute("om", om);
            request.getRequestDispatcher("OS.jsp").forward(request, response);
            return;
        }


        if ("lista".equals(acao) || "listar".equals(acao)) {

            int idOM = Integer.parseInt(request.getParameter("idOM"));

            OMDAO omDao = new OMDAO();
            OSDAO osDao = new OSDAO();

            OM om = omDao.buscarPorId(idOM);
            List<OS> listaOS = osDao.listarPorOM(idOM);

            request.setAttribute("om", om);
            request.setAttribute("listaOS", listaOS);

            request.getRequestDispatcher("os_lista.jsp").forward(request, response);
            return;
        }

        if ("editar".equals(acao)) {

            int idOS = Integer.parseInt(request.getParameter("id"));

            OSDAO osDao = new OSDAO();
            OMDAO omDao = new OMDAO();

            OS os = osDao.buscarPorId(idOS);
            OM om = omDao.buscarPorId(os.getIdOrdem());

            request.setAttribute("os", os);
            request.setAttribute("om", om);

            request.getRequestDispatcher("os_editar.jsp").forward(request, response);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if ("inserir".equals(acao)) {
            inserirOS(request, response);
        }
    }

    private void inserirOS(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int idOM = Integer.parseInt(request.getParameter("idOM"));
            String tipoOS = request.getParameter("tipo_os");
            String descricao = request.getParameter("descricao");

            OS os = new OS();
            os.setIdOrdem(idOM);
            os.setTipoOS(tipoOS);
            os.setDescricao(descricao);

            OSDAO dao = new OSDAO();
            dao.inserir(os);

            response.sendRedirect("OSServlet?acao=lista&idOM=" + idOM);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }
}
