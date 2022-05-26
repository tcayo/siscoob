<%@page import="Beans.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%> 

<h3 align="center">Nuevo Usuario</h3>
<div class="container">
    <form action="ServletUsuarios" method="post">
        <table class="table">                        
            <tr>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" name="chkActivo" id="flexSwitchCheckChecked" checked>
                <label class="form-check-label" for="flexSwitchCheckChecked">Usuario activo</label>
            </div>
        </tr><tr>
        <td>Usuario: </td>
        <td><input type="text" name="txtUsername" class="form-control" required="required"></td>
    </tr><tr>
        <td>Password: </td>
        <td><input type="password" name="txtPassword" class="form-control" required="required"></td>
    </tr><tr>
        <td>Tipo de Usuario: </td>
        <td><select name="txtTipo" class="form-control"  required="required">
                <option value=""> - Seleccione un perfil - </option>
                <option value="1">Usuario</option>
                <option value="2">Administrador</option>
                <option value="9">Super Administrador</option>
            </select></td>
    </tr><tr>
        <td></td>
        <td><input type="submit" value="Grabar Datos" class="btn btn-success">&nbsp;&nbsp;<input type=button value="Cancelar" class="btn btn-danger" onClick="history.back()"></td>
    </tr>
</table>
<input type="hidden" name="op" value="nuevo">
</form>
</div>               
</body>

</html>
