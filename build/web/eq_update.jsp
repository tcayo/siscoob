<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%> 

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
                <td>Código Patrimonio: </td>
                <td><input type="text" name="txtCod" value="<%=eq.getCodigo_patrimonio()%>" readonly class="form-control" required="required"></td>
            </tr><tr>
                <td>Orden de Compra: </td>
                <td><input type="text" name="txtOc" value="<%=eq.getOrden_compra()%>" class="form-control" required="required"></td>
            </tr><tr>
                <td>Número de Serie: </td>
                <td><input type="text" name="txtSerie" value="<%=eq.getSerie_numero()%>" class="form-control" required="required"></td>
            </tr><tr>
                <td>Descripción: </td>
                <td><input type="text" name="txtNombre" value="<%=eq.getNombre_bien()%>" class="form-control"></td>
            </tr><tr>
                <td>Marca: </td>
                <td><input type="text" name="txtMarca" value="<%=eq.getMarca()%>" class="form-control"></td>
            </tr><tr>
                <td>Estado: </td>
                <td><select name="txtIdestado" class="form-control" required="required">
                        <option value=""<% if (eq.getIdestado() == 5) {%>selected<%}%>> - Seleccione un estado - </option>
                        <option value="1"<% if (eq.getIdestado() == 1) {%>selected<%}%>>Inoperativo mantenimiento correctivo</option>
                        <option value="2"<% if (eq.getIdestado() == 2) {%>selected<%}%>>Inoperativo obsolescencia técnica</option>
                        <option value="3"<% if (eq.getIdestado() == 3) {%>selected<%}%>>Operativo obsolescencia técnica</option>
                        <option value="4"<% if (eq.getIdestado() == 4) {%>selected<%}%>>Operativo sin observaciones</option>
                        <option value="5"<% if (eq.getIdestado() == 5) {%>selected<%}%>>Sin Estado</option>
                    </select></td>
            </tr><tr>
                <td>Fecha de O/C: </td>
                <td><input type="date" name="txtFechaOc" placeholder="dd/mm/yyyy" value="<%=eq.getFecha_oc()%>" min="1997-01-01" max="2030-12-31" required="required"></td>
            </tr><tr>        
                <td></td>
                <td><input type="submit" value="Grabar Datos" class="btn btn-success">&nbsp;&nbsp;<input type=button value="Cancelar" class="btn btn-danger" onClick="history.back()">
                <input type="hidden" name="updId" value="<%=eq.getId()%>">
                </td>
            </tr>
            
            <%
                }
            %>                      

        </table>
        <input type="hidden" name="op" value="update">

    </form>
</div>               
</body>

</html>
