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
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a style="color: white;" href="#" class="navbar-toggler" > <span class="navbar-toggler-icon" ></span> Home</a>
            <%if (session.getAttribute("socio") != null && "ADM".equals(session.getAttribute("socio".toString())) ){ %>
            <a style="color: white;" class="nav-link" href="Socio.jsp">Socio</a>
            <a style="color: white;" class="nav-link" href="view/Prestamos.jsp">Prestamos</a>
            <%}%>
            <%if (session.getAttribute("socio") != null ) { %>
                <%if (!"ADM".equals(session.getAttribute("socio".toString())) ) { %>
                <a style="color: white;" class="nav-link" href="view/Libros.jsp">Libros</a>
                <a style="color: white;" class="nav-link" href="view/Reportes.jsp">Reportes</a>
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
                <h1> Bienvenido al sistema <strong>${socio}</strong> </h1>
            <%}else{%>
            <div class="container">
                <h1 class=" text-center">Proyecto Integrador</h1>
                <h2>Integrantes: </h2>
                <h3>* Gerson Steven Bombon Toca</h3>
                <h3>* Jairo Vizuete</h3>
                <h3>* Daniel Yandun</h3>
            </div>
            <%}%>
        </div>
    </body>
</html>

