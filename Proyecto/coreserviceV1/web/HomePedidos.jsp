<%-- 
    Document   : pedidos
    Created on : 20/08/2019, 08:17:21 AM
    Author     : APRENDIZ
--%>

<%@page import="modeloDAO.detallePedidoDAO"%>
<%@page import="modeloVO.detallePedidoVO"%>
<%@page import="modeloDAO.mesaDAO"%>
<%@page import="modeloVO.mesaVO"%>
<%@page import="modeloDAO.productoDAO"%>
<%@page import="modeloVO.productoVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.pedidoDAO"%>
<%@page import="modeloVO.pedidoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    HttpSession sesion2 = (HttpSession) request.getSession();
    UsuarioVO usuVO = (UsuarioVO) sesion2.getAttribute("usuario");

    if (usuVO != null) {

    } else {

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    if (sesion2.getAttribute("usuario") == null) {

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<html lang="en">

    <jsp:include page="templates/head.jsp" />

    <body class="" onLoad="">


        <div class="wrapper ">
            <jsp:include page="templates/menu.jsp" />
            <!-- End Navbar -->
            <!-- <div class="panel-header panel-header-sm">
      
      
      </div> -->
            <!--MESERO-->
            <div class="content">
                <div class="row"></div>
                <div class="row">
                    <div class="col-md-12">
                        <% if (request.getAttribute("MensajeErrorR") != null) {%>
                        <div class="alert alert-danger alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span>
                                <b> Error - </b> Se produjo un error</span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeExitoR") != null) {%>
                        <div class="alert alert-success alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-check-2"></i><br>
                            </button>
                            <span>
                                <b> Exito - </b> El pedido se registró corectamente</span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeErrorF") != null) {%>
                        <div class="alert alert-danger alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span>
                                <b> Error - </b> Se produjo un error</span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeExitoF") != null) {%>

                        <div class="alert alert-success alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-check-2"></i><br>
                            </button>
                            <span>
                                <b> Exito - </b> El pedido se finalizó corectamente</span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeExitoGuard") != null) {%>
                        <div class="alert alert-success alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-check-2"></i><br>
                            </button>
                            <span>
                                <b> Exito - </b> El pedido se guardó corectamente</span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeErrorP") != null) {%>
                        <div class="alert alert-danger alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span>
                                <b> Error - </b> Se produjo un error</span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeExitoP") != null) {%>

                        <div class="alert alert-success alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-check-2"></i><br>
                            </button>
                            <span>
                                <b> Exito - </b> El pedido se preparó corectamente</span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeErrorR") != null) {%>
                        <div class="alert alert-danger alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span>
                                <b> Error - </b> Se produjo un error</span>
                        </div>
                        <%}%>

                        <div class="col-md-12">
                            <% if (request.getAttribute("MensajeErrorE") != null) {%>
                            <div class="alert alert-danger alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span>
                                    <b> Error - </b> Se produjo un error</span>
                            </div>
                            <%}%>
                            <% if (request.getAttribute("MensajeExitoE") != null) {%>

                            <div class="alert alert-success alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-check-2"></i><br>
                                </button>
                                <span>
                                    <b> Exito - </b> El pedido se entregó corectamente</span>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="card card-user">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-header">
                                <h5 class="card-title">Pedidos</h5>


                                <div class="card-body">
                                    <div class="row">

                                    </div>
                                    <%if (usuVO.getRolId().equals("3")) {%>
                                    <button type="button" class="btn" data-toggle="modal" data-target="#ModalAct"><i class="nc-icon nc-simple-add fa-1x"></i>Nuevo Pedido</button> 
                                    <%}%>

                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered" id="example">
                                            <thead class=" text-primary">
                                            <th>Número del pedido</th>
                                            <th>Estado del pedido</th>
                                            <th>Mesero</th>
                                            <th>Número de la mesa</th
                                            <%if (usuVO.getRolId().equals("2")) {
                                                %>
                                            <th>Productos</th>
                                                <%}%>
                                            
                                                <%if (usuVO.getRolId().equals("3")|| usuVO.getRolId().equals("1")) {
                                                %>
                                            <th class="text-right">Acciones</th>
                                                <%}%>

                                            </thead>
                                            <tbody id="tablaPed">
                                                <%
                                                    pedidoVO pedidosVO = new pedidoVO();
                                                    pedidoDAO pedidDAO = new pedidoDAO();
                                                    ArrayList<pedidoVO> ListarPedidos = pedidDAO.listar();
                                                    if (ListarPedidos.size() <= 0) {%>
                                                <%} else {
                                                    for (int i = 0; i < ListarPedidos.size(); i++) {
                                                        pedidosVO = ListarPedidos.get(i);
                                                %>
                                                <tr>
                                            <form method="post"action="Pedido">
                                                <td><input type="text" class="form-control" name="txtidPedido" value="<%= pedidosVO.getIdPedido()%>" readonly/></td>

                                                <%if (pedidosVO.getIdUsuario().equals("Espera")) {%>
                                                <td><div class="progress"><div class="progress-bar-striped bg-info" role="progressbar" style="width: 20%; color: black;" aria-valuemin="0" aria-valuemax="100"><%=pedidosVO.getIdUsuario()%></div></div></td>
                                                        <%}%>
                                                        <%if (pedidosVO.getIdUsuario().equals("Preparando")) {%>
                                                <td><div class="progress"><div class="progress-bar-striped bg-warning" role="progressbar" style="width: 50%; color: black;" aria-valuemin="0" aria-valuemax="100">50% - <%=pedidosVO.getIdUsuario()%></div></div></td>
                                                <%}%>
                                                <td><%= pedidosVO.getIdMesa()%></td>
                                                <td ><%= pedidosVO.getEstadoPedido()%></td>
                                                <%if (usuVO.getRolId().equals("2")) {
                                                %>
                                                <td><button type="submit" class=" btn" name="boton" value="ConsultaP" title="Ver Productos">Ver Productos</button></td>
                                                <%}%>
                                                <%if (usuVO.getRolId().equals("2")) {%>
                                                <td class="text-right">
                                                    <button type="submit" class=" btn" name="boton" value="Eliminar">Entregar</button>
                                                    <button type="submit" class=" btn" name="boton" value="Preparar">Preparar</button>
                                                </td>
                                                <%}%>
                                                <%if (usuVO.getRolId().equals("3")) {%>
                                                <td class="text-right">
                                                    <button type="submit" class=" btn" name="boton" value="ConsultaP" title="Actualizar pedido"><i class="nc-icon nc-ruler-pencil"></i></button>
                                                </td>
                                                <%}%>

                                            </form>

                                            </tr>
                                            <div class="modal fade" id="ModalProductos<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Productos del pedido #<%= pedidosVO.getIdPedido()%></h5><br>      
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-md-5 pr-1">
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <p>Pollo 2000 Plato</p><br>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button class="btn" data-dismiss="modal">Cerrar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}
                                                }%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <%if (usuVO.getRolId().equals("1") || usuVO.getRolId().equals("3")) {%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-header">
                                            <h5 class="card-title">Pedidos Finalizados</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered" id="example1">
                                                    <thead class=" text-primary">
                                                    <th>Número del pedido</th>
                                                    <th>Estado del pedido</th>
                                                    <th>Número de la mesa</th>
                                                    <th>Mesero</th>

                                                    <th> </th>


                                                    </thead>
                                                    <tbody id="tablaPed">
                                                        <%
                                                            pedidoVO pedVO = new pedidoVO();
                                                            pedidoDAO pedDAO = new pedidoDAO();
                                                            ArrayList<pedidoVO> ListaPedidos = pedDAO.ListarFinalizado();
                                                            if (ListaPedidos.size() <= 0) {%>
                                                        <%} else {
                                                            for (int i = 0; i < ListaPedidos.size(); i++) {
                                                                pedVO = ListaPedidos.get(i);
                                                        %>
                                                        <tr>
                                                    <form name="form1" action="Pdf.jsp" >
                                                        <td> <input type="number" class="form-control" name ="txtparametro" readonly value="<%= pedVO.getIdPedido()%>"/></td>
                                                        <td><div class="progress"><div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuemin="0" aria-valuemax="100">100% - <%=pedVO.getIdUsuario()%></div></div></td>
                                                        <td><%= pedVO.getIdMesa()%></td>
                                                        <td><%= pedVO.getEstadoPedido()%></td>

                                                        <td><button type="submit" class=" btn" name="boton" value="Genera PDF" title="Generar Reporte"><i class="nc-icon nc-paper"></i></button></td>


                                                    </form>

                                                    </tr>
                                                    <%}
                                                        }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>


                                    </div>
                                    <%}%>
                                    <%if (usuVO.getRolId().equals("2")) {%>

                                    <div class="col-md-12">
                                        <div class="card-header">
                                            <h5 class="card-title">Pedidos Entregados</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered" id="example2">
                                                    <thead class=" text-primary">
                                                    <th>Número del pedido</th>
                                                    <th>Estado del pedido</th>
                                                    <th>Número de la mesa</th>
                                                    <th>Mesero</th>
                                                    </thead>
                                                    <tbody id="tablaPed">
                                                        <%
                                                            pedidoVO pediVOE = new pedidoVO();
                                                            pedidoDAO pediDAOE = new pedidoDAO();
                                                            ArrayList<pedidoVO> ListarPedidosE = pediDAOE.listarE();
                                                            if (ListarPedidosE.size() <= 0) {%>
                                                        <%} else {
                                                            for (int i = 0; i < ListarPedidosE.size(); i++) {
                                                                pediVOE = ListarPedidosE.get(i);
                                                        %>
                                                        <tr>
                                                    <form method="post"action="Pedido">
                                                        <td><input type="text" class="form-control" name="txtidPedido" value="<%= pediVOE.getIdPedido()%>" readonly/></td>
                                                            <%if (pediVOE.getIdUsuario().equals("Entregado")) {%>
                                                        <td><div class="progress"><div class="progress-bar-striped bg-warning" role="progressbar" style="width: 85%; color: black;" aria-valuemin="0" aria-valuemax="100">85% - <%=pediVOE.getIdUsuario()%></div></div></td>
                                                        <%}%>
                                                        <td><%= pediVOE.getIdMesa()%></td>
                                                        <td ><%= pediVOE.getEstadoPedido()%></td>
                                                        <td class="text-right">
                                                            <button type="submit" class=" btn" name="boton" value="Finalizar" title="Finalizar Pedido">Finalizar Pedido</button>

                                                        </td>
                                                    </form>
                                                    </tr>
                                                    <%}
                                                        }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>


                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <form method="post" action="Pedido">
                                <div class="modal fade" id="ModalAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Registrar un Nuevo Pedido</h5><br>      
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">                                                
                                                    <div class="col-md-5 pr-1">
                                                        <div class="form-group">
                                                            <label>N° Pedido</label>
                                                            <%
                                                                int count;
                                                                int resultado;
                                                                pedidoVO pediVO = new pedidoVO();
                                                                pedidoDAO pediDAO = new pedidoDAO();
                                                                ArrayList<pedidoVO> listarc = pediDAO.listarc();
                                                                for (int i = 0; i < listarc.size(); i++) {
                                                                    pediVO = listarc.get(i);
                                                                    String resul = String.valueOf(pediVO.getCount());
                                                                    count = Integer.parseInt(resul);
                                                                    resultado = count + 1;
                                                            %>
                                                            <input type="number" class="form-control"  placeholder="N° Pedido" value="<%=resultado%>" name="txtidPedido" readonly>
                                                            <%}%>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5 pr-1">
                                                        <div class="form-group">
                                                            <label>Identificación del mesero</label>
                                                            <input type="number" class="form-control"  placeholder="Mesero" value="<%=usuVO.getIdentificacionUsu()%>" name="txtidUsuario" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5 pr-1">
                                                        <div class="form-group">
                                                            <label>Estado del pedido</label>
                                                            <input type="number" class="form-control" name="txtEstado" placeholder="Espera" value="Espera"  readonly>
                                                            <small>El estado del pedido, inicialmente estará en Espera</small>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5 pr-1">
                                                        <div class="form-group">
                                                            <label>Número de la mesa</label>

                                                            <%
                                                                mesaVO mesVO = new mesaVO();
                                                                mesaDAO mesDAO = new mesaDAO();
                                                                ArrayList<mesaVO> listarMesaD = mesDAO.listarD();
                                                                if (listarMesaD.size() <= 0) {%>
                                                            <div class="alert alert-warning alert-dismissible fade show">
                                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                                    <i class="nc-icon nc-simple-remove"></i><br>
                                                                </button>
                                                                <span>
                                                                    <b> Advertencia - </b> No hay mesas disponibles</span>
                                                            </div>
                                                            <%} else {%><select class="form-control"  name="txtidMesa"><%
                                                                for (int i = 0; i < listarMesaD.size(); i++) {
                                                                    mesVO = listarMesaD.get(i);
                                                                %>
                                                                <option  value="<%=mesVO.getIdMesa()%>">No Mesa: <%=mesVO.getIdMesa()%>, capacidad: <%=mesVO.getCapacidadMesa()%></option>
                                                                <%}
                                                                    }%>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-success" name="boton"  value="Registrar">Registrar</button> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <jsp:include page="templates/footer.jsp" />
                    </div>
                </div>
                <jsp:include page="templates/scripts.jsp" />
                </body>

                </html>