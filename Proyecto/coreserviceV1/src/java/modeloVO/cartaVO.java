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
public class cartaVO {
    private String idCarta;
    private String diaCarta;
    private String count;

    public cartaVO() {
    }

    public cartaVO(String idCarta, String diaCarta) {
        this.idCarta = idCarta;
        this.diaCarta = diaCarta;
    }

    public String getIdCarta() {
        return idCarta;
    }

    public void setIdCarta(String idCarta) {
        this.idCarta = idCarta;
    }

    public String getDiaCarta() {
        return diaCarta;
    }

    public void setDiaCarta(String diaCarta) {
        this.diaCarta = diaCarta;
    }
    
    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
    

    
    public cartaVO(String count) {
        this.count = count;
    }
    
    
}
