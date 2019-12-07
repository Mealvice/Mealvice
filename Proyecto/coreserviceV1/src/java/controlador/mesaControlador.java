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
import modeloDAO.mesaDAO;
import modeloVO.mesaVO;

/**
 *
 * @author Nata
 */
@WebServlet(name = "mesaControlador", urlPatterns = {"/Mesa"})
public class mesaControlador extends HttpServlet {

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

        int opcion = Integer.parseInt(request.getParameter("btn"));

        String idMesa = request.getParameter("txtIdMesa");
        String capacidadMesa = request.getParameter("txtCapacidadMesa");
        String estadoMesa = request.getParameter("txtEstadoMesa");
        String descripcionMesa = request.getParameter("txtDescripcionMesa");

        mesaVO mesVO = new mesaVO(idMesa, capacidadMesa, descripcionMesa, estadoMesa);
        mesaDAO mesDAO = new mesaDAO(mesVO);

        switch (opcion) {

            case 1:// Agregar registro
                if (mesDAO.AgregarRegistro()) {

                    request.setAttribute("MensajeExitoR", "La mesa fue registrada correctamente");

                } else {
                    request.setAttribute("MensajeErrorR", "La mesa no fue registrada");
                }
                request.getRequestDispatcher("consMesa.jsp").forward(request, response);
                break;
            case 2: // Actualizar registro
                if (mesDAO.ActualizarRegistro()) {

                    request.setAttribute("MensajeExitoA", "La mesa fue actualizada correctamente");

                } else {
                    request.setAttribute("MensajeErrorA", "La mesa no fue actualizada correctamente");
                }
                request.getRequestDispatcher("consMesa.jsp").forward(request, response);

                break;
            case 3: // para deshabilitar
                if (mesDAO.EliminarRegistro()) {

                    request.setAttribute("MensajeExitoA", "La mesa fue deshabilitada correctamente");

                } else {
                    request.setAttribute("MensajeErrorA", "La mesa no fue deshabilitada");
                }
                request.getRequestDispatcher("consMesa.jsp").forward(request, response);

                break;
            
            case 5: // mesa vacia
                if (mesDAO.MesaVacia()) {

                    request.setAttribute("MensajeExitoA", "La mesa está vacia");

                } else {
                    request.setAttribute("MensajeErrorA", "La mesa no fue actualizada");
                }
                request.getRequestDispatcher("consMesa.jsp").forward(request, response);

                break;
            case 6: // mesa ocupada
                if (mesDAO.MesaOcupada()) {

                    request.setAttribute("MensajeExitoA", "La mesa está ocupada");

                } else {
                    request.setAttribute("MensajeErrorA", "La mesa no fue actualizada");
                }
                request.getRequestDispatcher("consMesa.jsp").forward(request, response);

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
