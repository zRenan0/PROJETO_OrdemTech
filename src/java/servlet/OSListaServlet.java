package servlet;

import dao.OMDAO;
import dao.OSDAO;
import model.OM;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/OSListaServlet")
public class OSListaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idOM = Integer.parseInt(request.getParameter("idOM"));

        OMDAO omDao = new OMDAO();
        OM om = omDao.buscarPorId(idOM);

        request.setAttribute("om", om);

        // se quiser listar OS, pode adicionar aqui
        // List<OS> lista = osDao.listarPorOM(idOM);
        // request.setAttribute("lista", lista);

        request.getRequestDispatcher("os_lista.jsp").forward(request, response);
    }
}
