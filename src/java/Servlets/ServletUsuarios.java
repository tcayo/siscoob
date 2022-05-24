package Servlets;

import Beans.Usuarios;
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

@WebServlet(name = "ServletUsuarios", urlPatterns = {"/ServletUsuarios"})
public class ServletUsuarios extends HttpServlet {

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
                CallableStatement call = ConexionDB.getConexion().prepareCall("{ call usuario_del(?) }");
                call.setInt(1, Integer.parseInt(borrar));
                call.executeUpdate();

                response.sendRedirect("ServletUsuarios");

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (actualizar != null) {
            try {
                CallableStatement call = ConexionDB.getConexion().prepareCall("{ call usuario_get(?) }");
                call.setInt(1, Integer.parseInt(actualizar));
                ResultSet rs = call.executeQuery();

                ArrayList<Usuarios> lista = new ArrayList<>();

                while (rs.next()) {
                    Usuarios u = new Usuarios(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6));
                    lista.add(u);
                }
                request.setAttribute("u_lista", lista);
                request.getRequestDispatcher("u_update.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else {
            try {
                CallableStatement call = ConexionDB.getConexion().prepareCall("{ call usuarios_get() }");
                ResultSet rs = call.executeQuery();

                ArrayList<Usuarios> lista = new ArrayList<>();

                while (rs.next()) {
                    Usuarios u = new Usuarios(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6));
                    lista.add(u);
                }
                request.setAttribute("u_lista", lista);
                request.getRequestDispatcher("u_listado.jsp").forward(request, response);

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

                String username = request.getParameter("txtUsername");
                String password = hashPassword(request.getParameter("txtPassword")); 
                String tipo = request.getParameter("txtTipo");

                CallableStatement call = ConexionDB.getConexion().prepareCall("{ call usuario_new(?,?,?,?,?,?) }");

                call.setInt(1, 0);
                call.setString(2, username);
                call.setString(3, password);
                call.setInt(4, Integer.parseInt(tipo));
                call.setTimestamp(5, getCurrentTimeStamp());
                call.setTimestamp(6, getCurrentTimeStamp());
                call.executeUpdate();

                //request.getRequestDispatcher("index.jsp").forward(request, response);
                response.sendRedirect("ServletUsuarios");

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
                
                String password = hashPassword(request.getParameter("txtPassword"));                
                int tipo = Integer.parseInt(request.getParameter("txtTipo"));
                int id = Integer.parseInt(request.getParameter("updId"));
                
                CallableStatement call = ConexionDB.getConexion().prepareCall("{ call usuario_upd(?,?,?,?,?) }");

                call.setString(1, password);
                call.setInt(2, tipo);
                call.setTimestamp(3, getCurrentTimeStamp());
                call.setTimestamp(4, getCurrentTimeStamp());
                call.setInt(5, id);
                call.executeUpdate();
                
                response.sendRedirect("ServletUsuarios");

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
