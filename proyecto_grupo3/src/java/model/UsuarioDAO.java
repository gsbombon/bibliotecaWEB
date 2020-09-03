package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO implements Validar {
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
    Connection con;
    @Override
        public int validar(String socio,String pass) {
        String sql="SELECT s.usuario_socio as SOCIO, u.clave as CLAVE "
                + "FROM SOCIO s ,USUARIO u WHERE s.codigo_socio = u.codigo_socio "
                + "AND s.usuario_socio='"+socio+"' AND u.clave='"+pass+"'";
        int r=0;
        try{
            con =cn.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                r+=1;
            }
            if(r>=1){
                return 1;
            }else{
               return 0;
            }
        }catch(SQLException ex){
            System.out.println("Ocurrio un error con la Base"+ex.getMessage());
         return 0;
        }        
    } 
}
