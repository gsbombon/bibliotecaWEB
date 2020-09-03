<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </head>
    <body style="background-image: url('img/bg-libraryblanco.jpg');" >
        <nav class="navbar navbar-dark bg-dark">
            
            <a style="color: white;" href="#" class="navbar-toggler" > <span class="navbar-toggler-icon" ></span> Home</a>
            <%if (session.getAttribute("socio") != null && "ADM".equals(session.getAttribute("socio".toString())) ){ %>
            
            <!--REPORTES-->
            <div class="dropdown">
            <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                REPORTES
            </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="Reportes/Report_1.jsp">Reporte 1</a>
                    <a class="dropdown-item" href="Reportes/Report_2.jsp">Reporte 2</a>
                    <a class="dropdown-item" href="Reportes/Report_3.jsp">Reporte 3</a>
                    <a class="dropdown-item" href="Reportes/Report_4.jsp">Reporte 4</a>
                </div>
            </div>
            <!--REPORTES-->
            
            <a class="nav-link btn btn-dark" href="Socio.jsp">Usuarios</a>
            <form action="LibroController" method="post">
                <input class="nav-link btn btn-dark" type="submit" name="accion" value="Listar Libros">
            </form>
            <%}%>
            
            <!--SOCIO-->
            <%if (session.getAttribute("socio") != null ) { %>
                <%if (!"ADM".equals(session.getAttribute("socio".toString())) ) { %>
                
                <form action="LibroController" method="post">
                    <input class="nav-link btn btn-dark" type="submit" name="accion" value="Libros">
                </form>
                
                <form action="PrestamoController" method="post">
                    <input class="nav-link btn btn-dark" type="submit" name="accion" value="Prestamos">
                </form>

                <%}%>
            <%}%>
            <div class="dropdown">
                <%if (session.getAttribute("socio") != null) { %>
                <a style="color: white;" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" >Cerrar Sesion</a>
                <div class="dropdown-menu text-center">
                    <a><img src="img/user.png" height="80" width="80" /></a>
                    <p></p>
                    <a> ${socio} </a>
                    <div class="dropdown-divide" ></div>
                    <a href="cerrarSession" class="dropdown-item" >Cerrar Session</a>
                </div>                
                <%}else{%>
                <a style="color: white;" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" >Login</a>
                <div class="dropdown-menu text-center">
                    <a>
                        <img src="img/user.png" height="80" width="80" />                        
                    </a>
                    <p></p>
                    <div class="dropdown-divide" ></div>
                    <a href="login.jsp" class="dropdown-item" >Iniciar Session</a>
                </div>
                <%}%>
            </div>
        </nav>
        
        <div class="container mt-4">
            <%if(session.getAttribute("socio")!= null){ %>
            
            <div class="container text-center mt-5 pt-5">
                <h1 class="display-1 mt-5"> BIENVENIDO AL SISTEMA  </h1>
                <h1 class="display-1 mt-5"> BIBLIOTECA WEB  </h1>
                <h1 class="display-2 mt-5"> <strong>${socio}</strong>  </h1>
            </div>
                
            <%}else{%>
            
            <div class="container text-center mt-5 pt-5">
                <h1 class="display-1 mt-5"> <strong> PROYECTO INTEGRADOR </strong>  </h1>
                <h1 class="display-3 mt-5 "> BOMBON STEVEN   </h1>
                <h1 class="display-3 mt-5 "> VIZUETE JAIRO  </h1>
                <h1 class="display-3 mt-5 "> YANDUN DANIEL   </h1>
            </div>
            <%}%>
        </div>
    </body>
</html>


