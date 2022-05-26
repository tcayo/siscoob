<%@page import="Beans.Logs"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%> 

<h3 align="center">Listado de eventos registrados</h3>
<div class="container">
    <table class="table">
        <tr>            
            <th>Fecha de evento</th>            
            <th>Usuario</th>
            <th>Código de evento</th>
            <th>Descripción</th>
        </tr>                        
        <%
            ArrayList<Logs> lista = (ArrayList<Logs>) request.getAttribute("log_lista");
            for (int i = 0; i < lista.size(); i++) {
                Logs log = lista.get(i);
        %>
        <tr>            
            <td><%=log.getFecha_evento()%></td>
            <td><%=log.getUsername()%></td>
            <td><%=log.getCod_evento()%></td>            
            <td><%=log.getDesc_evento()%></td>
                  
        </tr>
        <%
            }
        %>  
    </table>
</div>               
</body>

</html>

