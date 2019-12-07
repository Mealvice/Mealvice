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
                <nav aria-label="breadcrumb" role="navigation">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="HomePedidos.jsp">Incio Pedidos</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Registrar</li>
                        <li class="breadcrumb-item"><a href="pedidosAE.jsp">Actualizar</a></li>
                        <li class="breadcrumb-item"><a href="#">Eliminar</a></li>
                    </ol>
                </nav>
                <div class="row"></div>
                <div class="card card-user">
                    <%if (usuVO.getRolId().equals("4")) {%>
                    <center><br><br>
                        <div class="col-lg-auto">
                            <div class="card card-stats">
                                <div class="card-body ">
                                    <div class="row">
                                        <div class="col-12 col-md-5">
                                            <div class="icon-big text-center icon-warning">
                                                <i class="nc-icon nc-simple-remove text-danger"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-5 pr-1">
                                            <h1>ESTE MODULO NO ESTÁ DISPONIBLE</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </center>
                    <%}%>
                    <%if (usuVO.getRolId().equals("3") || usuVO.getRolId().equals("1")) {
                    %>

                    <div class="card-header">
                        <h5 class="card-title">Registrar Pedido</h5>
                    </div>
                    <div class="card-body">
                        <form method="post" action="Pedido" id="registrar">
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
                                        <label>Mesero</label>
                                        <input type="number" class="form-control"  placeholder="Mesero" value="<%=usuVO.getIdentificacionUsu()%>" name="txtidUsuario" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Estado</label>
                                        <input type="number" class="form-control" name="estado" placeholder="Espera" value="Espera"  readonly>
                                    </div>
                                </div>

                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Mesa</label>

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
                                        <%} else {%><select class="form-control" name="txtidMesa"><option selected="true" disabled="disabled">seleccione una mesa...</option><%
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
                                </div>
                            </div>
                            <div class="row">
                                <div class="update ml-auto mr-auto">
                                    <button type="submit" class="btn btn-round" name="boton" value="Registrar">Registrar</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>


                <div class="card card-user" id="Agregar">
                    <div class="card-body">
                        <div class="card-header">
                            <h5 class="card-title">Agregar Productos</h5>
                        </div>

                        <div class="row">
                            <div class="col-md-6 pr-1">
                                <div class="form-group">
                                    <form method="post" action="DetallePedido" id="quitar">

                                        <label>Productos seleccionados</label>
                                        <div class="control-styles">
                                            <div class="">
                                                <table class="table table-hover table-bordered">
                                                    <thead class=" text-primary">
                                                        <tr>
                                                            <th>Pedido</th>
                                                            <th>Producto</th>
                                                            <th>Cantidad</th>
                                                            <th>Eliminar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            detallePedidoVO detalleVO = new detallePedidoVO();
                                                            detallePedidoDAO detalleDAO = new detallePedidoDAO();
                                                            ArrayList<detallePedidoVO> listarDetalle = detalleDAO.listarc();
                                                            if (listarDetalle.size() <= 0) {%>
                                                    </tbody>
                                                </table>
                                                <div class="alert alert-info alert-dismissible fade show">
                                                    <span>
                                                        <b> Información - </b>Aqui aparecerán los productos que ha registrado</span>
                                                </div>
                                                <%} else {
                                                    for (int d = 0; d < listarDetalle.size(); d++) {
                                                        detalleVO = listarDetalle.get(d);%>
                                                <tr>
                                                <form name="FormularioQuitar" onSubmit="enviarDatos(); return false">
                                                    <td> <input type="text" class="form-control" name="txtidPedido" value="<%= detalleVO.getIdPedido()%>" readonly /></td>
                                                    <td> <input type="text" class="form-control" name="txtidProducto" value="<%= detalleVO.getIdProducto()%>" readonly /></td>
                                                    <td> <input type="text" class="form-control" name="txtCantidad" value="<%= detalleVO.getCantidad()%>" readonly /></td>
                                                    <td><input type="submit" class="btn btn-round" onclick="" name="boton" value="Quitar" </td>
                                                </form>
                                                </tr>
                                                <%}
                                                    }%>
                                                </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <script type="text/javascript">

                                            function objetoAjax() {
                                                var xmlhttp = false;
                                                try {
                                                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                                                } catch (e) {

                                                    try {
                                                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                                                    } catch (E) {
                                                        xmlhttp = false;
                                                    }
                                                }

                                                if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
                                                    xmlhttp = new XMLHttpRequest();
                                                }
                                                return xmlhttp;

                                                function enviarDatos() {

                                                    //Recogemos los valores introducimos en los campos de texto
                                                    pedido = document.FormularioQuitar.txtidPedido.value;
                                                    producto = document.FormularioQuitar.txtidProducto.value;
                                                    cantidad = document.FormularioQuitar.txtCantidad.value;
                                                    opcion = document.FormularioQuitar.boton.value;

                                                    //Aquí será donde se mostrará el resultado
                                                    pedido = docuemnt.getElementByName('txtidPedido');
                                                    producto = docuemnt.getElementByName('txtidProducto');
                                                    cantidad = document.getElementsByName('txtCantidad');
                                                    opcion = document.getElementsByName('boton');

                                                    //instanciamos el objetoAjax
                                                    ajax = objetoAjax();

                                                    //Abrimos una conexión AJAX pasando como parámetros el método de envío, y el archivo que realizará las operaciones deseadas
                                                    ajax.open("POST", "detallePedidoControlador.jsp", true);

                                                    //cuando el objeto XMLHttpRequest cambia de estado, la función se inicia
                                                    ajax.onreadystatechange = function () {

                                                        //Cuando se completa la petición, mostrará los resultados
                                                        if (ajax.readyState == 4) {

                                                            //El método responseText() contiene el texto de nuestro 'consultar.php'. Por ejemplo, cualquier texto que mostremos por un 'echo'
                                                            jugador.value = (ajax.responseText)
                                                        }
                                                    }

                                                    //Llamamos al método setRequestHeader indicando que los datos a enviarse están codificados como un formulario.
                                                    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                                                    //enviamos las variables a 'consulta.php'
                                                    ajax.send("&opcion=" + opcion + "&IdPedido=" + pedido + "&Cantidad=" + Cantidad + "&IdProducto=" + producto)

                                                }


                                            }
                                        </script>
                                </div>
                            </div>
                            </form>
                            <!--                        </div>
                                                    <div class="row">-->
                            <div class="col-md-6 pr-1">
                                <div class="form-group">
                                    <label for="carta" >Productos En carta</label>
                                    <div class="">

                                        <table class="table table-hover table-bordered">
                                            <thead class=" text-primary">
                                                <tr>
                                                    <th>Pedido</th>
                                                    <TH>ID Producto</TH>
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
                                                <td> <%
                                                    int counte;
                                                    int resultadoe;
                                                    pedidoVO pedieVO = new pedidoVO();
                                                    pedidoDAO pedieDAO = new pedidoDAO();
                                                    ArrayList<pedidoVO> listarce = pediDAO.listarc();
                                                    for (int e = 0; e < listarce.size(); e++) {
                                                        pedieVO = listarc.get(e);
                                                        String resul = String.valueOf(pedieVO.getCount());
                                                        counte = Integer.parseInt(resul);
                                                        resultadoe = counte;
                                                    %>
                                                    <input type="number" class="form-control"  placeholder="N° Pedido" value="<%=resultadoe%>" name="txtidPedido" readonly>
                                                    <%}%></td>
                                                <td><input type="text" class="form-control" name="txtidProducto" value="<%= proVO.getIdProducto()%>" readonly/></td>
                                                <td><%=proVO.getNombreProducto()%></td>
                                                <td>$<%=proVO.getPrecioProducto()%></td>
                                                <td> <input class="form-control" type="number" name="Cantidad" value="1" min="1" /></td>
                                                <td><input type="submit" class="btn btn-round" onclick="" name="boton" value="Agregar"></td>
                                            </form>
                                            </tr>

                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Observacion</label>
                                    <textarea class="form-control textarea" name="txtobservacionPedido"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <% if (request.getAttribute("MensajeErrorDet") != null) {%>
                                <div class="alert alert-danger alert-dismissible fade show">
                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="nc-icon nc-simple-remove"></i>
                                    </button>
                                    <span>
                                        <b> Error - </b> Se produjo un error</span>
                                </div>
                                <%}%>
                                <% if (request.getAttribute("MensajeExitoDet") != null) {%>

                                <div class="alert alert-success alert-dismissible fade show">
                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="nc-icon nc-check-2"></i><br>
                                    </button>
                                    <span>
                                        <b> Exito - </b> El pedido se registró corectamente</span>
                                </div>
                                <%}%>
                            </div>
                        </div>

                    </div>
                </div>




                <div class="card card-user">
                    <div class="card-body">
                        <form method="post" action="Pedido">
                            <div class="col-md-12">
                                <div class="card-header">
                                    <h5 class="card-title">Actualizar Pedidos</h5>
                                </div>
                                <div class="input-group no-border">
                                    <input type="text" name="txtidPedido" value="" class="form-control" placeholder="Ingrese el ID del pedido que desea actualizar...">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <button type="submit" class="nc-icon nc-zoom-split btn btn-round" name="boton"  value="ConsultaP" ></button>
                                        </div>
                                    </div><br>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <% if (request.getAttribute("MensajeErrorPC") != null) {%>
                                            <div class="alert alert-danger alert-dismissible fade show">
                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                    <i class="nc-icon nc-simple-remove"></i>
                                                </button>
                                                <span>
                                                    <b> Error - </b> Se produjo un error</span>
                                            </div>
                                            <%}%>
                                            <% if (request.getAttribute("MensajeExitoPC") != null) {%>

                                            <div class="alert alert-success alert-dismissible fade show">
                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                    <i class="nc-icon nc-check-2"></i><br>
                                                </button>
                                                <span>
                                                    <b> Exito - </b> El pedido se consulto</span>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <% if (request.getAttribute("MensajeErrorA") != null) {%>
                                            <div class="alert alert-danger alert-dismissible fade show">
                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                    <i class="nc-icon nc-simple-remove"></i>
                                                </button>
                                                <span>
                                                    <b> Error - </b> Se produjo un error</span>
                                            </div>
                                            <%}%>
                                            <% if (request.getAttribute("MensajeExitoA") != null) {%>

                                            <div class="alert alert-success alert-dismissible fade show">
                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                    <i class="nc-icon nc-check-2"></i><br>
                                                </button>
                                                <span>
                                                    <b> Exito - </b> El pedido se actualizó corectamente</span>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <form method="post" action="Pedido">
                            <div class="table-responsive">
                                <table class="table" id="tabla">
                                    <thead class=" text-primary">
                                    <th>Pedido</th>
                                    <th>Estado</th>
                                    <th>Mesa</th>
                                    <th>Usuario</th>
                                    <th class="text-right"> </th>
                                    </thead>
                                    <tbody>
                                        <%
                                            pedidoVO PedidoVOC = (pedidoVO) request.getAttribute("voLlenoP");
                                            if (PedidoVOC == null) {%>
                                    </tbody>
                                </table>
                                <div class="alert alert-info alert-dismissible fade show">
                                    <span>
                                        <b> Información - </b>Aqui aparecerá el pedido que desea actualizar</span>
                                </div>
                                <%} else {%>
                                <tr>
                                    <td id="entregado"> <%= PedidoVOC.getIdPedido()%>   </td>
                                    <td id="entregado"> <%= PedidoVOC.getEstadoPedido()%> </td>
                                    <td id="entregado"> <%= PedidoVOC.getIdMesa()%> </td>
                                    <td id="entregado"> <%= PedidoVOC.getIdUsuario()%> </td>
                                    <td class="text-right" id="entregado"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAct">ACTUALIZAR</button> </td>
                                </tr>
                                <%}%>
                                </tbody>
                                </table>
                                <script>
                                </script>
                            </div>
                            <%
                                pedidoVO PedidoVO = (pedidoVO) request.getAttribute("voLlenoP");
                                if (PedidoVO != null) {
                            %><div class="modal fade" id="ModalAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR PEDIDO</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">

                                                <div class="col-md-5 pr-1">
                                                    <div class="form-group">
                                                        <label>N° Pedido</label>
                                                        <input type="number" class="form-control"  placeholder="N° Pedido" value="<%=PedidoVO.getIdPedido()%>" name="txtidPedido" readonly>
                                                    </div>
                                                </div>

                                                <div class="col-md-5 pr-1">
                                                    <div class="form-group">
                                                        <label>Mesero</label>
                                                        <input type="number" class="form-control"  placeholder="Mesero" value="<%=PedidoVO.getIdUsuario()%>" name="txtidUsuario" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5 pr-1">
                                                    <div class="form-group">
                                                        <label>Estado</label>
                                                        <select class="form-control" name="txtestadoPedido" required >
                                                            <option selected="true" ><%=PedidoVO.getEstadoPedido()%></option>
                                                            <option value="Espera">Espera</option>
                                                            <option value="Preparando">Preparando</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-5 pr-1">
                                                    <div class="form-group">
                                                        <label>Mesa</label>
                                                        <input type="number" class="form-control" placeholder="Mesa" value="<%=PedidoVO.getIdMesa()%>" name="txtidMesa" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Productos</label>
                                                        <select class="form-control">
                                                            <option>Pollo</option>
                                                            <option>Carne</option>
                                                            <option>Sopa</option>
                                                            <option>Pechuga</option>
                                                            <option>Pollo</option>
                                                            <option>Pollo</option>
                                                            <option>Pollo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Observacion</label>
                                                        <textarea class="form-control textarea" name="txtobservacionPedido" required ></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                            <button type="submit" class="nc-icon nc-ruler-pencil btn btn-round" name="boton"  value="Actualizar">Guardar Cambios</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </form>
                    </div>
                </div>
                <%}%>
                <!--            <div class="card card-user">
                                <div class="card-body">-->
                <!--MESERO-->
                <%if (usuVO.getRolId().equals("2") || usuVO.getRolId().equals("1")) {
                %>
                <!--COCINERO-->
                <form method="post"action="Pedido">


                </form>
                <div class="card card-user" id="tabla">
                    <div class="card-body">
                        <!--COCINERO-->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card-header">
                                    <h5 class="card-title">Pedidos Entregados</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered">
                                            <thead class=" text-primary">
                                            <th>Pedido</th>
                                            <th>Estado</th>
                                            <th>Mesa</th>
                                            <th>Usuario</th>
                                            </thead>
                                            <tbody id="tablaPed">
                                                <%
                                                    pedidoVO pediVO = new pedidoVO();
                                                    pedidoDAO pediDAO = new pedidoDAO();
                                                    ArrayList<pedidoVO> ListarPedidosE = pediDAO.listarE();
                                                    if (ListarPedidosE.size() <= 0) {%>
                                            </tbody>
                                        </table>
                                        <div class="alert alert-warning alert-dismissible fade show">
                                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                <i class="nc-icon nc-simple-remove"></i><br>
                                            </button>
                                            <span>
                                                <b> Advertencia - </b> No se han entregado pedidos</span>
                                        </div>
                                        <%} else {
                                            for (int i = 0; i < ListarPedidosE.size(); i++) {
                                                pediVO = ListarPedidosE.get(i);
                                        %>
                                        <tr>
                                            <td id="entregado"> <%= pediVO.getIdPedido()%>   </td>
                                            <td id="entregado"> <%= pediVO.getEstadoPedido()%> </td>
                                            <td id="entregado"> <%= pediVO.getIdMesa()%> </td>
                                            <td id="entregado"> <%= pediVO.getIdUsuario()%> </td>
                                        </tr>
                                        <%}
                                            }%>
                                        </tbody>
                                        </table>
                                    </div>
                                </div>


                            </div>
                            <div class="col-md-6">
                                <div class="card-header">
                                    <h5 class="card-title">Pedidos Finalizados</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered">
                                            <thead class=" text-primary">
                                            <th>Pedido</th>
                                            <th>Estado</th>
                                            <th>Mesa</th>
                                            <th>Usuario</th>
                                            </thead>
                                            <tbody id="tablaPed">
                                                <%
                                                    pedidoVO pedVO = new pedidoVO();
                                                    pedidoDAO pedDAO = new pedidoDAO();
                                                    ArrayList<pedidoVO> ListaPedidos = pedDAO.ListarFinalizado();
                                                    if (ListaPedidos.size() <= 0) {%>
                                            </tbody>
                                        </table>
                                        <div class="alert alert-warning alert-dismissible fade show">
                                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                <i class="nc-icon nc-simple-remove"></i><br>
                                            </button>
                                            <span>
                                                <b> Advertencia - </b> No hay pedidos registrados</span>
                                        </div>
                                        <%} else {
                                            for (int i = 0; i < ListaPedidos.size(); i++) {
                                                pedVO = ListaPedidos.get(i);
                                        %>
                                        <tr>
                                            <td><%= pedVO.getIdPedido()%></td>
                                            <td><%= pedVO.getIdUsuario()%></td>
                                            <td><%= pedVO.getIdMesa()%></td>
                                            <td><%= pedVO.getEstadoPedido()%></td>
                                        </tr>
                                        <%}
                                            }%>
                                        </tbody>
                                        </table>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-header">
                                    <h5 class="card-title">Pedidos Registrados</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered">
                                            <thead class=" text-primary">
                                            <th>Pedido</th>
                                            <th>Estado</th>
                                            <th>Mesa</th>
                                            <th>Usuario</th>
                                            <th>Acciones</th>
                                            </thead>
                                            <tbody id="tablaPed">
                                                <%
                                                    pedidoVO pedidosVO = new pedidoVO();
                                                    pedidoDAO pedidDAO = new pedidoDAO();
                                                    ArrayList<pedidoVO> ListarPedidos = pedidDAO.listar();
                                                    if (ListarPedidos.size() <= 0) {%>
                                            </tbody>
                                        </table>
                                        <div class="alert alert-warning alert-dismissible fade show">
                                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                <i class="nc-icon nc-simple-remove"></i><br>
                                            </button>
                                            <span>
                                                <b> Advertencia - </b> No hay pedidos registrados</span>
                                        </div>
                                        <%} else {
                                            for (int i = 0; i < ListarPedidos.size(); i++) {
                                                pedidosVO = ListarPedidos.get(i);
                                        %>
                                        <tr>
                                        <form method="post"action="Pedido">
                                            <td><input type="text" class="form-control" name="txtidPedido" value="<%= pedidosVO.getIdPedido()%>" readonly/></td>
                                            <td><%= pedidosVO.getIdUsuario()%></td>
                                            <td><%= pedidosVO.getIdMesa()%></td>
                                            <td><%= pedidosVO.getEstadoPedido()%></td>
                                            <td>
                                                <button type="submit" class=" btn btn-round" name="boton" value="Finalizar">Finalizar</button>
                                                <button type="submit" class=" btn btn-round" name="boton" value="Eliminar">Entregar</button>
                                                <button type="submit" class=" btn btn-round" name="boton" value="Preparar">Preparar</button>
                                            </td>

                                            <!--                                            <div class="modal fade" id="ModalPreparar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalLabel">Preparar Pedido?</h5>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h3>Este pedido sera preparado, ¿Deseas continuar?</h3>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button class="nc-icon nc-simple-remove btn btn-round btn-success" data-dismiss="modal">No, no preparar</button>
                                                                                <button type="submit" class=" btn btn-round" name="boton" value="Preparar">Preparar</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal fade" id="ModalEntregar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalLabel">Entregar Pedido?</h5>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h3>¿Deseas entregar este pedido?</h3>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button class="nc-icon nc-simple-remove btn btn-round btn-success" data-dismiss="modal">No, no entregar</button>
                                                                                <button type="submit" class="nc-icon nc-delivery-fast btn btn-round" name="boton" value="Eliminar">Entregar</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal fade" id="ModalFinalizar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalLabel">Finalizar Pedido?</h5>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h3>Este pedido sera finalizado, ¿Deseas continuar?</h3>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button class="nc-icon nc-simple-remove btn btn-round btn-success" data-dismiss="modal">No, no finalizar</button>
                                                                                <button type="submit" class=" btn btn-round" name="boton" value="Finalizar">Finalizar</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                                        </form>
                                        </tr>
                                        <%}
                                            }%>
                                        </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
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
                                    </div>
                                </div>
                                <div class="row">
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
                                <div class="row">
                                    <div class="col-md-12">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
                </form>
                <!--                </div>
                            </div>-->

                <footer class="footer footer-black  footer-white ">
                    <div class="container-fluid">
                        <div class="row">
                            <nav class="footer-nav">
                                <ul>
                                    <li>
                                        <a href="Menu.jsp" target="">Inicio</a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="credits ml-auto">
                                <span class="copyright">
                                    ©
                                    <script>
                                        document.write(new Date().getFullYear())
                                    </script>, made with <i class="fa fa-heart heart"></i> by Mealvice
                                </span>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <!-- Chart JS -->
        <script src="assets/js/plugins/chartjs.min.js"></script>
        <!--  Notifications Plugin    -->
        <script src="assets/js/plugins/bootstrap-notify.js"></script>
        <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
        <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
        <script src="assets/demo/demo.js"></script>
    </body>

</html>

