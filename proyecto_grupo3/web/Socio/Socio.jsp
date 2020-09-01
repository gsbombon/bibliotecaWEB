<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Socio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Socios</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="w-100 p-3 bg-dark mb-5">
            <h2 class="text-white text-center">LISTA DE SOCIOS</h2>
        </div>
        <div class="container">
            <center>
                <div class="form-group">
                    <form action="../SociosController" method="POST">
                        <input type="submit" name="accion" value="Listar" class="btn btn-primary">
                    </form>
                    <a href="Socio/agregar.jsp" class="btn btn-success">NUEVO REGISTRO</a>
                </div>
                <div>
                    <table border="1" class="table table-dark">
                        <thead>
                            <tr class="text-center">
                                <th>ID</th>
                                <th>Cedula</th>
                                <th>Usuario</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Telefono</th>
                                <th>Contraseña</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${datos}">
                                <tr>
                                    <td>${dato.getId()}</td>
                                    <td>${dato.getCedula()}</td>
                                    <td>${dato.getUsuario()}</td>
                                    <td>${dato.getNombre()}</td>
                                    <td>${dato.getApellido()}</td>
                                    <td>${dato.getTelefono()}</td>
                                    <td>${dato.getPass()}</td>
                                    <td>
                                        <form action="../SociosController" method="POST">
                                            <input type="hidden" name="id" value="${dato.getId()}">
                                            <input class="btn btn-success" type="submit" name="accion" value="Editar">
                                            <input class="btn btn-danger" type="submit" name="accion" value="Eliminar">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <a class="btn btn-info" href="index.jsp">Regresar al Menu</a>
                    </div>
                </div>
            </center>
            
        </div>
    </body>
</html>
