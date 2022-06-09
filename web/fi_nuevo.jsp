<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%>

<h3 align="center">Nueva Ficha de Internamiento</h3>
<div class="container">
    <form action="ServletFichas" method="post">
        <table class="table">       
            <tr>
                <td>Número de comprobante: </td>
                <td><input type="text" name="txtNum" class="form-control" required="required" readonly></td>
            </tr>
        </table>
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
            ArrayList<Equipos> lista = (ArrayList<Equipos>) request.getAttribute("fi_lista");
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
            <%if(perfil==9){%>
            <td><a href="ServletFichas?dele=<%=eq.getId()%>" onclick="bootbox.confirm();return false;"><button class="btn btn-danger">Eliminar</button></a></td> <!--btn btn-danger es un boton de bootstrap para mostrar peligro-->
            <%}%>   
        </tr>
        <%
            }
        %>  
    </table>
        <input type="hidden" name="op" value="nuevo">
    </form>
</div>               
</body>

</html>
