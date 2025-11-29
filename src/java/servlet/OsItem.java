package model;

public class OsItem {

    private int id;
    private int idOs; 
    private String tipo;
    private String descricao;
    private int quantidade;
    private double valor;

    // ===== GETTERS E SETTERS =====

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getIdOs() {
        return idOs;
    }
    public void setIdOs(int idOs) {
        this.idOs = idOs;
    }

    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescricao() {
        return descricao;
    }
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getQuantidade() {
        return quantidade;
    }
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValor() {
        return valor;
    }
    public void setValor(double valor) {
        this.valor = valor;
    }
}
