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
import modeloVO.cartaVO;
import util.InterfaceCRUD;
import util.conexionBD;

/**
 *
 * @author Nata
 */
public class cartaDAO extends conexionBD implements InterfaceCRUD{
    
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    
    
    private String idCarta = "";
    private String diaCarta = "";
    private String count;
    
     private boolean operacion = false;

    public cartaDAO(cartaVO cartaVo) {
          super();
        try {
            conexion=this.obtenerConexion();
            puente = conexion.createStatement();
            
            idCarta = cartaVo.getIdCarta();
            diaCarta = cartaVo.getDiaCarta();
            
        } catch (Exception e) {
            System.out.println("ERROR! "+ e.toString());
        }
    }
    public ArrayList<cartaVO>listar(){
        conexionBD conexionBd = new conexionBD();
        ArrayList<cartaVO>listacarta = new ArrayList<>();
        
        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select * from carta");
            
            while (mensajero.next()) {

                idCarta = mensajero.getString(1);
                diaCarta = mensajero.getString(2);
                
                cartaVO carVo = new cartaVO(idCarta, diaCarta);
                
                listacarta.add(carVo);
                
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listacarta;
    }
    
    public static cartaVO ConsultaC(String idCarta){
        cartaVO caVO = null;
        
        try {
            conexionBD conexionBd = new conexionBD();
            Connection Conexion = conexionBd.obtenerConexion();
            Statement puente = Conexion.createStatement();
            ResultSet Mensajero = puente.executeQuery("CALL `spConsultaEcarta`('"+idCarta+"');");
            while (Mensajero.next()) {                
                caVO = new cartaVO(idCarta, Mensajero.getString(2));
            }
            Mensajero.close();
            puente.close();
        } catch (Exception e) {
        }
        return caVO;
    }
     
     

    @Override
    public boolean AgregarRegistro() {
        try {
            puente.executeUpdate("CALL `spRegistrarCarta`('"+ idCarta + "','"+diaCarta+"');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! "+ e.toString());
        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("CALL `spActualizarCarta` ('"+ idCarta + "','" + diaCarta +"')");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! "+ e.toString());
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
    
    public ArrayList<cartaVO> listarc() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<cartaVO> listarc = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select COUNT(*) from carta");

            while (mensajero.next()) {

                count = mensajero.getString(1);
                cartaVO pediVO = new cartaVO(count);

                listarc.add(pediVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listarc;
    }
    public cartaDAO() {
    }
}
