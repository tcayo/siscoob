<%@include file="header.jsp"%>
<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>
<%int consultar = 0;
    if (request.getParameter("rep") != null) {
        consultar = Integer.parseInt(request.getParameter("rep"));
    }%>

<h3 align="center">Reporte de Equipos por estado funcional</h3>
<div class="container">
    <form action="ServletReportes" method="get">
        <table class="table">
            <tr>            
                <td><select name="rep" class="form-control">
                        <option value="0"> - Seleccione un estado - </option>
                        <option value="1" <% if (consultar == 1) {%>selected<%}%>>Inoperativo mantenimiento correctivo</option>
                        <option value="2" <% if (consultar == 2) {%>selected<%}%>>Inoperativo obsolescencia técnica</option>
                        <option value="3" <% if (consultar == 3) {%>selected<%}%>>Operativo obsolescencia técnica</option>
                        <option value="4" <% if (consultar == 4) {%>selected<%}%>>Operativo sin observaciones</option>
                        <option value="5" <% if (consultar == 5) {%>selected<%}%>>Sin Estado</option>
                    </select></td>
                <td><button class="btn btn-primary">Buscar</button>&nbsp;&nbsp;<input type=button value="Imprimir listado" class="btn btn-warning" onClick="window.print();"></td>
            </tr>
        </table>
    </form>
    <% ArrayList<Equipos> lista = (ArrayList<Equipos>) request.getAttribute("rep_lista");
                        int itemCount = lista.size();%>
    <p><b>Se encontraron <%=itemCount%> registro(s):</b></p>
    <table class="table">        
        <tr>                       
            <th>Código</th>
            <th>O/C</th>
            <th>Nro. Serie</th>
            <th>Detalle</th>
            <th>Marca</th>
            <th>Estado actual</th>
        </tr>                        
        <%
            //ArrayList<Equipos> lista = (ArrayList<Equipos>) request.getAttribute("rep_lista");
            for (int i = 0; i < lista.size(); i++) {
                Equipos eq = lista.get(i);
        %>
        <tr>                        
            <td><%=eq.getCodigo_patrimonio()%></td>
            <td><%=eq.getOrden_compra()%></td>
            <td><%=eq.getSerie_numero()%></td>
            <td><%=eq.getNombre_bien()%></td>            
            <td><%=eq.getMarca()%></td>
            <td><% if (eq.getIdestado() == 1) {%>Inoperativo mantenimiento correctivo<%} else if (eq.getIdestado() == 2) {%>Inoperativo obsolescencia técnica<%} else if (eq.getIdestado() == 3) {%>Operativo obsolescencia técnica<%} else if (eq.getIdestado() == 4) {%>Operativo sin observaciones<%} else {%>Sin revisar<%}%></td>            

        </tr>
        <%
            }
        %>  
    </table>    
</div>               
</body>

</html>

