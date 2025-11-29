package servlet;

import dao.OsItemDAO;
import dao.OSDAO;
import dao.OMDAO;

import model.OsItem;
import model.OS;
import model.OM;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/OsItemServlet")
public class OsItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");



        // FORMULÁRIO ---------------------------------------------
        if ("form".equals(acao)) {

            int idOS = Integer.parseInt(request.getParameter("idOS"));

            OSDAO osDao = new OSDAO();
            OMDAO omDao = new OMDAO();
            OsItemDAO itemDao = new OsItemDAO();

            OS os = osDao.buscarPorId(idOS);
            OM om = omDao.buscarPorId(os.getIdOrdem());
            List<OsItem> itens = itemDao.listarPorOS(idOS);

            request.setAttribute("os", os);
            request.setAttribute("om", om);
            request.setAttribute("itens", itens);

            request.getRequestDispatcher("os_editar.jsp").forward(request, response);
        }
        
        if ("excluir".equals(acao)) {

    int id = Integer.parseInt(request.getParameter("id"));    // ID do item a excluir
    int idOS = Integer.parseInt(request.getParameter("idOS")); // ID da OS para voltar

    OsItemDAO dao = new OsItemDAO();
    dao.excluir(id);

    // redireciona de volta para a tela com a lista atualizada
    response.sendRedirect("OsItemServlet?acao=form&idOS=" + idOS);
    return;
}
    }


    // SALVAR ITEM -------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if ("inserir".equals(acao)) {

            try {
                int idOS = Integer.parseInt(request.getParameter("idOS"));
                String tipo = request.getParameter("tipo");
                String descricao = request.getParameter("descricao");
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                double valor = Double.parseDouble(request.getParameter("valor"));

                OsItem item = new OsItem();
                item.setIdOs(idOS);
                item.setTipo(tipo);
                item.setDescricao(descricao);
                item.setQuantidade(quantidade);
                item.setValor(valor);

                OsItemDAO dao = new OsItemDAO();
                dao.inserir(item);

                response.sendRedirect("OsItemServlet?acao=form&idOS=" + idOS);

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("erro.jsp");
            }
        }
    }
}
