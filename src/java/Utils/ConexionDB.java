package Utils;

import java.sql.*;

public class ConexionDB {

    public static Connection getConexion() {
        Connection con = null;
        //en caso de 'named database', se requiere añadir database=""
        String cadena = "jdbc:mysql://localhost/siscoob?user=root&password="
           //+ "&useUnicode=true&characterEncoding=utf-8&connectionCollation=latin1_spanish_ci";
           + "&useUnicode=true&characterEncoding=utf-8";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(cadena);
            //System.out.println("Conexión satisfactoria");
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return con;
    }

    public static void main(String[] args) {
        getConexion();
    }

}
