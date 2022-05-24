package Servlets;

import Utils.ConexionDB;
import static Utils.Tools.hashPassword;
import java.io.IOException;
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

        System.out.println("recibe: " + op);

        if (op.equals("cerrar")) {
            HttpSession sesionOk = request.getSession();
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
        System.out.println("Password: "+pas);
        try {
            PreparedStatement psta = ConexionDB.getConexion().
                    prepareStatement("SELECT * FROM usuarios WHERE username=? AND password=?");
            psta.setString(1, usu);
            psta.setString(2, pas);
            ResultSet rs = psta.executeQuery();
            if (rs.next()) {
                HttpSession sesionOk = request.getSession();
                sesionOk.setAttribute("nombre", rs.getString(2).toString());
                sesionOk.setAttribute("perfil", rs.getString(4).toString());
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {
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
