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
public class mesaVO {
    private String idMesa;
    private String capacidadMesa;
    private String estadoMesa;
    private String descripcionMesa;
    private String count;
    
    public mesaVO() {
    }

    public mesaVO(String idMesa, String capacidadMesa, String estadoMesa, String descripcionMesa) {
        this.idMesa = idMesa;
        this.capacidadMesa = capacidadMesa;
        this.estadoMesa = estadoMesa;
        this.descripcionMesa = descripcionMesa;
    }

    public String getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(String idMesa) {
        this.idMesa = idMesa;
    }

    public String getCapacidadMesa() {
        return capacidadMesa;
    }

    public void setCapacidadMesa(String capacidadMesa) {
        this.capacidadMesa = capacidadMesa;
    }

    public String getEstadoMesa() {
        return estadoMesa;
    }

    public void setEstadoMesa(String estadoMesa) {
        this.estadoMesa = estadoMesa;
    }

    public String getDescripcionMesa() {
        return descripcionMesa;
    }

    public void setDescripcionMesa(String descripcionMesa) {
        this.descripcionMesa = descripcionMesa;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public mesaVO(String count) {
        this.count = count;
    }
    
    
    
   
    
    
}
