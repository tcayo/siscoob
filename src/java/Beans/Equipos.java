package Beans;

public class Equipos {
    private int id,idestado;
    private String codigo_patrimonio,orden_compra,serie_numero,nombre_bien,marca;

    public Equipos(int id, String codigo_patrimonio, String orden_compra, String serie_numero, String nombre_bien, String marca, int idestado ) {
        this.id = id;        
        this.codigo_patrimonio = codigo_patrimonio;
        this.orden_compra = orden_compra;
        this.serie_numero = serie_numero;
        this.nombre_bien = nombre_bien;
        this.marca = marca;
        this.idestado = idestado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }

    public String getCodigo_patrimonio() {
        return codigo_patrimonio;
    }

    public void setCodigo_patrimonio(String codigo_patrimonio) {
        this.codigo_patrimonio = codigo_patrimonio;
    }

    public String getOrden_compra() {
        return orden_compra;
    }

    public void setOrden_compra(String orden_compra) {
        this.orden_compra = orden_compra;
    }

    public String getSerie_numero() {
        return serie_numero;
    }

    public void setSerie_numero(String serie_numero) {
        this.serie_numero = serie_numero;
    }

    public String getNombre_bien() {
        return nombre_bien;
    }

    public void setNombre_bien(String nombre_bien) {
        this.nombre_bien = nombre_bien;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
       
}
