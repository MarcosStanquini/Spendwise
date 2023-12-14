package br.spendwise.model.domain;

public class Receita {
    private int id;
    private double valor;
    private String data;
    private Usuario usuario;
    private String tipo;
    private String descricao;
    
    public Receita() {
        this.id = 0;
        this.valor = 0;
        this.data = "";
        this.usuario = new Usuario();
        this.tipo = "";
        this.descricao = "";
    }

    public Receita(int id, double valor, String data, Usuario usuario, String tipo, String descricao) {
        this.id = id;
        this.valor = valor;
        this.data = data;
        this.usuario = usuario;
        this.tipo = tipo;
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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

    @Override
    public String toString() {
        return "Receita [id=" + id + ", valor=" + valor + ", data=" + data + ", usuario=" + usuario + ", tipo=" + tipo
                + ", descricao=" + descricao + "]";
    }

}
