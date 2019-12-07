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
import modeloDAO.productoDAO;
import modeloVO.productoVO;

/**
 *
 * @author Nata
 */
@WebServlet(name = "productoControlador", urlPatterns = {"/Producto"})
public class productoControlador extends HttpServlet {
    
      
    
    int id;

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
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        
        String idProducto = request.getParameter("txtNoPro");
        String nombreProducto = request.getParameter("txtNombre");
        String precioProducto = request.getParameter("txtPrePro");
        String tipoProducto = request.getParameter("txtTiProducto");
        String estadoProducto = request.getParameter("txtEstPro");
        
       
        
        productoVO proVO = new productoVO(idProducto, nombreProducto, precioProducto, tipoProducto, estadoProducto);
        productoDAO proDAO = new productoDAO(proVO);
        
        switch(opcion){
            
            case 1:// Agregar registro
                if (proDAO.AgregarRegistro()) {
                    
                    request.setAttribute("MensajeExitoR", "El producto fue registrado correctamente");
                    
                }else{
                    request.setAttribute("MensajeErrorR", "El producto no fue registrado correctamente");
                }
                request.getRequestDispatcher("consProducto.jsp").forward(request, response);
                break;
            case 2: // Actualizar registro
                 if (proDAO.ActualizarRegistro()) {
                    
                    request.setAttribute("MensajeExitoA", "El producto fue actualizado correctamente");
                    
                }else{
                    request.setAttribute("MensajeErrorA", "El producto no fue actualizado correctamente");
                }
                request.getRequestDispatcher("consProducto.jsp").forward(request, response);
                
                break;
                 
                    case 5: // para actualixar
                     productoVO proCVo = productoDAO.consultarId(request.getParameter("id"));
                    if (proCVo != null) {
                        request.setAttribute("voLlenoC", proCVo);
                        request.getRequestDispatcher("ActualizarPro.jsp").forward(request, response);
                    } else {
                        request.setAttribute("MensajeError", "No se encontro");
                        request.getRequestDispatcher("ActualizarPro.jsp").forward(request, response);
                    }
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
