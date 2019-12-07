/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author APRENDIZ
 */
public class detalleCartaVO {
    
    private String idCarta;
    private String idProducto;

    public detalleCartaVO() {
    }

    public detalleCartaVO(String idCarta, String idProducto) {
        this.idCarta = idCarta;
        this.idProducto = idProducto;
    }

    public String getIdCarta() {
        return idCarta;
    }

    public void setIdCarta(String idCarta) {
        this.idCarta = idCarta;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }
    
    
    
}
