<%-- 
    Document   : pedidos
    Created on : 20/08/2019, 08:17:21 AM
    Author     : APRENDIZ
--%>

<%@page import="modeloDAO.productoDAO"%>
<%@page import="modeloVO.productoVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.pedidoDAO"%>
<%@page import="modeloVO.pedidoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = (HttpSession) request.getSession();
    UsuarioVO usuVO = (UsuarioVO) sesion.getAttribute("usuario");

    HttpSession sesion2 = (HttpSession) request.getSession();
    UsuarioVO usuRolVO = (UsuarioVO) sesion.getAttribute("rol");
%>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Mealservice
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/demo/demo.css" rel="stylesheet" />
    </head>

    <body class="">

        <div class="wrapper ">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <!--
                  Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
                -->
                <div class="logo">
                    <a href="" class="simple-text logo-mini">
                        <div class="logo-image-small">
                            <img src="">
                        </div>
                    </a>
                    <a href="Menu.jsp" class="simple-text logo-normal">
                        Mealservice
                        <!-- <div class="logo-image-big">
                          <img src="../assets/img/logo-big.png">
                        </div> -->
                    </a>
                </div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li >
                            <a href="gestionarUsuario.jsp">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Usuarios</p>
                            </a>
                        </li>
                        <li class="active " >
                            <a>
                                <i class="nc-icon nc-paper"></i>
                                <p>Pedidos</p>
                            </a>
                        </li>
                        <li>
                            <a href="ProductoPla.jsp">
                                <i class=" nc-icon nc-cart-simple"></i>
                                <p>Productos</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="nc-icon nc-map-big"></i>
                                <p>Carta</p>
                            </a>
                        </li>
                        <li>
                            <a href="Mesa_CRUD.jsp">
                                <i class="nc-icon nc-layout-11"></i>
                                <p>Mesas</p>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->z5
                <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <div class="navbar-toggle">
                                <button type="button" class="navbar-toggler">
                                    <span class="navbar-toggler-bar bar1"></span>
                                    <span class="navbar-toggler-bar bar2"></span>
                                    <span class="navbar-toggler-bar bar3"></span>
                                </button>
                            </div>
                            <a class="navbar-brand" href="">Gestion de Pedidos</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <form>

                            </form>
                            <ul class="navbar-nav">

                                <li class="nav-item btn-rotate dropdown">
                                    <a class="nav-link dropdown-toggle" href="" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="nc-icon nc-settings-gear-65"></i>
                                        <p>
                                            <span class="d-lg-none d-md-block">Some Actions</span>
                                        </p>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="index.jsp">Cerrar Sesion</a>

                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <!-- <div class="panel-header panel-header-sm">
          
          
          </div> -->
                <div class="content">
                    <div class="row"></div>
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">Registrar Pedido</h5>
                        </div>
                        <div class="card-body">
                            <form method="post" action="Pedido" id="registrar">
                                <div class="row">

                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>N° Pedido</label>
                                            <input type="number" class="form-control"  placeholder="N° Pedido" value="" name="txtidPedido">
                                        </div>
                                    </div>

                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Mesero</label>
                                            <input type="number" class="form-control"  placeholder="Mesero" value="" name="txtidUsuario">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Estado</label>
                                            <select class="form-control" name="txtestadoPedido">
                                                <option selected="true" disabled="disabled">seleccione el estado...</option>
                                                <option value="Espera">Espera</option>
                                                <option value="Preparando">Preparando</option>
                                                <option value="Entregado">Entregado</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Mesa</label>

                                            <%
                                                pedidoVO pedVOm = new pedidoVO();
                                                pedidoDAO pedDAOm = new pedidoDAO();
                                                ArrayList<pedidoVO> ListarPedidosm = pedDAOm.listar();
                                                if (ListarPedidosm.size() <= 0) {%>
                                            <div class="alert alert-warning alert-dismissible fade show">
                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                    <i class="nc-icon nc-simple-remove"></i><br>
                                                </button>
                                                <span>
                                                    <b> Advertencia - </b> No hay mesas registrados</span>
                                            </div>
                                            <%} else {%><select class="form-control" name="txtidMesa"><%
                                                for (int i = 0; i < ListarPedidosm.size(); i++) {
                                                    pedVOm = ListarPedidosm.get(i);
                                                %>
                                                <option value="<%= pedVOm.getIdPedido()%>"><%= pedVOm.getObservacionPedido()%></option>
                                                <%}
                                                    }%>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">

                                            <label for="carta" >Productos En carta</label>
                                            <div class="table-responsive">


                                                    <%
                                                        productoVO proVO = new productoVO();
                                                        productoDAO proDAO = new productoDAO();
                                                        ArrayList<productoVO> listarProducto = proDAO.listar();

                                                        for (int i = 0; i < listarProducto.size(); i++) {

                                                            proVO = listarProducto.get(i);

                                                    %>
                                                    <label><input type="checkbox" name="prod" value="<%=proVO.getIdProducto()%>"><%=proVO.getNombreProducto()%> - $<%=proVO.getPrecioProducto()%></label><br>
                                                        <%}%>
                                                </div>

                                        </div>
                                    </div>

                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Productos seleccionados</label>
                                            <div class="control-styles">
                                                <div class="table-responsive">
                                                    <textarea class="form-control textarea"> </textarea>
                                                </div>
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
                                    <div class="update ml-auto mr-auto">
                                        <button type="submit" class="btn btn-round" name="boton" value="Registrar" onclick="">Registrar</button>
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
                                                <b> Exito - </b> El pedido se registró corectamente</span>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>

                            </form>

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
                                            <form name ="form1" action="PdfPedidos">
                                <div class="col-md-12">
                                    <div class="card-header">
                                        <h5 class="card-title">Actualizar Pedidos</h5>
                                    </div>
                                    <div class="input-group no-border">
                                        <input type="text" name="txtparametro" value="" class="form-control" placeholder="Ingrese el ID del pedido que desea actualizar...">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <button type="submit" class="nc-icon nc-zoom-split btn btn-round" name="boton"  value="ConsultaP" ></button>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <form method="post" action="Pedido">
                                <%

                                    pedidoVO PedidoVO = (pedidoVO) request.getAttribute("voLleno");
                                    if (PedidoVO != null) {
                                %>
                                <div class="row">

                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>N° Pedido</label>
                                            <input type="number" class="form-control"  placeholder="N° Pedido" value="<%=PedidoVO.getIdPedido()%>" name="txtidPedido" disabled>
                                        </div>
                                    </div>

                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Mesero</label>
                                            <input type="number" class="form-control"  placeholder="Mesero" value="<%=PedidoVO.getIdUsuario()%>" name="txtidUsuario">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Estado</label>
                                            <select class="form-control" name="txtestadoPedido" >
                                                <option selected="true" ><%=PedidoVO.getEstadoPedido()%></option>
                                                <option value="Espera">Espera</option>
                                                <option value="Preparando">Preparando</option>
                                                <option value="Entregado">Entregado</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Mesa</label>
                                            <input type="number" class="form-control" placeholder="Mesa" value="<%=PedidoVO.getIdMesa()%>" name="txtidMesa">
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
                                            <textarea class="form-control textarea" name="txtobservacionPedido" ><%=PedidoVO.getObservacionPedido()%></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <button type="submit" class="nc-icon nc-ruler-pencil btn btn-round" name="boton"  value="Actualizar" > Actualizar</button>
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
                                <%}%>
                            </form>
                            <form method="post"action="Pedido">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-header">
                                            <h5 class="card-title">Entregar Pedidos</h5>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group no-border">
                                                    <input type="number" class="form-control"  placeholder="Ingrese el ID del pedido que desea Entregar..." value="" name="txtidPedido">
                                                    <div class="input-group-append">

                                                        <div class="input-group-text">
                                                            <button type="submit" class="nc-icon nc-delivery-fast btn btn-round" name="boton" value="Eliminar"></button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-auto">
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
                                    </div>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card-header">
                                        <h5 class="card-title">Pedidos Registrados</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table" id="tabla">
                                                <thead class=" text-primary">
                                                <th>Pedido</th>
                                                <th>Estado</th>
                                                <th>Mesa</th>
                                                <th>Usuario</th>
                                                <th class="text-right">Observacion</th>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        pedidoVO pedVO = new pedidoVO();
                                                        pedidoDAO pedDAO = new pedidoDAO();
                                                        ArrayList<pedidoVO> ListarPedidos = pedDAO.listar();
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
                                                    pedVO = ListarPedidos.get(i);
                                            %>
                                            <tr>
                                                <td> <%= pedVO.getIdPedido()%>   </td>
                                                <td> <%= pedVO.getEstadoPedido()%> </td>
                                                <td> <%= pedVO.getIdMesa()%> </td>
                                                <td> <%= pedVO.getIdUsuario()%> </td>
                                                <td class="text-right"> <%= pedVO.getObservacionPedido()%> </td>
                                            </tr>
                                            <%}
                                                }%>
                                            </tbody>
                                            </table>
                                            <script>
                                            </script>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            </form>

                        </div>
                    </div>





                    <!--<div class="row">
                         <div class="row">
                             <div class="col-lg-8 ml-auto mr-auto">
                                 <div class="col-md-4">
                                     <button class="btn btn-danger btn-block" onclick="demo.errorNotification('bottom', 'right')">Bottom Right</button>
                                     <button class="btn btn-success btn-block" onclick="demo.exitoNotification('bottom', 'right')">Bottom Right</button>
                                 </div>
                             </div>
                         </div>
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
        </div>
    </div>
</div>
<!--   Core JS Files   -->
<script>
    function error() {
        $.notify({
            icon: 'nc-simple-remove',
            title: '<strong>Hubo un error con la operacion!</strong>',
            message: 'No se pudo realizar la operaacion, por favor revise e intente nuevamente'
        }, {
            type: 'danger'
        });
    }

    function exito() {
        $.notify({
            icon: 'nc-check-2',
            title: '<strong>Operacion Realizada con exito!</strong>',
            message: 'Se ejecuto correctamente la operacion, puede ver los cambios en la tabla al final de la pagina.'
        }, {
            type: 'success'
        });
    }
</script>
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

