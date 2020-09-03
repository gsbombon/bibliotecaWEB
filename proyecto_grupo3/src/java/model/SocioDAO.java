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
                s.setId(rs.getInt(1));
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
    
    public int agregar(Socio p) {
        int r = 0;
        String sql = "INSERT INTO SOCIO (codigo_socio,cedula_socio,usuario_socio,nombre_socio,apellido_socio,telefono_socio) values(?,?,?,?,?,?)";
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            ps.setNull(1, java.sql.Types.BIGINT);
            ps.setString(2, p.getCedula());
            ps.setString(3, p.getUsuario());
            ps.setString(4, p.getNombre());
            ps.setString(5, p.getApellido());
            ps.setString(6, p.getTelefono());
            r = ps.executeUpdate();
            if (r == 1) {
                r = 1;
                int user = buscar(p.getUsuario());
                if (user != -1) {
                    String sql2 = "INSERT INTO USUARIO(CODIGO_USUARIO,CODIGO_SOCIO,CLAVE) values(?,?,?)";
                    con = c.conectar();
                    ps.setNull(1, java.sql.Types.BIGINT);
                    ps.setInt(2, user);
                    ps.setString(3, p.getPass());
                    ps.executeUpdate(sql2);
                }
            } else {
                r = 0;
            }

        } catch (Exception e) {
            r = 0;
        }

        return r;
    }

    public int buscar(String usuario) {
        String sql = "SELECT * FROM SOCIO WHERE USUARIO_SOCIO='" + usuario + "'";
        int codigo = -1;
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                codigo = rs.getInt(1);
            }

        } catch (Exception e) {
            return codigo;
        }
        return codigo;

    }
        
    public Socio listarSocio(String id){
        String sql="SELECT * FROM socio WHERE codigo_socio="+id;
        Socio s=new Socio();
        try{
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                s.setId(rs.getInt(1));
                s.setCedula(rs.getString(2));
                s.setUsuario(rs.getString(3));
                s.setNombre(rs.getString(4));
                s.setApellido(rs.getString(5));
                s.setTelefono(rs.getString(6));
            }
        }catch(SQLException e){
            
        }
        return s;
    }
    
    public int Actualizar(Socio p) {
        int r = 0;
        String sql = "UPDATE SOCIO SET CEDULA_SOCIO=?, USUARIO_SOCIO=?, "
                + "NOMBRE_SOCIO=?, APELLIDO_SOCIO=?, TELEFONO_SOCIO=? "
                + "WHERE CODIGO_SOCIO=?";
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getCedula());
            ps.setString(2, p.getUsuario());
            ps.setString(3, p.getNombre());
            ps.setString(4, p.getApellido());
            ps.setString(5, p.getTelefono());
            ps.setInt(6, p.getId());
            r = ps.executeUpdate();
            if (r == 1) {
                r = 1;
            } else {
                r = 0;
            }
        } catch (Exception e) {

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
