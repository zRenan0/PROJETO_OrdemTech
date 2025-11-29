package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexao {
    private static final String URL = "jdbc:mysql://localhost:3306/usuarios?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Bloco estático: executado uma vez quando a classe é carregada
    static {
        try (Connection conn = getConnection()) {
            criarTabelaFornecedores(conn);
            criarTabelaVeiculos(conn);
            criarTabelaOrdens(conn);
        } catch (Exception e) {
            throw new RuntimeException("Erro ao inicializar tabelas: " + e.getMessage(), e);
        }
    }

    // Sempre retorna uma nova conexão
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver JDBC não encontrado: " + e.getMessage(), e);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao conectar com o banco: " + e.getMessage(), e);
        }
    }

    // ===== Criação das tabelas =====
    private static void criarTabelaFornecedores(Connection conn) {
        String sql = "CREATE TABLE IF NOT EXISTS fornecedores (" +
                     "id INT AUTO_INCREMENT PRIMARY KEY," +
                     "nome VARCHAR(100) NOT NULL," +
                     "cnpj VARCHAR(20) NOT NULL UNIQUE," +
                     "uf VARCHAR(2) NOT NULL," +
                     "cidade VARCHAR(100)" +
                     ")";
        executar(conn, sql);
    }

    private static void criarTabelaVeiculos(Connection conn) {
        String sql = "CREATE TABLE IF NOT EXISTS veiculos (" +
                     "id INT AUTO_INCREMENT PRIMARY KEY," +
                     "placa VARCHAR(10) NOT NULL UNIQUE," +
                     "modelo VARCHAR(50) NOT NULL," +
                     "ano INT," +
                     "status VARCHAR(20)" +
                     ")";
        executar(conn, sql);
    }

    private static void criarTabelaOrdens(Connection conn) {
        String sql = "CREATE TABLE IF NOT EXISTS ordens (" +
                     "id INT AUTO_INCREMENT PRIMARY KEY," +
                     "placa VARCHAR(10) NOT NULL," +
                     "modelo VARCHAR(50) NOT NULL," +
                     "data DATE NOT NULL," +
                     "status VARCHAR(20) NOT NULL," +
                     "descricao TEXT" +
                     ")";
        executar(conn, sql);
    }

    private static void executar(Connection conn, String sql) {
        try (Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar tabela: " + e.getMessage(), e);
        }
    }
}
