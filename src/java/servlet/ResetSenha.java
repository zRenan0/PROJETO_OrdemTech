package servlet;

import conexao.Conexao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResetSenha")
public class ResetSenha extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String novaSenha = request.getParameter("novaSenha");

        try (Connection con = Conexao.getConnection()) {
            String sql = "UPDATE usuarios SET senha=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, novaSenha);
            ps.setString(2, email);

            int atualizado = ps.executeUpdate();

            if (atualizado > 0) {
                request.setAttribute("sucesso", "Senha alterada com sucesso!");
            } else {
                request.setAttribute("erro", "Email não encontrado!");
            }

            request.getRequestDispatcher("resetar_senha.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao redefinir a senha: " + e.getMessage());
            request.getRequestDispatcher("resetar_senha.jsp").forward(request, response);
        }
    }
}
