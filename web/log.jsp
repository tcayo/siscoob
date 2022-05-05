<%@page import="Beans.Logs"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />  
   
<h3 align="center">Reporte de Eventos</h3>
<div class="container">
    <table class="table">    
        <tr><td></td>
            <td><a href="ServletLogs"><button class="btn btn-success">Recargar página</button></a></td> <!--btn btn-success es un boton de bootstrap de color verde-->
        </tr>  
        <tr>
            <th>Id</th>            
            <th>Login</th>
            <th>IP remota</th>
            <th>Host remoto</th>
            <th>X-forwarded-for</th>
            <th>Acción</th>
            <th>URL</th>
            <th>Fecha de registro</th>
        </tr>                        
        <%
            ArrayList<Logs> lista = (ArrayList<Logs>) request.getAttribute("lo_lista");
            for (int i = 0; i < lista.size(); i++) {
                Logs lo = lista.get(i);
        %>
        <tr>
            <td><%=lo.getId()%></td>            
            <td><%=lo.getLogin()%></td>
            <td><%=lo.getRemote_addr()%></td>
            <td><%=lo.getRemote_host()%></td>
            <td><%=lo.getX_forwarded_for()%></td>            
            <td><%=lo.getAccion()%></td>
            <td><%=lo.getUrl()%></td>
            <td><%=lo.getFecha_reg()%></td>
        </tr>
        <%
            }
        %>          
    </table>
</div>               
</body>

</html>
