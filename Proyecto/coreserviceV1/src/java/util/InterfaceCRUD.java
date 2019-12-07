package util;

import modeloVO.mesaVO;

/**
 *
 * @author Rene
 */
public interface InterfaceCRUD {
    
    public abstract boolean AgregarRegistro();
    public abstract boolean ActualizarRegistro();
    public abstract boolean ConsultarRegistro();
    public abstract boolean EliminarRegistro();
}
