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
%>
<html lang="en">

    <jsp:include page="templates/head.jsp" />

    <body class="">


        <div class="wrapper ">
            <jsp:include page="templates/menu.jsp" />
            <!-- End Navbar -->
            <!-- <div class="panel-header panel-header-sm">
      
      
      </div> -->
            <!--MESERO-->
            <div class="content">
                <div class="card card-user">
                    <div class="row">
                        <div class="col-md-12">

                            <!--Mensaje Quitar -->
                            <% if (request.getAttribute("SeQuito") != null) {%>
                            <div class="alert alert-success alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-check-2"></i><br>
                                </button>
                                <span>
                                    <b> <i class="nc-icon nc-cart-simple" style="color: #fff;"><i class="nc-icon nc-simple-remove"></i></i> </b>Se quitó el producto del carrito.</span>
                            </div>
                            <%}%>
                            <% if (request.getAttribute("ErrorQuitar") != null) {%>
                            <div class="alert alert-danger alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span>
                                    <b> Error - </b>Se produjo un error al quitar el producto del carrito.</span>
                            </div>
                            <%}%>
                            <!--Mensaje Agregar -->
                            <% if (request.getAttribute("SeAgrego") != null) {%>
                            <div class="alert alert-success alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-check-2"></i><br>
                                </button>
                                <span>
                                    <b> <i class="nc-icon nc-cart-simple" style="color: #fff;"><i class="nc-icon nc-simple-add"></i></i></b>El producto ha sido agregado al carrito.</span>
                            </div>
                            <%}%>
                            <% if (request.getAttribute("ErrorAgregar") != null) {%>
                            <div class="alert alert-danger alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span>
                                    <b> Error - </b>Se produjo un error al agregar el producto al carrito.</span>
                            </div>
                            <%}%>
                            <!--Mensaje Guardar -->
                            <% if (request.getAttribute("SeGuardo") != null) {%>
                            <div class="alert alert-success alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-check-2"></i><br>
                                </button>
                                <span>
                                    <b> Exito - </b>Se guardó el pedido.</span>
                            </div>
                            <%}%>
                            <% if (request.getAttribute("ErrorGuardar") != null) {%>
                            <div class="alert alert-danger alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span>
                                    <b> Error - </b>Se produjo un error al guardar el pedido.</span>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%if (usuVO.getRolId().equals("3") || usuVO.getRolId().equals("1") || usuVO.getRolId().equals("2")) {%>
                    <%

                        String Pedido = String.valueOf(request.getAttribute("idPedido"));
                    %>
                    <div class="card card-user" id="Agregar">
                        <div class="card-body">
                            <div class="card-header">
                                <%if (usuVO.getRolId().equals("2")) {%>
                                <h5 class="card-title">Productos del pedido #<%=Pedido%></h5>
                                <%}if (usuVO.getRolId().equals("3") || usuVO.getRolId().equals("1")){%>
                                <h5 class="card-title">Agregar Productos</h5>
                                <%}%>
                            </div>
                            <div class="row">
                                <div class="col-md-12">

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">

                                </div>
                            </div>


                            <div class="row">
                                <%if (usuVO.getRolId().equals("2")) {%>
                                <div class="col-md-12 pr-1">
                                    <%}else{%>
                                    <div class="col-md-6 pr-1">
                                        <%}%>
                                        <div class="form-group">

                                            <label>Productos seleccionados</label>
                                            <div class="control-styles">
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered" id="TablaCartaDet">
                                                        <thead class=" text-primary">
                                                            <tr>
                                                                <th>Producto</th>
                                                                <th>Cantidad</th>
                                                                    <%if(usuVO.getRolId().equals("3") || usuVO.getRolId().equals("1")){%>
                                                                <th>Eliminar</th>
                                                                    <%}%>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                detallePedidoVO detalleVO = new detallePedidoVO();
                                                                detallePedidoDAO detalleDAO = new detallePedidoDAO();
                                                                ArrayList<detallePedidoVO> ConsultaDE = detalleDAO.ConsultaDE(Pedido);
                                                                if (ConsultaDE.size() <= 0) {%>
                                                            <%} else {
                                                                for (int d = 0; d < ConsultaDE.size(); d++) {
                                                                    detalleVO = ConsultaDE.get(d);%>
                                                            <tr>
                                                        <form method="post" action="DetallePedido" id="quitar">
                                                            <input type="hidden" class="form-control" name="txtidPedido" value="<%=Pedido%>" readonly />
                                                            <input type="hidden" class="form-control" name="txtidProducto" value="<%= detalleVO.getIdProducto()%>" readonly />
                                                            <td> <input type="text" style="border: none; background-color: transparent;" class="form-control" name="txtidProducto" value="<%= detalleVO.getNombreProducto()%>" readonly /></td>
                                                            <td> <input type="text" style="border: none; background-color: transparent;" class="form-control" name="txtCantidad" value="<%= detalleVO.getCantidad()%>" readonly /></td>
                                                                <%if(usuVO.getRolId().equals("3") || usuVO.getRolId().equals("1")){%>

                                                            <td><button type="submit" class="btn" onclick="" name="boton" value="Quitar" title="Retirar producto"><i class="nc-icon nc-simple-remove"></i></button>
                                                                    <%if(detalleVO.getCantidad().equals("1")){%>
                                                                <button type="hidden" class="btn" onclick="" name="boton" value="Resta" title="No se puede disminuir cantidad" disabled><i class="nc-icon nc-simple-delete"></i></button>
                                                                    <%}else{%>
                                                                <button type="submit" class="btn" onclick="" name="boton" value="Resta" title="Disminuir cantidad" ><i class="nc-icon nc-simple-delete"></i></button>
                                                                    <%}}%>
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
                                    </div>
                                    <%if(usuVO.getRolId().equals("3") || usuVO.getRolId().equals("1")){%>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label for="carta" >Productos En carta</label>
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered" id="TablaProductosDet">
                                                    <thead class=" text-primary">
                                                        <tr>
                                                            <th>Producto</th>
                                                            <th>Precio</th>
                                                            <th>Cantidad</th>
                                                            <th> </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            productoVO proVO = new productoVO();
                                                            productoDAO proDAO = new productoDAO();
                                                            ArrayList<productoVO> listarProducto = proDAO.listar();

                                                            for (int i = 0; i < listarProducto.size(); i++) {

                                                                proVO = listarProducto.get(i);
                                                        %>
                                                        <tr>
                                                    <form method="post" action="DetallePedido">
                                                        <input type="hidden" class="form-control"  placeholder="N° Pedido" value="<%=Pedido%>" name="txtidPedido" readonly>
                                                        <input type="hidden" class="form-control" name="txtidProducto" value="<%= proVO.getIdProducto()%>" readonly/>
                                                        <td><%=proVO.getNombreProducto()%></td>
                                                        <td>$<%=proVO.getPrecioProducto()%></td>
                                                        <td> <input class="form-control" type="number" name="Cantidad" value="1" min="1" max="20"/></td>
                                                        <td><button type="submit" class="btn" onclick="" name="boton" value="Agregar" title="Agregar Producto"><i class="nc-icon nc-simple-add"></i></button>
                                                    </form>
                                                    </tr>

                                                    <%}%>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <%
                                detallePedidoVO detalleVO1 = new detallePedidoVO();
                                detallePedidoDAO detalleDAO1 = new detallePedidoDAO();
                                ArrayList<detallePedidoVO> ListarPedidos = detalleDAO.ConsultaEspe(Pedido);;
                                if (ListarPedidos.size() <= 0) {} else {
                                for (int i = 0; i < ListarPedidos.size(); i++) {
                                    detalleVO1 = ListarPedidos.get(i);
                                }}
                                %>
                                <form  method="post" action="DetallePedido">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Observacion</label>
                                                <input type="hidden" class="form-control"  placeholder="N° Pedido" value="<%=Pedido%>" name="txtidPedido" readonly>
                                                <textarea class="form-control textarea" name="Observacion" required><%=detalleVO1.getObservacion()%></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="update ml-auto mr-auto">
                                            <button type="submit" class="btn btn-round" name="boton" value="Guardar">Registrar</button>
                                        </div>
                                    </div>
                                </form>


                            </div>
                        </div>
                        <%}}%>
                    </div>
                    <jsp:include page="templates/footer.jsp" />
                </div>
            </div>
            <jsp:include page="templates/scripts.jsp" />
    </body>

</html>