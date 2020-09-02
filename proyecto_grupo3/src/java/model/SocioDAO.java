package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SocioDAO {
    PreparedStatement ps;
    PreparedStatement aux;
    ResultSet rs;
    Conexion c = new Conexion();
    Connection con;
    
    public List listar(){
        List<Socio> lista=new ArrayList<>();
        String sql="SELECT * FROM socio";
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Socio s = new Socio();
                s.setId(rs.getString(1));
                s.setCedula(rs.getString(2));
                s.setUsuario(rs.getString(3));
                s.setNombre(rs.getString(4));
                s.setApellido(rs.getString(5));
                s.setTelefono(rs.getString(6));
                lista.add(s);
            }
        }catch (SQLException e){
        }
        return lista;
    }
    
    public int agregar(Socio s){
        int r=0;
        String sql="INSERT INTO socio (codigo_socio,cedula_socio,usuario_socio,nombre_socio,apellido_socio, telefono_socio) values (?,?,?,?,?,?)";
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, s.getId());
            ps.setString(2, s.getCedula());
            ps.setString(3, s.getUsuario());
            ps.setString(4, s.getNombre());
            ps.setString(5, s.getApellido());
            ps.setString(6, s.getTelefono());
            r=ps.executeUpdate();
            if(r==1){
                r=1;
            }else{
                r=0;
            }
        }catch (SQLException e){
            
        }
        return r;
    }
    
    public Socio listarSocio(String id){
        String sql="SELECT * FROM socio WHERE codigo_socio="+id;
        Socio s=new Socio();
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                s.setId(rs.getString(1));
                s.setCedula(rs.getString(2));
                s.setUsuario(rs.getString(3));
                s.setNombre(rs.getString(4));
                s.setApellido(rs.getString(5));
                s.setTelefono(rs.getString(6));
                //s.setPass(rs.getString(7));
            }
        }catch(SQLException e){
            
        }
        return s;
    }
    
    public int Actualizar(Socio s){
        int r=0;
        String sql="UPDATE socio SET cedula_socio=?,usuario_socio=?,nombre_socio=?,apellido_socio=?, telefono_socio=? WHERE codigo_socio=?";
        try{
            con=c.conectar();
            ps.setString(1, s.getCedula());
            ps.setString(2, s.getUsuario());
            ps.setString(3, s.getNombre());
            ps.setString(4, s.getApellido());
            ps.setString(5, s.getTelefono());
            ps.setString(6, s.getId());
            r=ps.executeUpdate();
            if(r==1){
                r=1;
            }else{
                r=0;
            }
        }catch(SQLException e){
            
        }
        return r;
    }
    
    public void delete(String id){
        String sql="DELETE FROM socio WHERE codigo_socio="+id;
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException e) {
            
        }
    }
}
