<%@include file="header.jsp"%>
<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>

<h3 align="center">Listado de Equipos</h3>
<div class="container">
    <table class="table">
        <tr>                       
            <th>Código</th>
            <th>O/C</th>
            <th>Nro. Serie</th>
            <th>Detalle</th>
            <th>Marca</th>
            <th>Estado actual</th>
            <th>Fecha de O/C</th>
        </tr>                        
        <%
            ArrayList<Equipos> lista = (ArrayList<Equipos>) request.getAttribute("eq_lista");
            for (int i = 0; i < lista.size(); i++) {
                Equipos eq = lista.get(i);
        %>
        <tr>                        
            <td><%=eq.getCodigo_patrimonio()%></td>
            <td><%=eq.getOrden_compra()%></td>
            <td><%=eq.getSerie_numero()%></td>
            <td><%=eq.getNombre_bien()%></td>            
            <td><%=eq.getMarca()%></td>
            <td><% if(eq.getIdestado()==1){%>Inoperativo mantenimiento correctivo<%}else if(eq.getIdestado()==2){%>Inoperativo obsolescencia técnica<%}else if(eq.getIdestado()==3){%>Operativo obsolescencia técnica<%}else if(eq.getIdestado()==4){%>Operativo sin observaciones<%}else{%>Sin revisar<%}%></td>            
            <td><%=eq.getNfecha_oc()%></td>
            <td><a href="ServletEquipos?upd=<%=eq.getId()%>"><button class="btn btn-primary">Editar</button></a></td> <!--btn btn-primary es un boton de bootstrap de color azul-->
            <%if(perfil==9){%>
            <td><a href="ServletEquipos?del=<%=eq.getId()%>"><button class="btn btn-danger">Eliminar</button></a></td> <!--btn btn-danger es un boton de bootstrap para mostrar peligro-->
            <%}%>   
        </tr>
        <%
            }
        %>  
    </table>
</div>               
</body>

</html>
