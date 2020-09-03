
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Libro"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 
        <title>Editar Libro</title>
    </head>
    <body>
        <center>
            <div class="w-100 p-3 bg-dark">
                <h2 class="text-white text-center ">EDITAR LIBRO</h2>
            </div>
            <div class="container m-5">
                <div class="p-5 border border-info rounded shadow p-3 mb-5 bg-white">
                   
                    <form action="./LibroController" method="POST">
                        <label class="control-label h5" >ID: </label> 
                        <input class="form-control" type="text" name="txtId" value="${libro2.getId()}" ><br>
                        <label class="control-label h5" >TITULO: </label> 
                        <input class="form-control" type="text" name="txtTitulo" value="${libro2.getTitulo()}" ><br>
                        <label class="control-label h5" >AUTOR: </label> 
                        <input class="form-control" type="text" name="txtAutor" value="${libro2.getAutor()}" ><br>
                        <label class="control-label h5" >EDITORIAL: </label> 
                        <input class="form-control" type="text" name="txtEditorial" value="${libro2.getEditorial()}"><br>
                        <label class="control-label h5" >ANIO ESCRITO: </label> 
                        <input class="form-control" type="text" name="txtEscrito" value="${libro2.getAnioEscrito()}"><br>
                        <label class="control-label h5" >ANIO EDICION: </label> 
                        <input class="form-control" type="text" name="txtEdicion" value="${libro2.getAnioEdicion()}"><br>
                        <label class="control-label h5" >ISBN: </label> 
                        <input class="form-control" type="text" name="txtIsbn" value="${libro2.getIsbn()}"><br>
              
                    <br>
                    <input type="submit" value="Actualizar" name="accion">

                </form>
            </div>
            <p></p>    
        </div>
            <a class="btn btn-primary p-3 pr-5 pl-5 mb-5" href="Socio.jsp">INICIO</a>
    </center>
    </body>
</html>
