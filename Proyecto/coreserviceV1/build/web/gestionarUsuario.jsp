<%-- 
    Document   : ProductoPla
    Created on : 20/08/2019, 08:53:05 PM
    Author     : jlemu
--%>

<%@page import="modeloVO.pedidoVO"%>
<%@page import="modeloVO.pedidoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
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
            <div class="content">
                <div class="col-md-8">
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">Usuarios</h5>
                        </div>
                        <div class="card-body">
                            <form method="post" action="Usuario">
                                <div class="col-md-12">
                                    <div class="card-header">
                                        <h5 class="card-title">Actualizar usuarios</h5>
                                    </div>
                                    <div class="input-group no-border">
                                        <input type="text" name="txtId" value="" class="form-control" placeholder="Ingrese el ID del usuario que desea actualizar...">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <button type="submit" class="nc-icon nc-zoom-split btn btn-round" name="opcion"  value="5" ></button>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <% if (request.getAttribute("MensajeErrorC") != null) {%>
                                                <div class="alert alert-warning alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-simple-remove"></i>
                                                    </button>
                                                    <span>
                                                        <b> Advertencia - </b> Este Usuario no existe</span>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <form method="post" action="Usuario">
                                <%

                                    UsuarioVO usuarVO = (UsuarioVO) request.getAttribute("voLleno");
                                    if (usuarVO != null) {
                                %>
                                <div class="row">
                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label> Identificación</label>
                                            <input type="text" class="form-control" placeholder="Numero de documento" name="txtId" value="<%= usuarVO.getIdentificacionUsu()%>">
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input type="text" class="form-control" placeholder="Nombre completo" name="txtnombre" value="<%= usuarVO.getNombreUsu()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Teléfono</label>
                                            <input type="text" class="form-control" placeholder="Teléfono" name="txttelefono" value="<%= usuarVO.getTelefonoUsu()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Rol</label>
                                            <select name="txtrol" class="form-control" value="<%= usuarVO.getRolId()%>">
                                                <option value="1">Admnistrador</option>
                                                <option value="2">Cocinero</option>
                                                <option value="3">Mesero</option>
                                                <option value="4">Recepcionista</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" class="form-control" placeholder="Direcion" name="txtdireccion" value="<%= usuarVO.getDireccionUsu()%>">
                                        </div>

                                        <div class="form-group">
                                            <label>E-mail</label>
                                            <input type="text" class="form-control" placeholder="E-mail" name="txtemail" value="<%= usuarVO.getEmailUsu()%>">
                                        </div>
                                        <div class="form-group">   
                                            <label>Clave</label>
                                            <input type="text" class="form-control" placeholder="Clave de acceso" name="txtclave" value="<%= usuarVO.getClaveUsu()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <button type="submit" class="nc-icon nc-ruler-pencil btn btn-round" name="opcion"  value="2" > Actualizar</button>
                                    </div>
                                </div>
                                <%}%>
                            </form>
                            <form method="post"action="Usuario">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-header">
                                            <h5 class="card-title">Eliminar Usuarios</h5>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group no-border">
                                                    <input type="number" class="form-control"  placeholder="Ingrese el ID del pedido que desea eliminar..." value="" name="txtId">
                                                    <div class="input-group-append">
                                                        <div class="input-group-text">
                                                            <button type="submit" class="nc-icon nc-simple-remove btn btn-round" name="opcion" value="4"></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-auto">
                                                    <% if (request.getAttribute("MensajeError") != null) {%>
                                                    <div class="alert alert-danger alert-dismissible fade show">
                                                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                            <i class="nc-icon nc-simple-remove"></i>
                                                        </button>
                                                        <span>
                                                            <b> Error - </b> Se produjo un error</span>
                                                    </div>
                                                    <%}%>
                                                    <% if (request.getAttribute("MensajeExito") != null) {%>

                                                    <div class="alert alert-success alert-dismissible fade show">
                                                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                            <i class="nc-icon nc-simple-remove"></i><br>
                                                        </button>
                                                        <span>
                                                            <b> Exito - </b> El Usuario se eliminó corectamente</span>
                                                    </div>
                                                    <%}%>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <footer class="footer footer-black  footer-white ">
                <div class="container-fluid">
                    <div class="row">
                        <nav class="footer-nav">
                            <ul>
                                <li>
                                    <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>
                                </li>
                                <li>
                                    <a href="http://blog.creative-tim.com/" target="_blank">Blog</a>
                                </li>
                                <li>
                                    <a href="https://www.creative-tim.com/license" target="_blank">Licenses</a>
                                </li>
                            </ul>
                        </nav>
                        <div class="credits ml-auto">
                            <span class="copyright">
                                ©
                                <script>
                                    document.write(new Date().getFullYear())
                                </script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
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
    <script src="assets/js/busqueda.js"></script>
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
