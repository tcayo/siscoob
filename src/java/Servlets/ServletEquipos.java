package Servlets;

import Beans.Equipos;
import Utils.ConexionDB;
import static Utils.Tools.*;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author administrador
 */
@WebServlet(name = "ServletEquipos", urlPatterns = {"/ServletEquipos"})
public class ServletEquipos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String borrar = request.getParameter("del");
        String actualizar = request.getParameter("upd");
        if (borrar != null) {
            try {
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from tblequipos where id=?");
                sta.setInt(1, Integer.parseInt(borrar));
                sta.executeUpdate();

                response.sendRedirect("ServletEquipos");

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (actualizar != null) {
            try {
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from tblequipos where id=?");
                sta.setInt(1, Integer.parseInt(actualizar));
                ResultSet rs = sta.executeQuery();

                ArrayList<Equipos> lista = new ArrayList<>();

                while (rs.next()) {
                    Equipos eq = new Equipos(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7),
                            rs.getString(8), rs.getString(9));
                    lista.add(eq);
                }
                request.setAttribute("eq_lista", lista);
                request.getRequestDispatcher("eq_update.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else {
            try {
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from tblequipos");
                ResultSet rs = sta.executeQuery();

                ArrayList<Equipos> lista = new ArrayList<>();

                while (rs.next()) {
                    Equipos eq = new Equipos(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7),
                            rs.getString(8), rs.getString(9));
                    lista.add(eq);
                }
                request.setAttribute("eq_lista", lista);
                request.getRequestDispatcher("eq_listado.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String op = request.getParameter("op");

        if (op.equals("nuevo")) {
            try {
                int estado;
                if ("on".equals(request.getParameter("chkActivo"))) {
                    estado = 1;
                } else {
                    estado = 0;
                }

                String codigo_patrimonio = request.getParameter("txtCod");
                String orden_compra = request.getParameter("txtOc");
                String serie_numero = request.getParameter("txtSerie");
                String nombre_bien = request.getParameter("txtNombre");
                String marca = request.getParameter("txtMarca");
                String fecha_oc = request.getParameter("txtFechaOc");
                int idestado = Integer.parseInt(request.getParameter("txtIdestado"));

                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("insert into tblequipos values(?,?,?,?,?,?,?,?,?)");

                sta.setInt(1, 0);
                sta.setString(2, codigo_patrimonio);
                sta.setString(3, orden_compra);
                sta.setString(4, serie_numero);
                sta.setString(5, nombre_bien);
                sta.setString(6, marca);
                sta.setInt(7, idestado);
                sta.setString(8, fecha_oc);
                sta.setTimestamp(9, getCurrentTimeStamp());
                sta.executeUpdate();

                response.sendRedirect("ServletEquipos");

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("update")) {
            try {
                int estado;
                if ("on".equals(request.getParameter("chkActivo"))) {
                    estado = 1;
                } else {
                    estado = 0;
                }

                String codigo_patrimonio = request.getParameter("txtCod");
                String orden_compra = request.getParameter("txtOc");
                String serie_numero = request.getParameter("txtSerie");
                String nombre_bien = request.getParameter("txtNombre");
                String marca = request.getParameter("txtMarca");
                String fecha_oc = request.getParameter("txtFechaOc");
                int idestado = Integer.parseInt(request.getParameter("txtIdestado"));

                int id = Integer.parseInt(request.getParameter("updId"));

                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("UPDATE tblequipos SET codigo_patrimonio=?,orden_compra=?,serie_numero=?,nombre_bien=?,marca=?,idestado=?,fecha_oc=? WHERE id=?");

                sta.setString(1, codigo_patrimonio);
                sta.setString(2, orden_compra);
                sta.setString(3, serie_numero);
                sta.setString(4, nombre_bien);
                sta.setString(5, marca);
                sta.setInt(6, idestado);
                sta.setString(7, fecha_oc);
                sta.setInt(8, id);
                sta.executeUpdate();

                response.sendRedirect("ServletEquipos");

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
