<%@page import="Beans.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%>

<h3 align="center">Modificar Usuario</h3>
<div class="container">
    <form action="ServletUsuarios" method="post">
    <table class="table">    
                       
        <%
            ArrayList<Usuarios> lista = (ArrayList<Usuarios>) request.getAttribute("u_lista");
            for (int i = 0; i < lista.size(); i++) {
                Usuarios u = lista.get(i);
        %>
               
        <tr>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" name="chkActivo" id="flexSwitchCheckChecked" <% if(u.getEstado()==1){%>checked<%}%>>
                <label class="form-check-label" for="flexSwitchCheckChecked">Registro activo</label>
            </div>
        </tr><tr>
        <td>Usuario: </td>
        <td><input type="text" name="txtUsuario" value="<%=u.getUsername()%>" readonly class="form-control"></td>
    </tr><tr>
        <td>Password: </td>
        <td><input type="password" name="txtPassword" value="<%=u.getPassword()%>" class="form-control"></td>
    </tr><tr>
        <td>Tipo de Usuario: </td>
        <td><select name="txtTipo" clase="form-control" class="form-control">
                <option value="0"<% if(u.getTipo()==0){%>selected<%}%>> - Seleccione un perfil - </option>
                <option value="1"<% if(u.getTipo()==1){%>selected<%}%>>Usuario</option>
                <option value="2"<% if(u.getTipo()==2){%>selected<%}%>>Administrador</option>
                <option value="9"<% if(u.getTipo()==9){%>selected<%}%>>Super Administrador</option>
            </select></td>
    </tr><tr>
        <td></td>
        <td><input type="submit" value="Grabar Datos" class="btn btn-success">&nbsp;&nbsp;<input type=button value="Cancelar" class="btn btn-danger" onClick="history.back()"></td>
    </tr>
        <input type="hidden" name="updId" value="<%=u.getId()%>">
        <%
            }
        %>                      
    
    </table>
    <input type="hidden" name="op" value="update">
    
</form>
</div>               
</body>

</html>
