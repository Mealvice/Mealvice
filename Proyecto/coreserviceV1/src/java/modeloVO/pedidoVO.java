/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author Nata
 */
public class pedidoVO {
    private String idPedido;
    private String EstadoPedido;
    private String idMesa;
    private String idUsuario;
    private String observacion;
    private String count;

    public pedidoVO(String idPedido, String idUsuario, String idMesa,  String EstadoPedido) {
        this.idPedido = idPedido;
        this.EstadoPedido = EstadoPedido;
        this.idMesa = idMesa;
        this.idUsuario = idUsuario;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
    
    
    public String getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(String idPedido) {
        this.idPedido = idPedido;
    }

    public String getEstadoPedido() {
        return EstadoPedido;
    }

    public void setEstadoPedido(String EstadoPedido) {
        this.EstadoPedido = EstadoPedido;
    }

    public String getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(String idMesa) {
        this.idMesa = idMesa;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }
    

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
    

    public pedidoVO() {
    }
    public pedidoVO(String count) {
        this.count = count;
    }
    
}
