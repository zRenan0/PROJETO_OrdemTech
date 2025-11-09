package model;

import java.sql.Date;

public class OM {
    private int id;              // chave primária
    private int numeroOrdem;     // número sequencial visível
    private String placa;
    private String modelo;
    private Date data;
    private String status;
    private String descricao;

    public OM() {}

    public OM(int id, int numeroOrdem, String placa, String modelo, Date data, String status, String descricao) {
        this.id = id;
        this.numeroOrdem = numeroOrdem;
        this.placa = placa;
        this.modelo = modelo;
        this.data = data;
        this.status = status;
        this.descricao = descricao;
    }

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getNumeroOrdem() { return numeroOrdem; }
    public void setNumeroOrdem(int numeroOrdem) { this.numeroOrdem = numeroOrdem; }

    public String getPlaca() { return placa; }
    public void setPlaca(String placa) { this.placa = placa; }

    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }

    public Date getData() { return data; }
    public void setData(Date data) { this.data = data; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
}
