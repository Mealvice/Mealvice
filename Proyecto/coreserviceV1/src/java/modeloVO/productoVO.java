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
public class productoVO {
    private String idProducto;
    private String nombreProducto;
    private String precioProducto;
    private String tipoProducto;
    private String estadoProducto;
    private String count;


    public productoVO() {
    }

    public productoVO(String idProducto, String nombreProducto, String precioProducto, String tipoProducto, String estadoProducto) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.precioProducto = precioProducto;
        this.tipoProducto = tipoProducto;
        this.estadoProducto = estadoProducto;
    }
    
    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(String precio) {
        this.precioProducto = precio;
    }

    public String getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(String tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    public String getEstadoProducto() {
        return estadoProducto;
    }

    public void setEstadoProducto(String estadoProducto) {
        this.estadoProducto = estadoProducto;
    }
    
     public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
    

    
    public productoVO(String count) {
        this.count = count;
    }
    
   
    
    
}
