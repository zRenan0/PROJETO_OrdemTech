package dao;

import model.OsItem;
import conexao.Conexao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OsItemDAO {

    public void inserir(OsItem item) {
        String sql = "INSERT INTO os_itens (id_os, tipo, descricao, quantidade, valor) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, item.getIdOs());
            stmt.setString(2, item.getTipo());
            stmt.setString(3, item.getDescricao());
            stmt.setInt(4, item.getQuantidade());
            stmt.setDouble(5, item.getValor());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


public List<OsItem> listarPorOS(int idOs) {
    List<OsItem> lista = new ArrayList<>();

    String sql = "SELECT * FROM os_itens WHERE id_os = ?";

    try (Connection conn = Conexao.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, idOs);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            OsItem item = new OsItem();
            item.setId(rs.getInt("id"));
            item.setIdOs(rs.getInt("id_os"));
            item.setTipo(rs.getString("tipo"));
            item.setDescricao(rs.getString("descricao"));
            item.setQuantidade(rs.getInt("quantidade"));
            item.setValor(rs.getDouble("valor"));

            lista.add(item);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return lista;
}

public void excluir(int id) {
    String sql = "DELETE FROM os_itens WHERE id = ?";

    try (Connection conn = Conexao.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, id);
        stmt.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}
