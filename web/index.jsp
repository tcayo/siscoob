<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SISCOOB</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
.table {
    margin: 0 auto;
    width: 80%;
}
</style>
    </head>
    <body>

        <div class="container">
            <div class="table-responsive">             
                <div class="text-center col-md-6 col-md-offset-6 justify-content-md-center">                  
                    <div class="login-panel panel">                
                        <div class="panel-default">                    
                            <img src="img/onpe_logo.png" alt="" width="196" height="128">
                        </div>
                        <div class="panel-heading"> 
                            <h3 align="center">Ingreso al Sistema de Control de Obsolescencia</h3>
                        </div>
                        <div class="panel-body">  
                            <form action="ServletLogin" method="post">
                                <table class="table">
                                    <tr>
                                        <td>Usuario: </td>
                                        <td><input type="text" name="txtUsu" class="form-control"
                                                   placeholder="Ingrese nombre de usuario" required="required"></td>
                                    </tr><tr>
                                        <td>Contraseña: </td>
                                        <td><input type="password" name="txtPas"  class="form-control"
                                                   placeholder="*********" required="required"></td>                                        
                                    </tr><tr>                                        
                                        <td colspan="2"><input type="submit" name="btn" class="btn btn-primary"
                                                   value="Iniciar Sesión"></td>
                                    </tr>
                                </table>
                            </form>

                            <%
                                if (request.getAttribute("msg") != null) {
                                    String msg = request.getAttribute("msg").toString();
                            %>
                            <div class="alert alert-danger" role="alert">
                                <%=msg%>
                            </div>
                            <%
                                }

                                if (request.getParameter("msg") != null) {
                                    String msg = request.getParameter("msg").toString();
                            %>
                            <div class="alert alert-warning" role="alert">
                                <%=msg%>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </body>

