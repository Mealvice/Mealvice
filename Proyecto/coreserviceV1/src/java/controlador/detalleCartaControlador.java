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
import modeloDAO.detalleCartaDAO;
import modeloVO.detalleCartaVO;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "detalleCartaControlador", urlPatterns = {"/detalleCartaControlador"})
public class detalleCartaControlador extends HttpServlet {

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
        
        String opcion = request.getParameter("btn");
        String idCarta = request.getParameter("txtidCarta");
        String idproducto = request.getParameter("txtIdProducto");
        
        detalleCartaVO detCaVo = new detalleCartaVO(idCarta, idproducto);
        detalleCartaDAO detCaDao = new detalleCartaDAO(detCaVo);
        
        switch (opcion) {
            case "Registrar": //Registrar
                if (detCaDao.AgregarRegistro()) {
                    
                    //request.setAttribute("MensajeExitoR", "La carta fue registrada correctamente");
                    
                    
                        request.setAttribute("id", idCarta);
                        request.setAttribute("MensajeExitoR", "El producto fue añadido correctamente a la carta");
                        request.getRequestDispatcher("regProCarta.jsp").forward(request, response);


                } else {
                    request.setAttribute("MensajeErrorR", "La carta NO fue registrada correctamente");
                    request.getRequestDispatcher("regProCarta.jsp").forward(request, response);

                }
                
                break;
            case "Actualizar": //Actualizar
                if (detCaDao.ActualizarRegistro()) {
                    request.setAttribute("MensajeExitoA", "La carta fue actualizada correctamente");

                } else {
                    request.setAttribute("MensajeErrorA", "La carta NO fue actualizada correctamente");

                }
                request.getRequestDispatcher("consCarta.jsp").forward(request, response);
                break;
                
            case "Eliminar": //Eliminar
                if (detCaDao.EliminarRegistro()) {
                    
                    request.setAttribute("MensajeExitoE", "Se ha eliminado el producto");
                    request.setAttribute("id", idCarta);
                    request.getRequestDispatcher("regProCarta.jsp").forward(request, response);
                    

                } else {
                    request.setAttribute("MensajeErrorE", "La carta NO fue actualizada correctamente");

                }
                request.getRequestDispatcher("regProCarta.jsp").forward(request, response);
                break;
                 case "Consultar": //Eliminar
                
                    
                    
                    request.setAttribute("id", idCarta);
                    request.getRequestDispatcher("regProCarta.jsp").forward(request, response);
                    

                
                
                break;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
