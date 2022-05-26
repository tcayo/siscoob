package Beans;

public class Logs {
    private int id;
    private String username,cod_evento,desc_evento,fecha_evento;

    public Logs(int id, String username, String cod_evento, String desc_evento, String fecha_evento) {
        this.id = id;
        this.username = username;
        this.cod_evento = cod_evento;
        this.desc_evento = desc_evento;
        this.fecha_evento = fecha_evento;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCod_evento() {
        return cod_evento;
    }

    public void setCod_evento(String cod_evento) {
        this.cod_evento = cod_evento;
    }

    public String getDesc_evento() {
        return desc_evento;
    }

    public void setDesc_evento(String desc_evento) {
        this.desc_evento = desc_evento;
    }

    public String getFecha_evento() {
        return fecha_evento;
    }

    public void setFecha_evento(String fecha_evento) {
        this.fecha_evento = fecha_evento;
    }

    
       
}
