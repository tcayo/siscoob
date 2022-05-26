package Beans;

public class Usuarios {
    private int id,tipo,estado;
    private String username,password,last_session,fecha_creacion;
 
    public Usuarios(int id, String username, String password, int tipo, String fecha_creacion, String last_session, int estado) {
        this.id = id;        
        this.username = username;
        this.password = password;
        this.tipo = tipo;
        this.fecha_creacion = fecha_creacion;
        this.last_session = last_session;        
        this.estado = estado;        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLast_session() {
        return last_session;
    }

    public void setLast_session(String last_session) {
        this.last_session = last_session;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
}
