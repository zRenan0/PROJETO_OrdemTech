package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.OM;
import conexao.Conexao;

public class OMDAO {

    // Obtém o último número de ordem
    private int obterUltimoNumeroOrdem(Connection conn) throws SQLException {
        String sql = "SELECT MAX(numero_ordem) AS max_numero FROM ordens";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt("max_numero");
            }
        }
        return 0;
    }

    // Inserir nova OM
    public void inserir(OM om) {
        String sql = "INSERT INTO ordens (numero_ordem, placa, modelo, data, status, descricao, id_fornecedor) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = Conexao.getConnection()) {
            int proximoNumero = obterUltimoNumeroOrdem(conn) + 1;
            om.setNumeroOrdem(proximoNumero);

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, om.getNumeroOrdem());
                stmt.setString(2, om.getPlaca());
                stmt.setString(3, om.getModelo());
                stmt.setDate(4, om.getData());
                stmt.setString(5, om.getStatus());
                stmt.setString(6, om.getDescricao());
                stmt.setInt(7, om.getIdFornecedor());
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir OM: " + e.getMessage(), e);
        }
    }

    // Listar todas as OMs
    public List<OM> listar() {
        List<OM> lista = new ArrayList<>();
        String sql = "SELECT * FROM ordens ORDER BY numero_ordem ASC";
        try (Connection conn = Conexao.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                OM om = new OM(
                    rs.getInt("id"),
                    rs.getInt("numero_ordem"),
                    rs.getString("placa"),
                    rs.getString("modelo"),
                    rs.getDate("data"),
                    rs.getString("status"),
                    rs.getString("descricao"),
                    rs.getInt("id_fornecedor") // agora incluído
                );
                lista.add(om);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar OMs: " + e.getMessage(), e);
        }
        return lista;
    }

    // Buscar OM por ID
    public OM buscarPorId(int id) {
        String sql = "SELECT * FROM ordens WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new OM(
                        rs.getInt("id"),
                        rs.getInt("numero_ordem"),
                        rs.getString("placa"),
                        rs.getString("modelo"),
                        rs.getDate("data"),
                        rs.getString("status"),
                        rs.getString("descricao"),
                        rs.getInt("id_fornecedor") // incluído
                    );
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar OM: " + e.getMessage(), e);
        }
        return null;
    }

    // Atualizar OM
    public void atualizar(OM om) {
        String sql = "UPDATE ordens SET placa=?, modelo=?, data=?, status=?, descricao=?, id_fornecedor=? WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, om.getPlaca());
            stmt.setString(2, om.getModelo());
            stmt.setDate(3, om.getData());
            stmt.setString(4, om.getStatus());
            stmt.setString(5, om.getDescricao());
            stmt.setInt(6, om.getIdFornecedor());
            stmt.setInt(7, om.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar OM: " + e.getMessage(), e);
        }
    }

    // Excluir OM
    public void excluir(int id) {
        String sql = "DELETE FROM ordens WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir OM: " + e.getMessage(), e);
        }
    }

    // Listar apenas OMs abertas
    public List<OM> listarAbertas() {
        List<OM> lista = new ArrayList<>();
        String sql = "SELECT * FROM ordens WHERE status = 'Aberta' ORDER BY numero_ordem ASC";
        try (Connection conn = Conexao.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                OM om = new OM(
                    rs.getInt("id"),
                    rs.getInt("numero_ordem"),
                    rs.getString("placa"),
                    rs.getString("modelo"),
                    rs.getDate("data"),
                    rs.getString("status"),
                    rs.getString("descricao"),
                    rs.getInt("id_fornecedor")
                );
                lista.add(om);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar OMs abertas: " + e.getMessage(), e);
        }
        return lista;
    }
}
