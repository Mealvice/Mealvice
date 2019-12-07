/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import modeloVO.UsuarioVO;
import util.conexionBD;
import util.InterfaceCRUD;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class UsuarioDAO extends conexionBD implements InterfaceCRUD {

    //Atributos necesarias para la conexion
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    //Atributos necesarias para la clase
    private String identificacionUsu = "";
    private String nombreUsu = "";
    private String emailUsu = "";
    private String direccionUsu = "";
    private String telefonoUsu="";
    private String claveUsu = "";
    private String rolId = "";

    private boolean operacion = false;

    public UsuarioDAO(UsuarioVO usuVO) {

        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            identificacionUsu = usuVO.getIdentificacionUsu();
            nombreUsu = usuVO.getNombreUsu();
            emailUsu = usuVO.getEmailUsu();
            direccionUsu = usuVO.getDireccionUsu();
            telefonoUsu = usuVO.getTelefonoUsu();
            claveUsu = usuVO.getClaveUsu();
            rolId = usuVO.getRolId();

        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }

    }
    
     public boolean ValidarUsuario(String usuario, String clave){
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            mensajero = puente.executeQuery("call spValidarUsuario('"+emailUsu+"' , '"+claveUsu+"');");
            if (mensajero.next()) {
                operacion = true;
            }
            this.cerrarConexion();
        } catch (Exception e) {
            System.out.println("ERROR! "+ e.toString());
        }
        return operacion;
    }

    @Override
    public boolean AgregarRegistro() {
        try {
        puente.executeUpdate("call RegistrarUsuario ("+identificacionUsu+",'"+nombreUsu+"', '"+emailUsu+"', '"+direccionUsu+"', '"+telefonoUsu+"', '"+claveUsu+"', '"+rolId+"')");
        operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }  
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
         try {
        puente.executeUpdate("call ActualizarUsuario ("+identificacionUsu+",'"+nombreUsu+"', '"+emailUsu+"', '"+direccionUsu+"', '"+telefonoUsu+"', '"+claveUsu+"', '"+rolId+"')");
        operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }  
        return operacion;
    }
    public boolean ActualizarContraseña(String emailUsu, String claveUsu) {
         try {
        puente.executeUpdate("call RecuperarContraseña ('"+emailUsu+"','"+claveUsu+"')");
        operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }  
        return operacion;
    }

    @Override
    public boolean EliminarRegistro() {
            try {
        puente.executeUpdate("call EliminarUsuario ("+identificacionUsu+")");
        operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }  
        return operacion;
    }
    
    

    @Override
    public boolean ConsultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static UsuarioVO consultarPorIde(String identificacion) {

        UsuarioVO usuVO = null;

        try {
            conexionBD conexionBd = new conexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("call ConsultarUsuarioID ("+identificacion+");");
            while (mensajero.next()) {

                usuVO = new UsuarioVO(
                        identificacion,
                        mensajero.getString(2),
                        mensajero.getString(3),
                        mensajero.getString(4),
                        mensajero.getString(5),
                        mensajero.getString(6),
                        mensajero.getString(7));
            }
            mensajero.close();
        } catch (Exception e) {
            System.out.println(""
                    + "¡Error!" + e.toString());
        }
        return usuVO;
    }
        public static UsuarioVO validarSesion(String email) {

        UsuarioVO sesVO = null;

        try {
            conexionBD conexionBd = new conexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("call desencriptar('"+email+"');");
            while (mensajero.next()) {

                sesVO = new UsuarioVO(
                        mensajero.getString(1),
                        mensajero.getString(2),
                        mensajero.getString(3),
                        mensajero.getString(4),
                        mensajero.getString(5),
                        mensajero.getString(6),
                        mensajero.getString(7));
            }
            mensajero.close();
        } catch (Exception e) {
            System.out.println(""
                    + "¡Error!" + e.toString());
        }
        return sesVO;
    }
        public static UsuarioVO desencriptar(String email) {

        UsuarioVO sesVO = null;

        try {
            conexionBD conexionBd = new conexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("call desencriptar('"+email+"');");
            while (mensajero.next()) {

                sesVO = new UsuarioVO(
                        mensajero.getString(1),
                        mensajero.getString(2),
                        mensajero.getString(3),
                        mensajero.getString(4),
                        mensajero.getString(5),
                        mensajero.getString(6),
                        mensajero.getString(7));
            }
            mensajero.close();
        } catch (Exception e) {
            System.out.println(""
                    + "¡Error!" + e.toString());
        }
        return sesVO;
    }
    
     public ArrayList<UsuarioVO>ListarPorIde(String identificacionUsu){
        conexionBD conexionBd = new conexionBD();
        ArrayList<UsuarioVO>listaCategoria = new ArrayList<>();
        
        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select * from usuario where idUsuario = ");
            
            while (mensajero.next()) {
                identificacionUsu = mensajero.getString(1);
                nombreUsu = mensajero.getString(2);
                emailUsu = mensajero.getString(3);
                direccionUsu = mensajero.getString(4);
                telefonoUsu = mensajero.getString(5);
                claveUsu = mensajero.getString(6);
                rolId = mensajero.getString(7);

                UsuarioVO usuVO = new UsuarioVO(identificacionUsu, nombreUsu, emailUsu,  direccionUsu, telefonoUsu,  claveUsu, rolId);
                
                listaCategoria.add(usuVO);
                
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listaCategoria;
    }
     
     public ArrayList<UsuarioVO>listar(){
        conexionBD conexionBd = new conexionBD();
        ArrayList<UsuarioVO>ListarUsuarios = new ArrayList<>();
        
       try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT  `idUsuario`, `nombreUsuario`, `emailUsuario`, `direccionUsuario`, `telefono`, AES_DECRYPT (claveUsuario,'con'), `idRol`FROM usuario");
            
            while (mensajero.next()) {
                identificacionUsu = mensajero.getString(1);
                nombreUsu = mensajero.getString(2);
                emailUsu = mensajero.getString(3);
                direccionUsu = mensajero.getString(4);
                telefonoUsu = mensajero.getString(5);
                claveUsu = mensajero.getString(6);
                rolId = mensajero.getString(7);

                UsuarioVO usuVO = new UsuarioVO(identificacionUsu, nombreUsu, emailUsu,  direccionUsu, telefonoUsu,  claveUsu, rolId);
                
                ListarUsuarios.add(usuVO);
                
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return ListarUsuarios;
    }

    public UsuarioDAO() {
    }
}
