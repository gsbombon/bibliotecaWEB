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
        String sql="SELECT s.*,u.clave FROM socio s,usuario u WHERE s.codigo_socio=u.codigo_socio";
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
                s.setPass(rs.getString(7));
                lista.add(s);
            }
        }catch (Exception e){
        }
        return lista;
    }
    
    public int agregar(Socio s){
        int r=0;
        int t=0;
        String sql="INSERT INTO socio (codigo_socio,cedula_socio,usuario_socio,nombre_socio,apellido_socio, telefono_socio) values ("+s.getId()+",'"+s.getCedula()+"','"+s.getUsuario()+"','"+s.getNombre()+"','"+s.getApellido()+"','"+s.getTelefono()+"')";
        String sql2="INSERT INTO USUARIO (codigo_usuario,codigo_socio,clave) VALUES (null,'"+s.getId()+"','"+s.getPass()+"')";
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            aux=con.prepareStatement(sql2);
            ps.setString(1, s.getId());
            ps.setString(2, s.getCedula());
            ps.setString(3, s.getUsuario());
            ps.setString(4, s.getNombre());
            ps.setString(5, s.getApellido());
            ps.setString(6, s.getTelefono());
            r=ps.executeUpdate();
            t=aux.executeUpdate();
            if(r==1 && t==1){
                r=1;
            }else{
                r=0;
            }
        }catch (SQLException e){
            
        }
        return r;
    }
    
    public Socio listarSocio(String id){
        String sql="SELECT s.*,u.clave FROM socio s, usuario u WHERE s.codigo_socio=u.codigo_socio  AND s.codigo_socio="+id;
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
                s.setPass(rs.getString(7));
            }
        }catch(SQLException e){
            
        }
        return s;
    }
    
    public int Actualizar(Socio s){
        int r=0;
        String sql="UPDATE socio SET cedula_socio='"+s.getCedula()+"',usuario_socio='"+s.getUsuario()+"',nombre_socio='"+s.getNombre()+"',apellido_socio='"+s.getApellido()+"', telefono_socio='"+s.getTelefono()+"' WHERE codigo_socio="+s.getId();
        try{
            con=c.conectar();
            ps.setString(1, s.getCedula());
            ps.setString(2, s.getUsuario());
            ps.setString(3, s.getNombre());
            ps.setString(4, s.getApellido());
            ps.setString(5, s.getTelefono());
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
