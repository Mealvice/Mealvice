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
                            <h5 class="card-title">Usuarios Registrados</h5>
                        </div>
                        <div class="card-body">

                            <div class="col-md-6 pr-1">
                                <div class="input-group no-border">
                                    <button class="btn text-center"  data-toggle="modal" data-target="#ModalReg" ><i class="nc-icon nc-simple-add fa-1x"></i> Registrar Usuario</button>
                                    </div>
                            </div>
                            <div class="table-responsive">
                                <div class="table">
                                    <table class="table table-striped table-bordered" id="example">
                                        <thead class=" text-primary">
                                        <th>Identificación</th>
                                        <th>Nombre de Usuario</th>
                                        <th>Acciones</th>
                                        </thead>
                                        <tbody>
                                            <%
                                                UsuarioVO usVO = new UsuarioVO();
                                                UsuarioDAO usDAO = new UsuarioDAO();
                                                ArrayList<UsuarioVO> ListarUsuarios = usDAO.listar();
                                                if (ListarUsuarios.size() <= 0) {%>
                                <%} else {
                                    for (int i = 0; i < ListarUsuarios.size(); i++) {
                                        usVO = ListarUsuarios.get(i);
                                %>

                                <tr>
                                    <td> <%= usVO.getIdentificacionUsu()%>   </td>
                                    <td> <%= usVO.getNombreUsu()%>   </td>
                                    <td>
                                        <a class="nc-icon nc-ruler-pencil btn " style="color:#fff;" title="Actualizar"  data-toggle="modal" data-target="#ModalActualizar<%=i%>"></a>
                                        <a class="nc-icon nc-zoom-split btn" title="Ver detalles" style="color:#fff;"  data-toggle="modal" data-target="#ModalDetalles<%=i%>"></a>
                                    </td>
                                </tr>
                                <div class="modal fade" id="ModalActualizar<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Actualizando los datos de <strong><%= usVO.getNombreUsu()%></strong></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div> 
                                            <div class="modal-body">
                                                <form method="POST" action="Usuario">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Número de cédula</label>
                                                                <input type="text" class="form-control" placeholder="Numero de documento" name="txtId" value="<%= usVO.getIdentificacionUsu()%>" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Nombres y apellidos</label>
                                                                <input type="text" class="form-control" placeholder="Nombre completo" name="txtnombre" value="<%= usVO.getNombreUsu()%>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Número teléfonico</label>
                                                                <input type="text" class="form-control" placeholder="Teléfono" name="txttelefono" value="<%= usVO.getTelefonoUsu()%>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <%if (usVO.getRolId() == "1") {%>Rol Actual: <strong>Admnistrador</strong><%}%>
                                                            <%if (usVO.getRolId() == "2") {%>Rol Actual: <strong>Cocinero</strong><%}%>
                                                            <%if (usVO.getRolId() == "3") {%>Rol Actual: <strong>Mesero</strong><%}%>
                                                            <%if (usVO.getRolId() == "4") {%>Rol Actual: <strong>Recepcionista</strong><%}%>
                                                            <div class="form-group">
                                                                <label>Nuevo rol en el sistema</label>
                                                                <select name="txtrol" class="form-control">
                                                                    <option value="1">Admnistrador</option>
                                                                    <option value="2">Cocinero</option>
                                                                    <option value="3">Mesero</option>
                                                                    <option value="4">Recepcionista</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="input-group-append">
                                                                    <input type="hidden" readonly="true" id="pass<%=i%>" class="form-control" value="<%= usVO.getClaveUsu()%>" name="txtclave">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 pr-1">
                                                            <div class="form-group">
                                                                <label>Direccion de domicilio</label>
                                                                <input type="text" class="form-control" placeholder="Direcion" name="txtdireccion" value="<%= usVO.getDireccionUsu()%>">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 pr-1">
                                                            <div class="form-group">
                                                                <label>E-mail</label>
                                                                <input type="email" class="form-control" placeholder="E-mail" name="txtemail" value="<%= usVO.getEmailUsu()%>">
                                                                <small id="emailHelp" class="form-text text-muted">Nunca usaremos tu correo para enviarte spam.</small>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <hr>
                                                    <div col-md-12>
                                                        <div class="form-group">
                                                            Al continuar con el registro acepta los <a href="#">Terminos & Condiciones</a> y los terminos de <a href="#">tratamiento de datos</a>.
                                                        </div>
                                                    </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-round" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-round btn-warning" name="opcion" value="2">Actualizar</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="ModalDetalles<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Detalles de registro en el sistema de <strong><%= usVO.getNombreUsu()%></strong></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div> 
                                            <div class="modal-body">
                                                <form method="POST" action="Usuario">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <h4>
                                                                El usuario <strong><%= usVO.getNombreUsu()%></strong> identificado con la 
                                                                Cedula de ciudadania No.<strong><%= usVO.getIdentificacionUsu()%></strong> está registrado en el sistema como 
                                                                <%if (usVO.getRolId().equals("1")) {%><strong>Administrador</strong>.<%}%>
                                                                <%if (usVO.getRolId().equals("2")) {%><strong>Cocinero</strong>.<%}%>
                                                                <%if (usVO.getRolId().equals("3")) {%><strong>Mesero</strong>.<%}%>
                                                                <%if (usVO.getRolId().equals("4")) {%><strong>Recepcionista</strong>.<%}%>
                                                                Su forma de contacto telefonico es <strong><%= usVO.getTelefonoUsu()%></strong> y 
                                                                su correo electronico es <strong><%= usVO.getEmailUsu()%></strong>
                                                                Su domicilio se ubica en la direccion <strong><%= usVO.getDireccionUsu()%></strong> por motivos de seguridad, la clave del
                                                                usuario, no se permite la visualizacion de su contraseña, en tal caso de que 
                                                                el usuario haya olvidado su contraseña, de click en 
                                                                <a href="#">Recuperar contraseña</a>, allí podra solicitar la recuperacion de su contraseña.

                                                            </h4>
                                                        </div>
                                                    </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-round" data-dismiss="modal">Cerrar</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <%}
                                    }%>
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
                    <div class="col-md-12">
                        <% if (request.getAttribute("MensajeExitoA") != null) {
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
                        <% if (request.getAttribute("MensajeExitoA") != null) {%>

                        <div class="alert alert-success alert-dismissible fade show">
                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                <i class="nc-icon nc-check-2"></i><br>
                            </button>
                            <span>
                                <b> Exito - </b> El usuario se actualizo correctamente</span>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="modal fade" id="ModalReg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Registrar usuario</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="Usuario">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Número de cédula </label><sup style="color: red;">(*)</sup>
                                                <input type="text" class="form-control" placeholder="Numero de documento" name="txtId" value="" maxlength="11" pattern="[0-9]{1,11}" title="Solo se adminten numeros" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Nombres y apellidos </label><sup style="color: red;">(*)</sup>
                                                <input type="text" class="form-control" placeholder="Nombre completo" name="txtnombre" value=""  maxlength="11" pattern="[A-Za-z]{1,12}"  required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Número teléfonico </label><sup style="color: red;">(*)</sup>
                                                <input type="text" class="form-control" placeholder="Teléfono" name="txttelefono" value="" maxlength="16" pattern="[0-9]{1,16}" title="Solo se adminten numeros" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Rol en el sistema </label><sup style="color: red;">(*)</sup>
                                                <select name="txtrol" class="form-control">
                                                    <option value="1">Admnistrador</option>
                                                    <option value="2">Cocinero</option>
                                                    <option value="3">Mesero</option>
                                                    <option value="4">Recepcionista</option>
                                                </select>
                                            </div>
                                        </div>
                                        

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 pr-1">
                                            <div class="form-group">
                                                <label>Direccion de domicilio </label><sup style="color: red;">(*)</sup>
                                                <input type="text" class="form-control" placeholder="Direcion" name="txtdireccion" value="" maxlength="12" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-12 pr-1">
                                            <div class="form-group">
                                                <label>E-mail</label><sup style="color: red;">(*)</sup>
                                                <input type="email" class="form-control" placeholder="E-mail" name="txtemail" value="" maxlength="20">
                                                <small id="emailHelp" class="form-text text-muted">Nunca usaremos tu correo para enviarte spam.</small>
                                            </div>
                                        </div>

                                    </div>
                                    <hr>
                                    <div col-md-12>
                                        <div class="form-group">
                                            Al continuar con el registro acepta los <a href="#" class="text-info" >Terminos & Condiciones</a> y los terminos de <a href="#" class="text-info">tratamiento de datos</a>.
                                        </div>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-round btn-secondary" data-dismiss="modal">Cerrar</button>
                                <button type="submit" class=" btn btn-round btn-success" name="opcion"  value="1">Registrar</button>

                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <jsp:include page="templates/footer.jsp" />
            </div>
        </div>
        <!--   Core JS Files   -->
        <jsp:include page="templates/scripts.jsp" />






    </body>

</html>
