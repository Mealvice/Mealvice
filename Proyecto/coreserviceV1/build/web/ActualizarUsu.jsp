<%-- 
    Document   : ProductoPla
    Created on : 20/08/2019, 08:53:05 PM
    Author     : jlemu
--%>

<%@page import="modeloVO.productoVO"%>
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
                <div class="card card-user">
                    <div class="col-lg-auto">
                        <div class="card-header">
                            <h6><a class=" fa fa-reply-all btn btn-round" href="HomeUsuarios.jsp" style="float: right">Volver</a></h6>
                            <h5 class="card-title">Usuario Seleccionado</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered" id="tabla">
                                    <thead class=" text-primary">
                                    <th>Identificacion</th>
                                    <th>Nombre de Usuario</th>
                                    <th>Telefono</th>
                                    <th>Direccion</th>
                                    <th>E-Mail</th>
                                    <th>Rol</th>
                                    <th>Clave</th>
                                    <th>Editar</th>
                                    </thead>
                                    <tbody>
                                        <%
                                           
                                            UsuarioVO usVO = (UsuarioVO) request.getAttribute("voLleno");
                                            if (usVO == null) {%>
                                    </tbody>
                                </table>
                                <div class="alert alert-warning alert-dismissible fade show">
                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="nc-icon nc-simple-remove"></i><br>
                                    </button>
                                    <span>
                                        <b> Advertencia - </b> No hay usuarios registrados</span>
                                </div>
                                <%} else {
                                    
                                %>

                                <tr>
                                    <td> <%= usVO.getIdentificacionUsu()%>   </td>
                                    <td> <%= usVO.getNombreUsu()%>   </td>
                                    <td> <%= usVO.getTelefonoUsu()%>   </td>
                                    <td> <%= usVO.getDireccionUsu()%>   </td>
                                    <td> <%= usVO.getEmailUsu()%>   </td>
                                    <td> <%= usVO.getRolId()%>   </td>
                                    <td><div class="input-group no-border">
                                            <input type="password" readonly="true" id="" class="form-control" value="<%= usVO.getClaveUsu()%>">
                                            <div class="input-group-append">
                                                <div class="input-group-text">
                                                    <a onclick='document.getElementById().type = "text";'><i class="far fa-eye"></i></a><br>
                                                    <a onclick='document.getElementById().type = "password";'><i class="far fa-eye-slash"></i></a>
                                                </div>
                                            </div>
                                        </div></td>
                                        <td>
                                           <button class="btn btn-round"  data-toggle="modal" data-target="#ModalReg">Editar</button>
                                            
                                        </td>
                                <script>
                                    function mostrarContrasena(var a) {
                                        var tipo = document.getElementById(a);
                                        if (tipo.type === "password") {
                                            tipo.type = "text";
                                        } else {
                                            tipo.type = "password";
                                        }
                                    }
                                </script>
                                </tr>
                                <%}
                                   %>
                                </tbody>
                                </table>
                            </div>
                           
                        </div>
                    </div>
                    </center>
                    
                    <div class="col-md-12">
                        <% if (request.getAttribute("MensajeErrorR") != null) {
                                String Error = String.valueOf(request.getAttribute("MensajeErrorR"));
                        %>
                        <div class="alert alert-danger alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span>
                                          <b> Error - </b> <% out.print(Error); %></span>
                        </div>
                        <%}%>
                        <% if (request.getAttribute("MensajeExitoR") != null) {%>

                        <div class="alert alert-success alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-check-2"></i><br>
                            </button>
                            <span>
                                <b> Exito - </b> El usuario se registró correctamente</span>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="modal fade" id="ModalReg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Actualizar usuario</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                             <%
                                        UsuarioVO usuvo = (UsuarioVO) request.getAttribute("voLleno");
                                        if (usuvo != null) {
                                    %>
                            <div class="modal-body">
                                <form method="POST" action="Usuario">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label> Identificación</label>
                                                <input type="text" class="form-control" placeholder="Numero de documento" value="<%= usuvo.getIdentificacionUsu()%>" name="txtId" readonly="">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input type="text" class="form-control" placeholder="Nombre completo" name="txtnombre" value="<%= usuvo.getNombreUsu()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Teléfono</label>
                                                <input type="text" class="form-control" placeholder="Teléfono" name="txttelefono" value="<%= usuvo.getTelefonoUsu()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Rol</label>
                                                <select name="txtrol" class="form-control">
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
                                                <input type="text" class="form-control" placeholder="Direcion" name="txtdireccion" value="<%= usuvo.getDireccionUsu()%>">
                                            </div>

                                            <div class="form-group">
                                                <label>E-mail</label>
                                                <input type="email" class="form-control" placeholder="E-mail" name="txtemail" value="<%= usuvo.getEmailUsu()%>">
                                            </div>
                                            <div class="form-group">   
                                                <label>Clave</label>
                                                <input type="text" class="form-control" placeholder="Clave de acceso" name="txtclave" value="<%= usuvo.getClaveUsu()%>">
                                            </div>
                                        </div>
                                    </div>

                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <button type="submit" class=" btn btn-round" name="opcion"  value="2">Actualizar</button>
<%}%>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

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
        <script src="assets/js/busqueda.js"></script>
        <script src="assets/js/FontAwesome5.js" type="text/javascript"></script>
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
