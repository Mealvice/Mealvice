/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.UsuarioDAO;
import modeloVO.UsuarioVO;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "usuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
//        if (request.getAttribute("seOut").equals("afuera")) {
//            response.sendRedirect("index.jsp");
//        }
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String identificacionUsu = request.getParameter("txtId");
        String nombreUsu = request.getParameter("txtnombre");
        String emailUsu = request.getParameter("txtemail");
        String direccionUsu = request.getParameter("txtdireccion");
        String telefonoUsu = request.getParameter("txttelefono");
        String claveUsu = request.getParameter("txtclave");
        String claveUsuReg = String.valueOf(Math.floor(Math.random()*200+1));
        String rolId = request.getParameter("txtrol");
        
        

        UsuarioVO usuVO = new UsuarioVO(identificacionUsu, nombreUsu, emailUsu, direccionUsu, telefonoUsu, claveUsu, rolId);
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
        
        UsuarioVO usuVOReg = new UsuarioVO(identificacionUsu, nombreUsu, emailUsu, direccionUsu, telefonoUsu, claveUsuReg, rolId);
        UsuarioDAO usuDAOReg = new UsuarioDAO(usuVOReg);
        
        UsuarioVO usuVORecCO = new UsuarioVO(emailUsu, claveUsuReg);
        UsuarioDAO usuDAORecCO = new UsuarioDAO(usuVORecCO);
        
        

        switch (opcion) {
            case 1: //Registrar 
                
                if (usuDAOReg.AgregarRegistro()) {
                    request.setAttribute("correo", emailUsu);
                      request.setAttribute("id", identificacionUsu);
                    request.setAttribute("clave", claveUsuReg);
                    request.setAttribute("opcion", opcion);
                    request.getRequestDispatcher("envioCorreo2").forward(request, response);
                    
                String enviarc = String.valueOf(request.getAttribute("enviarc"));
                }   
                else {
                    request.setAttribute("MensajeErrorR", "El usuario NO fue registrado correctamente");
                    request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);

                }

                break;
            case 2: //Actualizar
                if (usuDAO.ActualizarRegistro()) {
                    request.setAttribute("MensajeExitoA", "El usuario fue actualiado correctamente");
                     request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);

                } else {
                    request.setAttribute("MensajeErrorA", "El usuario NO fue actualiado correctamente");
                    request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);

                }
                request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
                break;
                
            case 8: //Recuperar Contraseña
                
                 claveUsu = String.valueOf(Math.floor(Math.random()*6+1));
                 
                if (usuDAORecCO.ActualizarContraseña(emailUsu, claveUsu)){
                    request.setAttribute("correo", emailUsu);
                      request.setAttribute("id", identificacionUsu);
                    request.setAttribute("clave", claveUsu);
                    request.setAttribute("opcion", opcion);
                    request.getRequestDispatcher("envioCorreo2").forward(request, response);
                    
                    
                    
                String enviarc = String.valueOf(request.getAttribute("enviarc"));
                
                request.setAttribute("MensajeExitoCon", "El usuario NO fue registrado correctamente");
                    request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
                }   
                else {
                    request.setAttribute("MensajeErrorCon", "El usuario NO fue registrado correctamente");
                    request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);

                }

                break;
                 case 7: //Actualizar
                if (usuDAO.ActualizarRegistro()) {
                    request.setAttribute("MensajeExitoA", "El usuario fue actualiado correctamente");
                     request.getRequestDispatcher("PerfilUsuario.jsp").forward(request, response);

                } else {
                    request.setAttribute("MensajeErrorA", "El usuario NO fue actualiado correctamente");
                    request.getRequestDispatcher("PerfilUsuario.jsp").forward(request, response);

                }
                request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
                break;
            case 3: //Consultar
                if (usuDAO.ConsultarRegistro()) {
                    request.setAttribute("MensajeExitoC", "El pedido fue consultado correctamente");

                } else {
                    request.setAttribute("MensajeErrorC", "El pedido NO fue consultado correctamente");

                }
                request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
                break;
            case 4: //Eliminar
                if (usuDAO.EliminarRegistro()) {
                    request.setAttribute("MensajeExito", "El usuario fue eliminiado correctamente");

                } else {
                    request.setAttribute("MensajeError", "El usuario NO fue eliminado correctamente");

                }
                request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);
                break;

            case 5:

                UsuarioVO UsuarioVo = UsuarioDAO.consultarPorIde(request.getParameter("id"));
                if (UsuarioVo != null) {

                    request.setAttribute("voLleno", UsuarioVo);
                    request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);

                } else {
                    request.setAttribute("MensajeError", "El usuario NO fue eliminado correctamente");
                    request.getRequestDispatcher("HomeUsuarios.jsp").forward(request, response);

                }

                break;
            case 6: //Validar
                
                UsuarioVO UsuariosDes = usuDAO.desencriptar(emailUsu);
                request.setAttribute("voLleno", UsuariosDes);
                if (usuDAO.ValidarUsuario(emailUsu, claveUsu)) {
                    UsuarioVO Usuarios = usuDAO.validarSesion(emailUsu);
                    if (Usuarios != null) {
                        request.setAttribute("voLleno", Usuarios);
                        UsuarioVO usuarVO = (UsuarioVO) request.getAttribute("voLleno");
                        if (usuarVO != null) {
                            HttpSession sesion2 = request.getSession(true);
                            UsuarioVO usuarioVO = new UsuarioVO();
                            sesion2.setAttribute("usuario", usuarVO);
                            if (usuarVO.getRolId().equals("1")) {
                                request.getRequestDispatcher("MenuPrincipal.jsp").forward(request, response);
                            } else if (usuarVO.getRolId().equals("2")) {
                                request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);
                            } else if (usuarVO.getRolId().equals("3")) {
                                request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);
                            } else if (usuarVO.getRolId().equals("4")) {
                                request.getRequestDispatcher("consMesa.jsp").forward(request, response);
                            }

                        }
                    }
                } else {
                    request.setAttribute("MensajeError", "Usuario y/o contraseña incorrectos");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
                    out.println("<script>alert('El usuario y/o la clave son incorrectos'); window.history.go(-1);</script>");
                }
                break;

            default:
        }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
