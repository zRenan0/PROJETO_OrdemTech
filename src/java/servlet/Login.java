package servlet;

import conexao.Conexao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Servlet Login chamado!");

        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        System.out.println("Email recebido: " + email);

        String sql = "SELECT id, nome, sobrenome, senha FROM usuarios WHERE email = ?";

        try (Connection con = Conexao.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String senhaBanco = rs.getString("senha");

                if (senhaBanco.equals(senha)) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("userId", rs.getInt("id"));
                    session.setAttribute("userNome", rs.getString("nome"));
                    session.setAttribute("userSobrenome", rs.getString("sobrenome"));

                    System.out.println("✅ Login realizado com sucesso!");
                    response.sendRedirect("dashboard.jsp");
                    return;
                } else {
                    System.out.println("❌ Senha incorreta!");
                }
            } else {
                System.out.println("❌ Usuário não encontrado!");
            }

            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Credenciais inválidas");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Erro ao autenticar: " + e.getMessage());
        }
    }
}
