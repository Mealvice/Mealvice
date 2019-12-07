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
import javax.servlet.http.HttpSession;
import modeloVO.pedidoVO;
import util.InterfaceCRUD;
import util.conexionBD;

/**
 *
 * @author Nata
 */
public class pedidoDAO extends conexionBD implements InterfaceCRUD {

    //Atributos necesarias para la conexion
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String idPedido;
    private String idUsuario;
    private String idMesa;
    private String EstadoPedido;
    private String count;

    private boolean operacion = false;

    public pedidoDAO(pedidoVO pedVO) {

        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            idPedido = pedVO.getIdPedido();
            EstadoPedido = pedVO.getEstadoPedido();
            idMesa = pedVO.getIdMesa();
            idUsuario = pedVO.getIdUsuario();
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
    }

    public ArrayList<pedidoVO> listar() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<pedidoVO> ListaPedidos = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select * from pedido where estadoPedido = 'Preparando' or estadoPedido = 'Espera'");

            while (mensajero.next()) {

                idPedido = mensajero.getString(1);
                EstadoPedido = mensajero.getString(2);
                idMesa = mensajero.getString(3);
                idUsuario = mensajero.getString(4);
                pedidoVO pediVO = new pedidoVO(idPedido, EstadoPedido, idMesa, idUsuario);

                ListaPedidos.add(pediVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return ListaPedidos;
    }

    public ArrayList<pedidoVO> listarE() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<pedidoVO> listaPedidos = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select * from pedido where estadoPedido = 'Entregado'");

            while (mensajero.next()) {

                idPedido = mensajero.getString(1);
                EstadoPedido = mensajero.getString(2);
                idMesa = mensajero.getString(3);
                idUsuario = mensajero.getString(4);
                pedidoVO pediVO = new pedidoVO(idPedido, EstadoPedido, idMesa, idUsuario);

                listaPedidos.add(pediVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listaPedidos;
    }

    public ArrayList<pedidoVO> ListarFinalizado() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<pedidoVO> listaPedidosF = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select * from pedido where estadoPedido = 'Finalizado'");

            while (mensajero.next()) {

                idPedido = mensajero.getString(1);
                EstadoPedido = mensajero.getString(2);
                idMesa = mensajero.getString(3);
                idUsuario = mensajero.getString(4);
                pedidoVO pediVO = new pedidoVO(idPedido, EstadoPedido, idMesa, idUsuario);

                listaPedidosF.add(pediVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listaPedidosF;
    }

    public ArrayList<pedidoVO> listarc() {
        conexionBD conexionBd = new conexionBD();
        ArrayList<pedidoVO> listarc = new ArrayList<>();

        try {
            puente = conexionBd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("Select COUNT(*) from pedido");

            while (mensajero.next()) {

                count = mensajero.getString(1);
                pedidoVO pediVO = new pedidoVO(count);

                listarc.add(pediVO);

            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listarc;
    }

    public static pedidoVO ConsultaE(String idPedido) {
        pedidoVO pedVO = null;

        try {
            conexionBD conexionBd = new conexionBD();
            Connection Conexion = conexionBd.obtenerConexion();
            Statement puente = Conexion.createStatement();
            ResultSet Mensajero = puente.executeQuery("CALL `spConsultaEpedido`('" + idPedido + "');");
            while (Mensajero.next()) {
                pedVO = new pedidoVO(idPedido, Mensajero.getString(2), Mensajero.getString(3), Mensajero.getString(4));
            }
            Mensajero.close();
            puente.close();
        } catch (Exception e) {
        }
        return pedVO;
    }
    

    @Override
    public boolean AgregarRegistro() {
        try {
            puente.executeUpdate("CALL `sPRegistrarPedido`('" + idPedido + "','" + idUsuario + "', '" + idMesa + "')");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("CALL `spActualizarPedido` ('" + idPedido + "','" + idUsuario + "', '" + idMesa + "' , '" + EstadoPedido + "')");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }

    @Override
    public boolean ConsultarRegistro() {
        try {
            puente.executeUpdate("CALL `spConsultarPedidos`();");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }

    @Override
    public boolean EliminarRegistro() {
        try {
            puente.executeUpdate("CALL `spEntregarPedido`('" + idPedido + "');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }

    public boolean FinalizarPedido() {
        try {
            puente.executeUpdate("CALL `spFinalizarPedidos`('" + idPedido + "');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }
    public boolean PrepararPedido() {
        try {
            puente.executeUpdate("CALL `spPrepararPedido`('" + idPedido + "');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("ERROR! " + e.toString());
        }
        return operacion;
    }

    public pedidoDAO() {
    }
   

}
