<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />  

<h3 align="center">Listado de Equipos</h3>
<div class="container">
    <table class="table">                        
        <tr>
            <th>Id</th>            
            <th>Código</th>
            <th>O/C</th>
            <th>Nro. Serie</th>
            <th>Detalle</th>
            <th>Marca</th>
            <th>Estado</th>
        </tr>                        
        <%
            ArrayList<Equipos> lista = (ArrayList<Equipos>) request.getAttribute("eq_lista");
            for (int i = 0; i < lista.size(); i++) {
                Equipos eq = lista.get(i);
        %>
        <tr>
            <td><%=eq.getId()%></td>            
            <td><%=eq.getCodigo_patrimonio()%></td>
            <td><%=eq.getOrden_compra()%></td>
            <td><%=eq.getSerie_numero()%></td>
            <td><%=eq.getNombre_bien()%></td>            
            <td><%=eq.getMarca()%></td>
            <td><%=eq.getIdestado()%></td>
            <td><a href="ServletEquipos?upd=<%=eq.getId()%>"><button class="btn btn-primary">Editar</button></a></td> <!--btn btn-primary es un boton de bootstrap de color azul-->
            <td><a href="ServletEquipos?del=<%=eq.getId()%>"><button class="btn btn-danger">Eliminar</button></a></td> <!--btn btn-danger es un boton de bootstrap para mostrar peligro-->
        </tr>
        <%
            }
        %>
        <tr><td></td>
            <td><a href="eq_nuevo.jsp"><button class="btn btn-success">Agregar registro</button></a></td> <!--btn btn-success es un boton de bootstrap de color verde-->
        </tr>    
    </table>
</div>               
</body>

</html>
