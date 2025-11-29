package model;

public class OS {

    private int id;
    private int idOrdem;      
    private int idFornecedor;
    private String tipoOS;
    private String descricao;
    private String dataCriacao;
    private String servico;
    private double valor;
    private String pecas;
    private String status;

    // GETTERS E SETTERS

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getIdOrdem() {
        return idOrdem;
    }
    public void setIdOrdem(int idOrdem) {
        this.idOrdem = idOrdem;
    }

    public int getIdFornecedor() {
        return idFornecedor;
    }
    public void setIdFornecedor(int idFornecedor) {
        this.idFornecedor = idFornecedor;
    }

    public String getTipoOS() {
        return tipoOS;
    }
    public void setTipoOS(String tipoOS) {
        this.tipoOS = tipoOS;
    }

    public String getDescricao() {
        return descricao;
    }
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDataCriacao() {
        return dataCriacao;
    }
    public void setDataCriacao(String dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public String getServico() {
        return servico;
    }
    public void setServico(String servico) {
        this.servico = servico;
    }

    public double getValor() {
        return valor;
    }
    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getPecas() {
        return pecas;
    }
    public void setPecas(String pecas) {
        this.pecas = pecas;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
