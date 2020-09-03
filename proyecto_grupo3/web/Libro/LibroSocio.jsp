
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Libro"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <title>LIBROS</title>
    </head>
    <body>
        <div class="w-100 p-3 bg-dark mb-5">
            <h2 class="text-white text-center">LISTA DE LIBROS</h2>
        </div>
        <div class="container">
            <center>

                <div>
                    <table border="1" class="table table-dark">
                        <thead>
                            <tr class="text-center">
                                <th>ID</th>
                                <th>Titulo</th>
                                <th>Editorial</th>
                                <th>Anio Escrito</th>
                                <th>Anio Edicion</th>
                                <th>Isbn</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${datos}">
                                <tr>
                                    <td>${dato.getId()}</td>
                                    <td>${dato.getTitulo()}</td>
                                    <td>${dato.getEditorial()}</td>
                                    <td>${dato.getAnioEscrito()}</td>
                                    <td>${dato.getAnioEdicion()}</td>
                                    <td>${dato.getIsbn()}</td>
                                    <td>
                                        <form action="../LibroController" method="POST">
                                            <input type="hidden" name="id" value="${dato.getId()}">
                                            <input class="btn btn-warning" type="submit" name="accion" value="Detalle">
       
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <a class="btn btn-info" href="../index.jsp">Regresar al Menu</a>
                    </div>
                </div>
            </center>
            
        </div>
    </body>
</html>
