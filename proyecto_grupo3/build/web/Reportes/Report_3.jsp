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
        
        <title>Reporte 3</title>
    </head>
    <body>
        <h1 class="text-center">¿Cuántos libros editados por norma fueron prestados?</h1>
        <br>
        <div class="container">
        <table  border="2" class="table border border-info rounded shadow p-3">
            <tr class="text-center">
                <th>CÓDIGO LIBRO</th>
                <th>CÓDIGO EJEMPLAR</th>
                <th>CÓDIGO SOCIO</th>
                <th>FECHA PRESTAMO</th>
                <th>FECHA DEVOLUCIÓN REAL</th>
                <th>FECHA DEVOLVER</th>                                                
            </tr>
            <%
            Conexion cn = new Conexion();//Creo el objeto de tipo conexion
            Connection conn;
            ResultSet res;
            PreparedStatement ps;
            String sql = "SELECT * FROM PRESTAMO WHERE CODIGO_LIBRO "
                    + "IN (SELECT CODIGO_LIBRO FROM LIBRO WHERE UPPER(EDITORIAL_LIBRO) LIKE 'NORMA')";
                
            try{
            conn = cn.conectar();
            ps=conn.prepareStatement(sql);
            res=ps.executeQuery();
            while(res.next()){
                %>
                    <tr class="text-center">
                        <th><%=res.getString(1)%></th>
                        <th><%=res.getString(2)%></th>
                        <th><%=res.getString(3)%></th>
                        <th><%=res.getString(4)%></th>
                        <th><%=res.getString(5)%></th>
                        <th><%=res.getString(6)%></th>
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