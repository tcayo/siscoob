package Servlets;

import Utils.ConexionDB;
import static Utils.Tools.hashPassword;
import static Utils.Tools.toLog;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

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

        String op = request.getParameter("op");

        if (op.equals("cerrar")) {
            HttpSession sesionOk = request.getSession();
            int id = (int) sesionOk.getAttribute("id");
            toLog(id, 2, "Cierre de sesión");

            sesionOk.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
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

        String usu = request.getParameter("txtUsu");
        String pas = hashPassword(request.getParameter("txtPas"));
        //System.out.println("Password: " + pas);
        try {
            CallableStatement call = ConexionDB.getConexion().prepareCall("{ call usuario_check(?,?) }");
            call.setString(1, usu);
            call.setString(2, pas);
            ResultSet rs = call.executeQuery();

            if (rs.next()) {
                HttpSession sesionOk = request.getSession();
                sesionOk.setAttribute("id", rs.getInt(1));
                sesionOk.setAttribute("nombre", rs.getString(2).toString());
                sesionOk.setAttribute("perfil", rs.getInt(4));

                int sesionId = (int) sesionOk.getAttribute("id");
                toLog(sesionId, 1, "Inicio de de sesión");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {
                String fallido = "Login fallido: "+request.getParameter("txtUsu")+" / "+request.getParameter("txtPas");
                toLog(0, 3, fallido);
                request.setAttribute("msg", "Usuario o contraseña Incorrectos");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
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
