<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String usuario = "";
    String perfil = "";
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("nombre") == null) {
%>
<jsp:forward page="index.jsp">
    <jsp:param name="msg" value="Debe iniciar sesión para acceder al Sistema"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("nombre");
        perfil = (String) sesionOk.getAttribute("perfil");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Control de Obsolescencia Tecnológica</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Utilidades
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                <li><a class="dropdown-item" href="ServletErrores">Reportar error</a></li>
                                <li><a class="dropdown-item disabled" href="ServletPermisos">Permisos</a></li>
                                <li><a class="dropdown-item disabled" href="ServletHerramientas">Herramientas</a></li>
                                <li><hr class="dropdown-divider"></li>                                
                                <li><a class="dropdown-item disabled" href="#">Mantenimiento de BD</a></li>
                            </ul>
                        </li>
                    </ul>
                    <span class="navbar-text">
                        Usuario: <b><%=usuario%></b> | Perfil: <%=perfil%> | Duración: <input class="timepage" size="5" id="timespent" name="timespent">&nbsp&nbsp
                        <a href="ServletLogin?op=cerrar"><button class="btn btn-danger">Cerrar sesión</button></a>
                    </span>
                </div>
            </div>
        </nav>