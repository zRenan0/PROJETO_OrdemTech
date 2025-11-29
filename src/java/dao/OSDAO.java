package dao;

import model.OS;
import conexao.Conexao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OSDAO {

    // INSERIR
        public void inserir(OS os) {
            String sql = "INSERT INTO os (id_ordem, tipo_os, descricao) VALUES (?, ?, ?)";

            try (Connection conn = Conexao.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, os.getIdOrdem());
                stmt.setString(2, os.getTipoOS());
                stmt.setString(3, os.getDescricao());

                stmt.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    // LISTAR
        public List<OS> listarPorOM(int idOM) {
            List<OS> lista = new ArrayList<>();
            String sql = "SELECT * FROM os WHERE id_ordem = ?";

            try (Connection conn = Conexao.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, idOM);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    OS os = new OS();
                    os.setId(rs.getInt("id"));
                    os.setIdOrdem(rs.getInt("id_ordem"));
                    os.setTipoOS(rs.getString("tipo_os"));
                    os.setDescricao(rs.getString("descricao"));
                    lista.add(os);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return lista;
        }


    // BUSCAR POR ID
        public OS buscarPorId(int id) {
            String sql = "SELECT * FROM os WHERE id=?";
            OS os = null;

            try (Connection conn = Conexao.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    os = new OS();
                    os.setId(rs.getInt("id"));
                    os.setIdOrdem(rs.getInt("id_ordem"));
                    os.setTipoOS(rs.getString("tipo_os"));
                    os.setDescricao(rs.getString("descricao"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return os;
        }

    // ATUALIZAR
    public void atualizar(OS os) {
        String sql = "UPDATE os SET tipo_os=?, descricao=? WHERE id=?";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, os.getTipoOS());
            stmt.setString(2, os.getDescricao());
            stmt.setInt(3, os.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public void excluir(int id) {

    String sqlDeleteItens = "DELETE FROM os_itens WHERE id_os = ?";
    String sqlDeleteOS = "DELETE FROM os WHERE id = ?";

    try (Connection conn = Conexao.getConnection()) {

        PreparedStatement stmt1 = conn.prepareStatement(sqlDeleteItens);
        stmt1.setInt(1, id);
        stmt1.executeUpdate();

        PreparedStatement stmt2 = conn.prepareStatement(sqlDeleteOS);
        stmt2.setInt(1, id);
        stmt2.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}
