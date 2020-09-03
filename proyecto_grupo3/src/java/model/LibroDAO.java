
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LibroDAO {
    
    PreparedStatement ps;
    PreparedStatement ps2;
    PreparedStatement ps3;
    ResultSet rs;
    Conexion c = new Conexion();//Creo el objeto de tipo conexion
    Connection con;
    
    //Creo el metodo para listar los datos de Persona
    
    public List listar(){
        List<Libro>lista=new ArrayList<>();
        String sql = "select * from LIBRO";
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Libro li = new Libro();
                li.setId(rs.getInt(1));
                li.setTitulo(rs.getString(2));
                li.setEditorial(rs.getString(3));
                li.setAnioEscrito(rs.getInt(4));
                li.setAnioEdicion(rs.getInt(5));
                li.setIsbn(rs.getInt(6));
                lista.add(li);
            }
        }catch(Exception e){
            
        }
        return lista;
    }
    
     public int agregar(Libro li, Autor aut){
        int r=0;
        String sql = "insert into LIBRO( TITULO_LIBRO, EDITORIAL_LIBRO, ANIO_ESCRITO, ANIO_EDICION, ISBN) values(?,?,?,?,?)";
        String sql2 = "insert into AUTOR(NOMBRE_AUTOR) values(?)";
        String sql3 = "insert into LIBRO_AUTOR(CODIGO_AUTOR,CODIGO_LIBRO) values((SELECT MAX(CODIGO_AUTOR) FROM AUTOR),(SELECT MAX(CODIGO_LIBRO) FROM LIBRO))";
        try{
            con = c.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, li.getTitulo());
            ps.setString(2, li.getEditorial());
            ps.setInt(3, li.getAnioEscrito());
            ps.setInt(4, li.getAnioEdicion());
            ps.setInt(5, li.getIsbn());
            r=ps.executeUpdate();
            
            ps2=con.prepareStatement(sql2);
            ps2.setString(1, aut.getNombre());
            r=ps2.executeUpdate();
            
            ps3=con.prepareStatement(sql3);
            r=ps3.executeUpdate();
            
            if(r==1){
                r=1;
            }else{
                r=0;
            }
        }catch(Exception e){
            
        }
        return r;
    }
    
          
     
     
    public Libro detalleId(String id){
        String sql = "select * from LIBRO where CODIGO_LIBRO="+id;
        Libro li = new Libro();
        Autor aut = new Autor();
        String sql2 = "select l.CODIGO_LIBRO, l.TITULO_LIBRO, a.NOMBRE_AUTOR, l.EDITORIAL_LIBRO, l.ANIO_ESCRITO, l.ANIO_EDICION,l.ISBN FROM LIBRO l INNER JOIN AUTOR a ON a.CODIGO_AUTOR=l.CODIGO_LIBRO WHERE CODIGO_LIBRO="+id;
        
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql2);
            rs=ps.executeQuery();
            while(rs.next()){
                li.setId(rs.getInt(1));
                li.setTitulo(rs.getString(2));
                li.setAutor(rs.getString(3));
                li.setEditorial(rs.getString(4));
                li.setAnioEscrito(rs.getInt(5));
                li.setAnioEdicion(rs.getInt(6));
                li.setIsbn(rs.getInt(7));
            }
        }catch(Exception e){
            
        }
        return li;

    }
    
    public Libro listarId(String id){
        String sql = "select * from LIBRO where CODIGO_LIBRO="+id;
        Libro li = new Libro();
        Autor aut = new Autor();
        String sql2 = "select l.CODIGO_LIBRO, l.TITULO_LIBRO, a.NOMBRE_AUTOR, l.EDITORIAL_LIBRO, l.ANIO_ESCRITO, l.ANIO_EDICION,l.ISBN FROM LIBRO l INNER JOIN AUTOR a ON a.CODIGO_AUTOR=l.CODIGO_LIBRO WHERE CODIGO_LIBRO="+id;
        
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql2);
            rs=ps.executeQuery();
            while(rs.next()){
                li.setId(rs.getInt(1));
                li.setTitulo(rs.getString(2));
                li.setAutor(rs.getString(3));
                li.setEditorial(rs.getString(4));
                li.setAnioEscrito(rs.getInt(5));
                li.setAnioEdicion(rs.getInt(6));
                li.setIsbn(rs.getInt(7));
            }
        }catch(Exception e){
            
        }
        return li;

    }
    
    public int actualizar(Libro li, Autor aut){
        int r=0;
        String sql = "UPDATE LIBRO SET TITULO_LIBRO=?, EDITORIAL_LIBRO=?, ANIO_ESCRITO=?, ANIO_EDICION=?,ISBN=? WHERE CODIGO_LIBRO=?";
        String sql2 = "UPDATE AUTOR SET NOMBRE_AUTOR=? WHERE CODIGO_AUTOR=?";
        try{
            
            con = c.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, li.getTitulo());
            ps.setString(2, li.getEditorial());
            ps.setInt(3, li.getAnioEscrito());
            ps.setInt(4, li.getAnioEdicion());
            ps.setInt(5, li.getIsbn());
            ps.setInt(6, li.getId());
            r=ps.executeUpdate();
            
            ps2=con.prepareStatement(sql2);
            ps2.setString(1, aut.getNombre());
            ps2.setInt(2, aut.getId());
            r=ps2.executeUpdate();
            System.out.println("SQLQ: "+li.getAnioEscrito());
            if(r==1){
                r=1;
            }else{
                r=0;
            }
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        return r;
    }
    
    public void delete(int id){
        String sql="DELETE from AUTOR WHERE CODIGO_AUTOR="+id;
        String sql2="DELETE from LIBRO WHERE CODIGO_LIBRO="+id;
        try{
            con = c.conectar();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
            ps2=con.prepareStatement(sql2);
            ps2.executeUpdate();
        }catch(Exception e){
            
        }
    }
}
