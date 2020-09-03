<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Socio</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body >
        <center>
        <div class="w-100 p-3 bg-dark">
            <h2 class="text-white text-center ">AGREGAR NUEVO SOCIO</h2>
        </div>
        <div class="container m-5">
            <div class="p-5 border border-info rounded shadow p-3 mb-5 bg-white">
                <form action="SociosController" method="POST">
                    <label class="control-label h5" >ID: </label> 
                    <input class="form-control" type="number" name="txtId" placeholder="Se asigna por defecto " disabled ><br>
                    <label class="control-label h5" >CEDULA: </label> 
                    <input class="form-control" type="text" name="txtCedula" placeholder="Ingrese Cedula* "><br>
                    <label class="control-label h5" >NOMBRE: </label> 
                    <input class="form-control" type="text" name="txtNombre" placeholder="Ingrese Nombre*"><br>
                    <label class="control-label h5" >APELLIDO: </label> 
                    <input class="form-control" type="text" name="txtApellido" placeholder="Ingrese Apellido*"><br>
                    <label class="control-label h5" >TELEFONO: </label> 
                    <input class="form-control" type="text" name="txtTelefono" placeholder="Ingrese Telefono* "><br>
                    <label class="control-label h5" >USUARIO: </label> 
                    <input class="form-control" type="text" name="txtUsuario" placeholder="Ingrese Usuario* "><br>
                    <label class="control-label h5" >CONTRASEÑA: </label> 
                    <input class="form-control" type="password" name="txtPass" placeholder="Ingrese Contraseña* "><br>
                    <br>
                    <input class="btn btn-success p-3 pr-5 pl-5" type="submit" name="accion" value="Guardar"><br>
                </form>
            </div>
            <p></p>    
        </div>
            <a class="btn btn-primary p-3 pr-5 pl-5 mb-5" href="Socio.jsp">INICIO</a>
    </center>
    </body>
</html>
