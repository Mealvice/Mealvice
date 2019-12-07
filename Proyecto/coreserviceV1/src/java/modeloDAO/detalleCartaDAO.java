/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modeloVO.detalleCartaVO;
import util.InterfaceCRUD;
import util.conexionBD;
import modeloVO.productoVO;
import modeloVO.cartaVO;

/**
 *
 * @author APRENDIZ
 */
public class detalleCartaDAO extends conexionBD implements InterfaceCRUD{
    
     private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    
    
    private String idCarta = "";
    private String idProducto = "";
    
    
    
    
     private boolean operacion = false;
     
     public detalleCartaDAO(detalleCartaVO detCaVO) {
          super();
        try {
            conexion=this.obtenerConexion();
            puente = conexion.createStatement();
           
            
            idCarta = detCaVO.getIdCarta();
            idProducto = detCaVO.getIdProducto();
           
            
            
        } catch (Exception e) {
            System.out.println("ERROR! "+ e.toString());
        }
    }
     public static detalleCartaVO ConsultaDettC(String idCarta){
        detalleCartaVO detcaVO = null;
      
        
        try {
            conexionBD conexionBd = new conexionBD();
            Connection Conexion = conexionBd.obtenerConexion();
            Statement puente = Conexion.createStatement();
            ResultSet Mensajero = puente.executeQuery("CALL `SPCartas`("+idCarta+");");
            while (Mensajero.next()) {                
                detcaVO = new detalleCartaVO(idCarta, Mensajero.getString(2));
            }
            Mensajero.close();
            puente.close();
        } catch (Exception e) {
        }
        return detcaVO;
    }
     
      public ArrayList<detalleCartaVO> listarId (String idCarta){
     
        conexionBD conexionbd = new conexionBD();
        ArrayList<detalleCartaVO>listaProductos = new ArrayList<>();
         
        
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("CALL `SPCartas`("+idCarta+");");
            
            while (mensajero.next()) {
             idCarta = mensajero.getString(1);
             idProducto = mensajero.getString(2);
               
                
                
                detalleCartaVO proVO = new detalleCartaVO(idCarta, idProducto);
                
               listaProductos.add(proVO);
                
            }
        } catch (Exception e) {
            
            System.out.println("¡Error!"+ e.toString());
        }
        return listaProductos;
    
    }

    @Override
    public boolean AgregarRegistro() {
          try {
            puente.executeUpdate("CALL `spRegistrarDetalleCarta`('"+idCarta+"','"+idProducto+"');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! "+ e.toString());
        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean ConsultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EliminarRegistro() {
         try {
            puente.executeUpdate("CALL `spEliminarProDet`('"+idCarta+"','"+idProducto+"');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! "+ e.toString());
        }
        return operacion;
    }
    
    
}
