
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Agregar Libro</title>
    </head>
    <body>
        <center>
            <div class="w-100 p-3 bg-dark">
                <h2 class="text-white text-center ">AGREGAR LIBRO</h2>
            </div>
            <div class="container m-5">
                <div class="p-5 border border-info rounded shadow p-3 mb-5 bg-white">
                    <form action="../LibroController" method="POST">
                        <label class="control-label h5" >TITULO: </label> 
                        <input class="form-control" type="text" name="txtTitulo" placeholder="Ingrese Titulo* "><br>
                        <label class="control-label h5" >AUTOR: </label> 
                        <input class="form-control" type="text" name="txtAutor" placeholder="Ingrese Autor* "><br>
                        <label class="control-label h5" >EDITORIAL: </label> 
                        <input class="form-control" type="text" name="txtEditorial" placeholder="Ingrese Editorial*"><br>
                        <label class="control-label h5" >ANIO ESCRITO: </label> 
                        <input class="form-control" type="number" name="txtEscrito" placeholder="Ingrese Anio Escrito*"><br>
                        <label class="control-label h5" >ANIO EDICION: </label> 
                        <input class="form-control" type="number" name="txtEdicion" placeholder="Ingrese Anio Edicion* "><br>
                        <label class="control-label h5" >ISBN: </label> 
                        <input class="form-control" type="number" name="txtIsbn" placeholder="Ingrese ISBN* "><br>
              
                    <br>
                    <input class="btn btn-success p-3 pr-5 pl-5" type="submit" name="accion" value="Guardar"><br>
                </form>
            </div>
            <p></p>    
        </div>
            <a class="btn btn-primary p-3 pr-5 pl-5 mb-5" href="Libros.jsp">INICIO</a>
    </center>
    </body>
</html>
