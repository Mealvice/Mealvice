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
import modeloVO.detallePedidoVO;
import modeloVO.pedidoVO;
import util.InterfaceCRUD;
import util.conexionBD;

/**
 *
 * @author Lenovo
 */
public class detallePedidoDAO extends conexionBD implements InterfaceCRUD {

    //Atributos necesarias para la conexion
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String IdProducto;
    private String nombreProducto;
    private String IdPedido;
    private String Cantidad;
    private String Subtotal;
    private String Observacion;

    private boolean operacion = false;

    public detallePedidoDAO() {
    }
    
    public detallePedidoDAO(detallePedidoVO detpedVO) {
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            IdProducto = detpedVO.getIdProducto();
            nombreProducto = detpedVO.getNombreProducto();
            IdPedido = detpedVO.getIdPedido();
            Cantidad = detpedVO.getCantidad();
            Subtotal = detpedVO.getSubtotal();
            Observacion = detpedVO.getObservacion();

        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
    }

    public ArrayList<detallePedidoVO> listarc() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<detallePedidoVO> listarc = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select * from detallePedido");

            while (mensajero.next()) {

                
                IdProducto = mensajero.getString(1);
                IdPedido = mensajero.getString(2);
                Cantidad = mensajero.getString(3);
                Subtotal = mensajero.getString(4);
                Observacion = mensajero.getString(5);
                detallePedidoVO detPedVO = new detallePedidoVO( IdProducto, IdPedido, Cantidad, Subtotal, Observacion);

                listarc.add(detPedVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listarc;
    }
    
    
    public static detallePedidoVO ConsultaE(String idPedido) {
        detallePedidoVO detPedVO = null;

        try {
            conexionBD conexionBd = new conexionBD();
            Connection Conexion = conexionBd.obtenerConexion();
            Statement puente = Conexion.createStatement();
            ResultSet Mensajero = puente.executeQuery("CALL `spConsultaEdetalleP`('" + idPedido + "');");
            while (Mensajero.next()) {
                detPedVO = new detallePedidoVO(Mensajero.getString(1), Mensajero.getString(2), Mensajero.getString(3), Mensajero.getString(4), Mensajero.getString(5));
            }
            Mensajero.close();
            puente.close();
        } catch (Exception e) {
        }
        return detPedVO;
    }
    public ArrayList<detallePedidoVO> ConsultaEspe(String idPedido) {
        conexionBD conexionBd = new conexionBD();
        ArrayList<detallePedidoVO> ConsultaDE = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("CALL `spConsultaEpedido`('" + idPedido + "');");

            while (mensajero.next()) {

                Observacion = mensajero.getString(6);
                detallePedidoVO detPedVO = new detallePedidoVO(Observacion);

                ConsultaDE.add(detPedVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return ConsultaDE;
    }
    public ArrayList<detallePedidoVO> ConsultaDE(String idPedido) {
        conexionBD conexionBd = new conexionBD();
        ArrayList<detallePedidoVO> ConsultaDE = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("CALL `spConsultaEdetalleP`('" + idPedido + "');");

            while (mensajero.next()) {

                
                IdProducto = mensajero.getString(1);
                nombreProducto = mensajero.getString(2);
                IdPedido = mensajero.getString(3);
                Cantidad = mensajero.getString(4);
                detallePedidoVO detPedVO = new detallePedidoVO( IdProducto, nombreProducto, IdPedido, Cantidad);

                ConsultaDE.add(detPedVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return ConsultaDE;
    }
     public boolean Guardar() {
        try {
            puente.executeUpdate("CALL `spGuardar`('" + IdPedido + "' , '" + Observacion + "');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }
     public boolean DisminuirCantidad() {
        try {
            puente.executeUpdate("CALL `spDisminuirCantidad`('" + IdPedido + "','" + IdProducto + "')");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }
    

    @Override
    public boolean AgregarRegistro() {
        try {
            puente.executeUpdate("CALL `spRegistrarDetalleP`('" + IdProducto + "','" + IdPedido + "', '" + Cantidad + "')");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
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
            puente.executeUpdate("CALL `spEliminarProductoDet`('" + IdProducto + "','" + IdPedido + "')");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }
}
