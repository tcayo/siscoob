package Beans;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Equipos {

    private int id, idestado;
    private String codigo_patrimonio, orden_compra, serie_numero, nombre_bien, marca, fecha_oc, fecha_registro;

    public Equipos(int id, String codigo_patrimonio, String orden_compra, String serie_numero, String nombre_bien, String marca, int idestado, String fecha_oc, String fecha_registro) {
        this.id = id;
        this.codigo_patrimonio = codigo_patrimonio;
        this.orden_compra = orden_compra;
        this.serie_numero = serie_numero;
        this.nombre_bien = nombre_bien;
        this.marca = marca;
        this.idestado = idestado;
        this.fecha_oc = fecha_oc;
        this.fecha_registro = fecha_registro;
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

    public String getFecha_oc() throws ParseException {        
        return fecha_oc;
    }
    
    public String getNfecha_oc() throws ParseException {        
        DateFormat userDateFormat = new SimpleDateFormat("yyyy-mm-dd");
        DateFormat dateFormatNeeded = new SimpleDateFormat("dd/mm/yyyy");
        Date date = userDateFormat.parse(fecha_oc);
        String nfecha_oc = dateFormatNeeded.format(date);        
        return nfecha_oc;
    }

    public void setFecha_oc(String fecha_oc) {
        this.fecha_oc = fecha_oc;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

}
