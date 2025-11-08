package model;

public class OM {
    private int id;
    private String nome;
    private String sigla;
    private String cidade;

    public OM() {}
    public OM(String nome, String sigla, String cidade) {
        this.nome = nome;
        this.sigla = sigla;
        this.cidade = cidade;
    }
    public OM(int id, String nome, String sigla, String cidade) {
        this.id = id;
        this.nome = nome;
        this.sigla = sigla;
        this.cidade = cidade;
    }

    // getters e setters
}
