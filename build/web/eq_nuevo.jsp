<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%>

<h3 align="center">Nuevo Equipo</h3>
<div class="container">
    <form action="ServletEquipos" method="post">
        <table class="table">                        
            <tr>
                <td>Código Patrimonio: </td>
                <td><input type="text" name="txtCod" class="form-control" required="required"></td>
            </tr><tr>
                <td>Orden de Compra: </td>
                <td><input type="text" name="txtOc" class="form-control" required="required"></td>
            </tr><tr>
                <td>Número de Serie: </td>
                <td><input type="text" name="txtSerie" class="form-control" required="required"></td>
            </tr><tr>
                <td>Descripción: </td>
                <td><input type="text" name="txtNombre" class="form-control"></td>
            </tr><tr>
                <td>Marca: </td>
                <td><input type="text" name="txtMarca" class="form-control"></td>
            </tr><tr>
                <td>Estado actual del equipo: </td>
                <td><select name="txtIdestado" class="form-control" required="required">
                        <option value=""> - Seleccione un estado - </option>
                        <option value="1">Inoperativo mantenimiento correctivo</option>
                        <option value="2">Inoperativo obsolescencia técnica</option>
                        <option value="3">Operativo obsolescencia técnica</option>
                        <option value="4">Operativo sin observaciones</option>
                        <option value="5">Sin Revisar</option>
                    </select></td>
            </tr><tr>
                <td>Fecha de O/C: </td>
                <td><input type="date" name="txtFechaOc" placeholder="yyyy-mm-dd" 
                           value="" min="1997-01-01" max="2030-12-31" required="required"></td>
            </tr><tr>
                <td></td>
                <td><input type="submit" value="Grabar Datos" class="btn btn-success">&nbsp;&nbsp;<input type=button value="Cancelar" class="btn btn-danger" onClick="history.back();"></td>
            </tr>
        </table>
        <input type="hidden" name="op" value="nuevo">
    </form>
</div>               
</body>

</html>
