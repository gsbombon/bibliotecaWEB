<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Socio</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body >
        <center>
        <div class="w-100 p-3 bg-dark">
            <h2 class="text-white text-center">DETALLES SOCIO</h2>
        </div>
        <div class="container m-5">
            
            <table border="2" class="table border border-info rounded shadow p-3" >
                <th colspan="2" class="text-center">DATOS PERSONALES</th>
                <tr>
                    <th>ID</th>
                    <td>${socio.getId()}</td>
                </tr>
                <tr>
                    <th>CEDULA</th>
                    <td>${socio.getCedula()}</td>
                </tr>
                <tr>
                    <th>NOMBRE</th>
                    <td>${socio.getNombre()}</td>
                </tr>
                <tr>
                    <th>APELLIDO</th>
                    <td>${socio.getApellido()}</td>
                </tr>
                <tr>
                    <th>TELEFONO</th>
                    <td>${socio.getTelefono()}</td>
                </tr>
                <tr>
                    <th>USUARIO</th>
                    <td>${socio.getUsuario()}</td>
                </tr>
            </table>
            <p></p>    
        </div>
            <a class="btn btn-primary p-3 pr-5 pl-5 mb-5" href="Socio.jsp">INICIO</a>
    </center>
    </body>
</html>
