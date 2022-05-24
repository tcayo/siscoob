<%@page import="Beans.Equipos"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" /> 

<h3 align="center">Nuevo Equipo</h3>
<div class="container">
    <form action="ServletEquipos" method="post">
        <table class="table">                        
            <tr>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" name="chkActivo" id="flexSwitchCheckChecked" checked>
                <label class="form-check-label" for="flexSwitchCheckChecked">Registro activo</label>
            </div>
        </tr><tr>
        <td>Código Patrimonio: </td>
        <td><input type="text" name="txtCod" class="form-control"></td>
    </tr><tr>
        <td>Orden de Compra: </td>
        <td><input type="text" name="txtOc" class="form-control"></td>
    </tr><tr>
        <td>Número de Serie: </td>
        <td><input type="text" name="txtSerie" class="form-control"></td>
    </tr><tr>
        <td>Descripción: </td>
        <td><input type="text" name="txtNombre" class="form-control"></td>
    </tr><tr>
        <td>Marca: </td>
        <td><input type="text" name="txtMarca" class="form-control"></td>
    </tr><tr>
        <td>ID de estado: </td>
        <td><input type="text" name="txtIdestado" class="form-control"></td>
    </tr><tr>
        <td></td>
        <td><input type="submit" value="Grabar Datos" class="btn btn-success"></td>
    </tr>
</table>
<input type="hidden" name="op" value="nuevo">
</form>
</div>               
</body>

</html>
