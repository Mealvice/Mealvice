/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

/**
 *
 * @author Nata
 */

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modeloVO.productoVO;
import util.conexionBD;
import util.InterfaceCRUD;



public class productoDAO extends conexionBD implements InterfaceCRUD{
    
    //Conexion
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    
    //variables que se van a manejar
    
    private String idProducto = "";
    private String nombreProducto = "";
    private String precioProducto = "";
    private String tipoProducto = "";
    private String estadoProducto = "";
    private String count;
    
    private boolean operacion = false;
    
    //metodo de la clase
    public productoDAO(){};
    
    public productoDAO(productoVO proVO){
        
        super();
        
        try {
            
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
           
            idProducto = proVO.getIdProducto();
            nombreProducto = proVO.getNombreProducto();
            precioProducto = proVO.getPrecioProducto();
            tipoProducto = proVO.getTipoProducto();
            estadoProducto = proVO.getEstadoProducto();
           
            
        } catch (Exception e) {
            
            System.out.println("¡Error!"+ e.toString());
        }
    }
    

    @Override
    public boolean AgregarRegistro() {
        try {
            
             puente.executeUpdate(" call RegistrarProducto('"+idProducto+"','"+nombreProducto+"', '"+precioProducto+"', '"+tipoProducto+"', '"+estadoProducto+"')");
             operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
         try {
            
             puente.executeUpdate("CALL spActualizarProducto ('"+ idProducto + "','" + nombreProducto +"', '"+ precioProducto + "' , '" + tipoProducto + "' , '" + estadoProducto + "' )");
             operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return operacion;
    }

    @Override
    public boolean ConsultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public ArrayList<productoVO> listar (){
     
        conexionBD conexionbd = new conexionBD();
        ArrayList<productoVO>listarProducto= new ArrayList<>();
        
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from producto");
            
            while (mensajero.next()) {
                
                idProducto = mensajero.getString(1);
                nombreProducto = mensajero.getString(2);
                precioProducto = mensajero.getString(3);
                tipoProducto = mensajero.getString(4);
                estadoProducto = mensajero.getString(5);
               
                
                productoVO proVO = new productoVO(idProducto, nombreProducto, precioProducto, tipoProducto, estadoProducto);
                
               listarProducto.add(proVO);
                
            }
        } catch (Exception e) {
            
            System.out.println("¡Error!"+ e.toString());
        }
        return listarProducto;
    
    }

    public productoVO list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<productoVO> listarId (String idCarta){
     
        conexionBD conexionbd = new conexionBD();
        ArrayList<productoVO>listaProductosCa = new ArrayList<>();
        
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("CALL `SPCartas`("+idCarta+");");
            
            while (mensajero.next()) {
                idProducto = mensajero.getString(1);
                nombreProducto = mensajero.getString(2);
                precioProducto = mensajero.getString(3);
                tipoProducto = mensajero.getString(4);
                estadoProducto = mensajero.getString(5);
                
                productoVO proVO = new productoVO(idProducto, nombreProducto, precioProducto, tipoProducto, estadoProducto);
                
               listaProductosCa.add(proVO);
                
            }
        } catch (Exception e) {
            
            System.out.println("¡Error!"+ e.toString());
        }
        return listaProductosCa;
    
    }
      public static productoVO consultarId(String idProducto){
    
        productoVO proVO = null;
        
        try {
            
            conexionBD conexionbd = new conexionBD();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("select * from producto where idProducto='"+idProducto+"'");
            while (mensajero.next()) {
                
                proVO = new productoVO(idProducto,mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                
            }
            mensajero.close();
            puente.close();
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return proVO;
    
    }
       public ArrayList<productoVO> listarc() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<productoVO> listarc = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select COUNT(*) from producto");

            while (mensajero.next()) {

                count = mensajero.getString(1);
                productoVO prodVO = new productoVO(count);

                listarc.add(prodVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listarc;
    }

    
        
    
 
}
