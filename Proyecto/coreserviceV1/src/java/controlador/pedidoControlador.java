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
import modeloDAO.pedidoDAO;
import modeloVO.pedidoVO;

/**
 *
 * @author Nata
 */
@WebServlet(name = "pedidoControlador", urlPatterns = {"/Pedido"})
public class pedidoControlador extends HttpServlet {

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

        String opcion = request.getParameter("boton");
        String idPedido = request.getParameter("txtidPedido");
        String EstadoPedido = request.getParameter("txtEstado");
        String idMesa = request.getParameter("txtidMesa");
        String idUsuario = request.getParameter("txtidUsuario");
        String Observacion = request.getParameter("Observacion");

        pedidoVO pedVO = new pedidoVO(idPedido,idUsuario, idMesa , EstadoPedido);
        pedidoDAO pedDAO = new pedidoDAO(pedVO);

        switch (opcion) {
            case "Registrar": //Registrar
                if (pedDAO.AgregarRegistro()) {
                    request.setAttribute("idPedido", idPedido);
                    request.setAttribute("MensajeExitoR", "El pedido fue registrado correctamente");
                    request.getRequestDispatcher("PedidoRegistroP.jsp").forward(request, response);
                } else {
                    request.setAttribute("MensajeErrorR", "El pedido NO fue registrado correctamente");
                    request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);
                }
                break;
            case "Actualizar": //Actualizar
                if (pedDAO.ActualizarRegistro()) {
                    request.setAttribute("MensajeExitoA", "El pedido fue actualizado correctamente");

                } else {
                    request.setAttribute("MensajeErrorA", "El pedido NO fue actualizado correctamente");

                }
                request.getRequestDispatcher("pedidos.jsp").forward(request, response);
                break;
            case "Consultar": //Consultar
                if (pedDAO.ConsultarRegistro()) {
                    request.setAttribute("MensajeExitoC", "El pedido fue consultado correctamente");

                } else {
                    request.setAttribute("MensajeErrorC", "El pedido NO fue consultado correctamente");

                }
                request.getRequestDispatcher("pedidos.jsp").forward(request, response);
                break;
            case "ConsultaP":
                    pedidoVO PedidoVO = pedidoDAO.ConsultaE(idPedido);
                    if (PedidoVO != null) {
                         request.setAttribute("idPedido", idPedido);
                    request.getRequestDispatcher("PedidoRegistroP.jsp").forward(request, response);
                    } else {
                        request.setAttribute("MensajeErrorPC", "No se encontro");
                        request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);
                    }
                    break;
            case "Eliminar": //Eliminar
                if (pedDAO.EliminarRegistro()) {
                    request.setAttribute("MensajeExitoE", "El pedido fue entregado correctamente");

                } else {
                    request.setAttribute("MensajeErrorE", "El pedido NO fue entregado correctamente");

                }
                request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);
                break;
            case "Finalizar": //Eliminar
                if (pedDAO.FinalizarPedido()) {
                    request.setAttribute("MensajeExitoF", "El pedido fue Finalizado correctamente");

                } else {
                    request.setAttribute("MensajeErrorF", "El pedido NO fue Finalizado correctamente");

                }
                request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);
                break;
            case "Preparar": //Eliminar
                if (pedDAO.PrepararPedido()) {
                    request.setAttribute("MensajeExitoP", "El pedido fue preparado correctamente");

                } else {
                    request.setAttribute("MensajeErrorP", "El pedido NO fue preparado correctamente");

                }
                request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);
                break;
            case "Guardar": //Eliminar
                if (pedDAO.PrepararPedido()) {
                    request.setAttribute("MensajeExitoGuard", "El pedido fue guardado correctamente");
                    request.getRequestDispatcher("HomePedidos.jsp").forward(request, response);

                } else {
                    request.setAttribute("MensajeErrorGuard", "El pedido NO fue guardado correctamente");
                    request.getRequestDispatcher("PedidosRegistroP.jsp").forward(request, response);
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
