package model;

public class Veiculo {
    private int id;
    private String placa;
    private String modelo;
    private int ano;
    private String status;

    public Veiculo() {}
    public Veiculo(String placa, String modelo, int ano, String status) {
        this.placa = placa;
        this.modelo = modelo;
        this.ano = ano;
        this.status = status;
    }
    public Veiculo(int id, String placa, String modelo, int ano, String status) {
        this.id = id;
        this.placa = placa;
        this.modelo = modelo;
        this.ano = ano;
        this.status = status;
    }

    // getters e setters
}
