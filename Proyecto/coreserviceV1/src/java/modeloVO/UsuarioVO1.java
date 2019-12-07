/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author PC
 */
public class UsuarioVO1 {
    
    private String identificacionUsu ="";
    private String nombreUsu =""; 
    private String emailUsu ="";
    private String direccionUsu ="";
    private String telefonoUsu="";
    private String claveUsu ="";
    private String rolId ="";


    public UsuarioVO1(String identificacionUsu, String nombreUsu, String emailUsu, String direccionUsu, String telefonoUsu, String claveUsu, String rolId) {
        
        this.identificacionUsu = identificacionUsu;
        this.nombreUsu = nombreUsu;
        this.emailUsu = emailUsu;
        this.direccionUsu = direccionUsu;
        this.telefonoUsu = telefonoUsu;
        this.claveUsu = claveUsu;
        this.rolId = rolId;
    }

   

 
    
    public String getIdentificacionUsu() {
        return identificacionUsu;
    }

    public void setIdentificacionUsu(String identificacionUsu) {
        this.identificacionUsu = identificacionUsu;
    }

    public String getNombreUsu() {
        return nombreUsu;
    }

    public void setNombreUsu(String nombreUsu) {
        this.nombreUsu = nombreUsu;
    }

    public String getEmailUsu() {
        return emailUsu;
    }

    public void setEmailUsu(String emailUsu) {
        this.emailUsu = emailUsu;
    }

    public String getDireccionUsu() {
        return direccionUsu;
    }

    public void setDireccionUsu(String direccionUsu) {
        this.direccionUsu = direccionUsu;
    }
    
     public String getTelefonoUsu() {
        return telefonoUsu;
    }

    public void setTelefonoUsu(String telefonoUsu) {
        this.telefonoUsu = telefonoUsu;
    }

    public String getClaveUsu() {
        return claveUsu;
    }

    public void setClaveUsu(String claveUsu) {
        this.claveUsu = claveUsu;
    }

    public String getRolId() {
        return rolId;
    }

    public void setRolId(String rolUsu) {
        this.rolId = rolId;
    }

    public UsuarioVO1() {
        
    }

    public UsuarioVO1(String rolId) {
    }
    
           


    
    
    
    
}
