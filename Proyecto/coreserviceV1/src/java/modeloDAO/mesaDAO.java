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
import modeloVO.mesaVO;
import util.conexionBD;
import util.InterfaceCRUD;



public class mesaDAO extends conexionBD implements InterfaceCRUD{
    
    //Conexion
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    
    //variables que se van a manejar
    
    private String idMesa = "";
    private String capacidadMesa = "";
    private String estadoMesa = "";
    private String descripcionMesa = "";
    private String count = "";
    
    
    private boolean operacion = false;
    
    //metodo de la clase
    public mesaDAO(){};
    
    public mesaDAO(mesaVO mesVO){
        
        super();
        
        try {
            
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
           
            idMesa = mesVO.getIdMesa();
            capacidadMesa = mesVO.getCapacidadMesa();
            estadoMesa = mesVO.getEstadoMesa();
            descripcionMesa = mesVO.getDescripcionMesa();
            
           
            
        } catch (Exception e) {
            
            System.out.println("¡Error!"+ e.toString());
        }
    }
    public ArrayList<mesaVO> CountMesa() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<mesaVO> ListaMesa = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select COUNT(*) from mesa");

            while (mensajero.next()) {

                count = mensajero.getString(1);
                mesaVO mesaCountVO = new mesaVO(count);

                ListaMesa.add(mesaCountVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return ListaMesa;
    }

    @Override
    public boolean AgregarRegistro() {
        try {
            
             puente.executeUpdate(" call InsertarMesa('"+idMesa+"','"+capacidadMesa+"', '"+descripcionMesa+"')");
             operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
         try {
            
             puente.executeUpdate("CALL ActualizarMesa('"+ idMesa + "','" + capacidadMesa +"', '"+ estadoMesa + "' , '" + descripcionMesa + "')");
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
         try {
            
             puente.executeUpdate("CALL EliminarMesa('"+ idMesa + "')");
             operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return operacion;
    }
    
    
    public boolean MesaVacia() {
         try {
            
             puente.executeUpdate("CALL VaciaMesa('"+ idMesa + "')");
             operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return operacion;
    }
    
    public boolean MesaOcupada() {
         try {
            
             puente.executeUpdate("CALL OcupadaMesa('"+ idMesa + "')");
             operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return operacion;
    }
    
    public ArrayList<mesaVO> listar (){
     
        conexionBD conexionbd = new conexionBD();
        ArrayList<mesaVO>listarMesa= new ArrayList<>();
        
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from mesa");
            
            while (mensajero.next()) {
                
                idMesa = mensajero.getString(1);
                capacidadMesa = mensajero.getString(2);
                estadoMesa = mensajero.getString(3);
                descripcionMesa = mensajero.getString(4);
                
                
                mesaVO mesVO = new mesaVO(idMesa, capacidadMesa, estadoMesa, descripcionMesa);
                
               listarMesa.add(mesVO);
                
            }
        } catch (Exception e) {
            
            System.out.println("¡Error!"+ e.toString());
        }
        return listarMesa;
    
    }

    public mesaVO list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<mesaVO> listarId (String idMesa){
     
        conexionBD conexionbd = new conexionBD();
        ArrayList<mesaVO>listaMesas = new ArrayList<>();
        
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from mesa where idMesa='"+idMesa+"'");
            
            while (mensajero.next()) {
                idMesa = mensajero.getString(1);
                capacidadMesa = mensajero.getString(2);
                estadoMesa = mensajero.getString(3);
                descripcionMesa = mensajero.getString(4);
                
                mesaVO mesVO = new mesaVO(idMesa, capacidadMesa, estadoMesa, descripcionMesa);
                
               listaMesas.add(mesVO);
                
            }
        } catch (Exception e) {
            
            System.out.println("¡Error!"+ e.toString());
        }
        return listaMesas;
    
    }
      public static mesaVO consultarId(String idMesa){
    
        mesaVO mesVO = null;
        
        try {
            
            conexionBD conexionbd = new conexionBD();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("select * from mesa where idMesa='"+idMesa+"'");
            while (mensajero.next()) {
                
                mesVO = new mesaVO(idMesa,mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
                
            }
            mensajero.close();
            puente.close();
            
        } catch (Exception e) {
            System.out.println("¡Error!"+ e.toString());
        }
        return mesVO;
    
    }
       public ArrayList<mesaVO> listarD (){
     
        conexionBD conexionbd = new conexionBD();
        ArrayList<mesaVO>listarMesaD= new ArrayList<>();
        
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from mesa where estadoMesa = 'Sin Pedido'");
            
            while (mensajero.next()) {
                
                idMesa = mensajero.getString(1);
                capacidadMesa = mensajero.getString(2);
                descripcionMesa = mensajero.getString(3);
                estadoMesa = mensajero.getString(4);
                
               
                
                mesaVO mesVO = new mesaVO(idMesa, capacidadMesa, descripcionMesa, estadoMesa);
                
               listarMesaD.add(mesVO);
                
            }
        } catch (Exception e) {
            
            System.out.println("¡ERROR!"+ e.toString());
        }
        return listarMesaD;
    
    }
}
