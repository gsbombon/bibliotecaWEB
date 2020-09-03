<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
        <title>Reporte 1</title>
    </head>
    <body>
        <div class="w-100 p-3 bg-dark mb-5">
            <h2 class="text-white text-center">¿Cuáles son los nombres de los libros cuyo total de ejemplares estan nuevos (sin deteriorar)?</h2>
        </div>
        <div class="container">
        <table  border="2" class="table border border-info rounded shadow p-3">
            <tr class="text-center">
                <th>CODIGO LIBRO</th>
                <th>EJEMPLAR LIBRO</th>
            </tr>
            <%
            Conexion c = new Conexion();//Creo el objeto de tipo conexion
            Connection con;
            //Statement sta = null;
            ResultSet rs = null;
            PreparedStatement ps;
            String sql = "SELECT ej.CODIGO_LIBRO, li.TITULO_LIBRO FROM EJEMPLAR ej, LIBRO li "
                    + "WHERE ej.CODIGO_LIBRO = li.CODIGO_LIBRO AND ej.CODIGO_LIBRO "
                    + "NOT IN (SELECT ej.CODIGO_LIBRO from EJEMPLAR WHERE ej.DETERIORADO = 1)";
                
            try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                %>
                    <tr class="text-center">
                        <th><%=rs.getString(1)%></th>
                        <th><%=rs.getString(2)%></th>
                    </tr>
                <%
            }
            }catch(Exception e){}
            %>
        </table>
        </div>
        <div class="text-center">
            <a class="btn btn-info p-3" href="../index.jsp">REGRESAR</a>
        </div>
    </body>
</html>