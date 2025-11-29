package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Fornecedor;
import conexao.Conexao;

public class FornecedorDAO {

    public void inserir(Fornecedor f) {
        String sql = "INSERT INTO fornecedores (nome, cnpj, uf, cidade) VALUES (?, ?, ?, ?)";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, f.getNome());
            stmt.setString(2, f.getCnpj());
            stmt.setString(3, f.getUf());
            stmt.setString(4, f.getCidade());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir fornecedor: " + e.getMessage(), e);
        }
    }

    public List<Fornecedor> listar() {
        List<Fornecedor> lista = new ArrayList<>();
        String sql = "SELECT * FROM fornecedores ORDER BY nome ASC";
        try (Connection conn = Conexao.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Fornecedor f = new Fornecedor(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("cnpj"),
                    rs.getString("uf"),
                    rs.getString("cidade")
                );
                lista.add(f);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar fornecedores: " + e.getMessage(), e);
        }
        return lista;
    }

    public Fornecedor buscarPorId(int id) {
        String sql = "SELECT * FROM fornecedores WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Fornecedor(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("cnpj"),
                        rs.getString("uf"),
                        rs.getString("cidade")
                    );
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar fornecedor: " + e.getMessage(), e);
        }
        return null;
    }

    public void atualizar(Fornecedor f) {
        String sql = "UPDATE fornecedores SET nome=?, cnpj=?, uf=?, cidade=? WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, f.getNome());
            stmt.setString(2, f.getCnpj());
            stmt.setString(3, f.getUf());
            stmt.setString(4, f.getCidade());
            stmt.setInt(5, f.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar fornecedor: " + e.getMessage(), e);
        }
    }

    public void excluir(int id) {
        String sql = "DELETE FROM fornecedores WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir fornecedor: " + e.getMessage(), e);
        }
    }
}
