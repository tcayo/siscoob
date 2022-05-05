<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />  

<h3 align="center">Modificar Equipo</h3>
<div class="container">
    <form action="ServletEquipos" method="post">
    <table class="table">    
                       
        <%
            ArrayList<Equipos> lista = (ArrayList<Equipos>) request.getAttribute("eq_lista");
            for (int i = 0; i < lista.size(); i++) {
                Equipos eq = lista.get(i);
        %>
               
        <tr>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" name="chkActivo" id="flexSwitchCheckChecked" checked>
                <label class="form-check-label" for="flexSwitchCheckChecked">Registro activo</label>
            </div>
        </tr><tr>
        <td>Código Patrimonio: </td>
        <td><input type="text" name="txtCod" value="<%=eq.getCodigo_patrimonio()%>" readonly class="form-control"></td>
    </tr><tr>
        <td>Orden de Compra: </td>
        <td><input type="text" name="txtOc" value="<%=eq.getOrden_compra()%>" class="form-control"></td>
    </tr><tr>
        <td>Número de Serie: </td>
        <td><input type="text" name="txtSerie" value="<%=eq.getSerie_numero()%>" class="form-control"></td>
    </tr><tr>
        <td>Descripción: </td>
        <td><input type="text" name="txtNombre" value="<%=eq.getNombre_bien()%>" class="form-control"></td>
    </tr><tr>
        <td>Marca: </td>
        <td><input type="text" name="txtMarca" value="<%=eq.getMarca()%>" class="form-control"></td>
    </tr><tr>
        <td>ID de estado: </td>
        <td><input type="text" name="txtIdestado" value="<%=eq.getIdestado()%>" class="form-control"></td>
    </tr><tr>
        <td></td>
        <td><input type="submit" value="Grabar Datos" class="btn btn-success"></td>
    </tr>
        <input type="hidden" name="updId" value="<%=eq.getId()%>">
        <%
            }
        %>                      
    
    </table>
    <input type="hidden" name="op" value="update">
    
</form>
</div>               
</body>

</html>
