/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.UsuarioDAO;
import modeloVO.UsuarioVO;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(urlPatterns = {"/envioCorreo"})
public class envioCorreo extends HttpServlet {

    private String host, puerto, usuario, clave;
    
    
   
    public void init() {
        ServletContext contexto = getServletContext();

        host = contexto.getInitParameter("host");
        puerto = contexto.getInitParameter("puerto");
        usuario = contexto.getInitParameter("usuario");
        clave = contexto.getInitParameter("clave");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String receptor = request.getParameter("receptor");
        String asunto = "Asunto";
        String contenido = request.getParameter("contenido");
        
        String resultado = "";
        
        try {
            propiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
            resultado = "Mensaje enviado";
        } catch (Exception e) {
            resultado = "Error al enviar el mensaje! =" + e.toString();
        }finally{
            request.setAttribute("respuesta", resultado);
            getServletContext().getRequestDispatcher("/ValCodigo.jsp").forward(request, response);
        }
    }

}
