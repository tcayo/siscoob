<%@page import="Beans.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%>  

<h3 align="center">Listado de Usuarios</h3>
<div class="container">
    <table class="table">    
        <tr>                        
            <th><u>Usuario</u></th>            
            <th><u>Tipo de Usuario</u></th>            
            <th><u>Fecha de Creación</u></th>
            <th><u>Última modificación</u></th>
            <th><u>Estado</u></th>
        </tr>                        
        <%
            ArrayList<Usuarios> lista = (ArrayList<Usuarios>) request.getAttribute("u_lista");
            for (int i = 0; i < lista.size(); i++) {
                Usuarios u = lista.get(i);
        %>
        <tr>                        
            <td><b><%=u.getUsername()%></b></td>            
            <td><% if(u.getTipo()==1){%>Usuario<%}else if(u.getTipo()==2){%>Administrador<%}else if(u.getTipo()==9){%>Super Administrador<%}else{%>Indeterminado<%}%></td>                                  
            <td><%=u.getFecha_creacion()%></td>
            <td><%=u.getLast_session()%></td>  
            <td><% if(u.getEstado()==0){%>Inactivo<%}else{%>Activo<%}%></td>  
            <td><a href="ServletUsuarios?upd=<%=u.getId()%>"><button class="btn btn-primary">Editar</button></a></td> <!--btn btn-primary es un boton de bootstrap de color azul-->
            <td><a href="ServletUsuarios?del=<%=u.getId()%>" data-toggle="confirmation" data-title="¿Está seguro?" target="_blank"><button class="btn btn-danger">Eliminar</button></a></td> <!--btn btn-danger es un boton de bootstrap para mostrar peligro-->
        </tr>
        <%
            }
        %>            
    </table>
</div>               
</body>

</html>
