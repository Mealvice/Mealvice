/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author Lenovo
 */
public class detallePedidoVO {
    private String IdProducto;
    private String nombreProducto;
    private String IdPedido;
    private String Cantidad;
    private String Subtotal;
    private String Observacion;

    public detallePedidoVO( String IdProducto, String IdPedido, String Cantidad, String Subtotal, String Observacion) {
        
        this.IdProducto = IdProducto;
        this.IdPedido = IdPedido;
        this.Cantidad = Cantidad;
        this.Subtotal = Subtotal;
        this.Observacion = Observacion;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }
    
    public String getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(String IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getIdPedido() {
        return IdPedido;
    }

    public void setIdPedido(String IdPedido) {
        this.IdPedido = IdPedido;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(String Subtotal) {
        this.Subtotal = Subtotal;
    }

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }

    public detallePedidoVO(String Observacion) {
        this.Observacion = Observacion;
    }
    
    public detallePedidoVO() {
    }
    
    public detallePedidoVO(String IdProducto, String nombreProducto, String IdPedido, String Cantidad) {
        this.IdProducto = IdProducto;
        this.nombreProducto = nombreProducto;
        this.IdPedido = IdPedido;
        this.Cantidad = Cantidad;
    }
    
}
