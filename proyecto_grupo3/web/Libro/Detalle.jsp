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
 
        <title>Detalle Libro</title>
    </head>
    <body>
        <center>
            <div class="w-100 p-3 bg-dark">
                <h2 class="text-white text-center ">DETALLE LIBRO</h2>
            </div>
            <div class="container m-5">
                <div class="p-5 border border-info rounded shadow p-3 mb-5 bg-white">
                    <table border="2" class="table border border-info rounded shadow p-3" >
                        <th colspan="2" class="text-center">DATOS DEL LIBRO</th>
                        <tr>
                            <th>ID</th>
                            <td>${libro.getId()}</td>
                        </tr>
                        <tr>
                            <th>TITULO</th>
                            <td>${libro.getTitulo()}</td>
                        </tr>
                        <tr>
                            <th>AUTOR</th>
                            <td>${libro.getAutor()}</td>
                        </tr>
                        <tr>
                            <th>EDITORIAL</th>
                            <td>${libro.getEditorial()}</td>
                        </tr>
                        <tr>
                            <th>ANIO ESCRITO</th>
                            <td>${libro.getAnioEscrito()}</td>
                        </tr>
                        <tr>
                            <th>ANIO EDICION</th>
                            <td>${libro.getAnioEdicion()}</td>
                        </tr>
                        <tr>
                            <th>ISBN</th>
                            <td>${libro.getIsbn()}</td>
                        </tr>
                    </table>
                    <p></p> 
            </div>
            <p></p>    
        </div>
            <a class="btn btn-primary p-3 pr-5 pl-5 mb-5" href="../index.jsp">INICIO</a>
    </center>
    </body>
</html>
