<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String usuario = "";
    int perfil = 0;
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("nombre") == null) {
%>
<jsp:forward page="index.jsp">
    <jsp:param name="msg" value="Debe iniciar sesión para acceder al Sistema"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("nombre");
        perfil = Integer.parseInt(sesionOk.getAttribute("perfil").toString());
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Control de Obsolescencia Tecnológica</title>
        <!-- JS dependencies -->        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>        
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>        
        <!-- BOOTBOX (requiere JQUERY) -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
        <script type="text/javascript">
            bootbox.confirm({
                message: "¿Desea eliminar este registro?",
                buttons: {
                    confirm: {
                        label: 'Sí',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    console.log('This was logged in the callback: ' + result);
                }
            });</script>        
    </head>
    <body>
        <script>
            startday = new Date();
            clockStart = startday.getTime();
            function initStopwatch() {
                var myTime = new Date();
                return((myTime.getTime() - clockStart) / 1000);
            }
            function getSecs() {
                var tSecs = Math.round(initStopwatch());
                var iSecs = tSecs % 60;
                var iMins = Math.round((tSecs - 30) / 60);
                var sSecs = "" + ((iSecs > 9) ? iSecs : "0" + iSecs);
                var sMins = "" + ((iMins > 9) ? iMins : "0" + iMins);
                document.getElementById('timespent').value = sMins + ":" + sSecs;
                window.setTimeout('getSecs()', 1000);
            }
            window.onload = function () {
                window.setTimeout('getSecs()', 1);
            }
        </script>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="home.jsp">SISCOOB</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Equipos
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                <li><a class="dropdown-item" href="ServletEquipos">Lista de equipos</a></li>
                                <li><a class="dropdown-item" href="eq_nuevo.jsp">Nuevo equipo</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item disabled" href="#">Reportes</a></li>
                            </ul>
                        </li>

                        <% if (perfil > 1) {%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Usuarios
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                <li><a class="dropdown-item" href="ServletUsuarios">Lista de Usuarios</a></li>
                                <li><a class="dropdown-item" href="u_nuevo.jsp">Nuevo Usuario</a></li>

                                <li><hr class="dropdown-divider"></li>                                
                                <li><a class="dropdown-item disabled" href="#">Reportes</a></li>
                            </ul>
                        </li>
                        <%}%>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Utilidades
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                <li><a class="dropdown-item" href="ServletLogs">Registro de eventos</a></li>
                                <li><a class="dropdown-item" href="ServletReportes">Reportes</a></li>
                                <li><a class="dropdown-item disabled" href="ServletPermisos">Perfiles de usuario</a></li>
                                <li><a class="dropdown-item disabled" href="ServletHerramientas">Estados de equipo</a></li>
                                <li><hr class="dropdown-divider"></li>                                
                                <li><a class="dropdown-item disabled" href="#">Mantenimiento de BD</a></li>
                            </ul>
                        </li>
                    </ul>
                    <span class="navbar-text">
                        <u>Nombre</u>: <b><%=usuario%></b>&nbsp;|&nbsp;<u>Perfil</u>: <% if (perfil == 1) {%>Usuario<%} else if (perfil == 2) {%>Administrador<%} else if (perfil == 9) {%>Super Administrador<%} else {%>Indeterminado<%}%> | Duración: <input class="timepage" size="5" id="timespent" name="timespent">&nbsp&nbsp
                        <a href="ServletLogin?op=cerrar"><button class="btn btn-danger">Cerrar sesión</button></a>
                    </span>
                </div>
            </div>
        </nav>