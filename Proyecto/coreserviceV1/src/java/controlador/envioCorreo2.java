
package controlador;
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
@WebServlet(urlPatterns = {"/envioCorreo2"})
public class envioCorreo2 extends HttpServlet {

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
        
        
        
         
                    
        String receptor = String.valueOf(request.getAttribute("correo"));            
        String contraseña = String.valueOf(request.getAttribute("clave")); 
        String identificacionUsu =  String.valueOf(request.getAttribute("id"));
        String asunto = ("Registro Exitoso en Mealvice!");
        String contenido = (""
                + "<h1>Bienvenido a <b style='color: #A32727'>Meal</b>vice!</h1><br> "
                + "<h4>Gracias por finalizar con éxito tu registro a <b style='color: #A32727'>Meal</b>vice!<br> "
                + "Estos son los principales datos de tu registro:<br>"
                + "<b style='color: #A32727'>Correo Electronico: </b>"+receptor+".<br>"
                + "<b style='color: #A32727'>Contraseña: </b>"+contraseña+".<br>"
                + "Ya eres un <b style='color: #A32727'>USUARIO REGISTRADO</b> en nuestro sistema, y desde"
                + "este momento puedes comenzar a hacer uso del mismo, desempeñando el rol que se te ha sido asignado.<h4>"
                + "<br><h2 style='color: #A32727'>INFORMACION IMPORTANTE</h2><BR>"
                + "<h4>Una vez recibas este corre, ingresa al sistema y realiza el cambio de tu contraseña."
                + "Esto lo hacemos con el fin de brindarte seguridad dentro y fuera de nuestro sistema.<br><br>"
                + "De igual manera, esperamos todo sea de completo agrado.<br><br>"
                + "Atentamente, <br>"
                + "El grupo de soporte de <b style='color: #A32727'>Meal</b>vice.</h4>");
        UsuarioVO usuVO = new UsuarioVO(identificacionUsu, "", "", "", "", "", "");
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
    
        
         
        try {
            propiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);  
        
           
            
            request.setAttribute("MensajeExitoR", "El usuario fue registrado correctamente");
            request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
            
        } catch (Exception e) {
            
           
        if(usuDAO.EliminarRegistro()) {
               
        request.setAttribute("MensajeErrorR", "Hay un problema con el correo, puede haber sido regustrado previamente o no existe");
        request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
                
        }
        else
        {
            request.setAttribute("MensajeErrorR", "Hay un problema con el correo, puede haber sido regustrado previamente o no existe");
        request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
                
        }
      
            
            
        }
    }

}
