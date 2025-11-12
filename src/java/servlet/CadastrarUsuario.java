package servlet;

import conexao.Conexao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CadastrarUsuario")
public class CadastrarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try (Connection con = Conexao.getConnection()) {
            
            String sqlCreate = """
                CREATE TABLE IF NOT EXISTS usuarios (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    nome VARCHAR(100) NOT NULL,
                    sobrenome VARCHAR(100) NOT NULL,
                    email VARCHAR(100) NOT NULL,
                    senha VARCHAR(100) NOT NULL
                );
            """;

            try (Statement stmt = con.createStatement()) {
                stmt.execute(sqlCreate);
            }

            String sqlInsert = "INSERT INTO usuarios (nome, sobrenome, email, senha) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sqlInsert);
            ps.setString(1, nome);
            ps.setString(2, sobrenome);
            ps.setString(3, email);
            ps.setString(4, senha);
            ps.executeUpdate();

            response.sendRedirect("sucesso.jsp");

        } catch (Exception e) {
            response.getWriter().println("Erro ao cadastrar usuário: " + e.getMessage());
        }
    }
}
