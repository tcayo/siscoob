package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Beans.Equipos;
import java.util.ArrayList;

public final class eq_005flistado_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("  \n");
      out.write("\n");
      out.write("<h3 align=\"center\">Listado de Equipos</h3>\n");
      out.write("<div class=\"container\">\n");
      out.write("    <table class=\"table\">\n");
      out.write("        <tr>\n");
      out.write("            <th>Id</th>            \n");
      out.write("            <th>Código</th>\n");
      out.write("            <th>O/C</th>\n");
      out.write("            <th>Nro. Serie</th>\n");
      out.write("            <th>Detalle</th>\n");
      out.write("            <th>Marca</th>\n");
      out.write("            <th>Estado</th>\n");
      out.write("        </tr>                        \n");
      out.write("        ");

            ArrayList<Equipos> lista = (ArrayList<Equipos>) request.getAttribute("eq_lista");
            for (int i = 0; i < lista.size(); i++) {
                Equipos eq = lista.get(i);
        
      out.write("\n");
      out.write("        \n");
      out.write("            <td>");
      out.print(eq.getId());
      out.write("</td>            \n");
      out.write("            <td>");
      out.print(eq.getCodigo_patrimonio());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(eq.getOrden_compra());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(eq.getSerie_numero());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(eq.getNombre_bien());
      out.write("</td>            \n");
      out.write("            <td>");
      out.print(eq.getMarca());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(eq.getIdestado());
      out.write("</td>\n");
      out.write("            <td><a href=\"ServletEquipos?upd=");
      out.print(eq.getId());
      out.write("\"><button class=\"btn btn-primary\">Editar</button></a></td> <!--btn btn-primary es un boton de bootstrap de color azul-->\n");
      out.write("            ");
if(usuario.equalsIgnoreCase(""+9)){
      out.write("\n");
      out.write("            <td><a href=\"ServletEquipos?del=");
      out.print(eq.getId());
      out.write("\"><button class=\"btn btn-danger\">Eliminar</button></a></td> <!--btn btn-danger es un boton de bootstrap para mostrar peligro-->\n");
      out.write("            ");
}
      out.write("   \n");
      out.write("        \n");
      out.write("        ");

            }
        
      out.write("  \n");
      out.write("    </table>\n");
      out.write("</div>               \n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
