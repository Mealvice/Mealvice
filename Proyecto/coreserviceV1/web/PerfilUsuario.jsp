<%-- 
    Document   : PerfilUsuario
    Created on : 26-oct-2019, 18:31:37
    Author     : Lenovo
--%>

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
            <div class="content">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image" style="background-image: url(img/Users/<%=usuVO.getRolId()%>.png); background-repeat: no-repeat;background-position: top; background-size: 90%; ">


                            </div>
                            <div class="card-body">
                                <div class="author">
                                    <a href="#">
                                        <img class="avatar border-gray" src="assets/img/user.png" alt="...">
                                        <h5 class="title"><%=usuVO.getNombreUsu()%></h5>
                                    </a>
                                    <p class="description">
                                        <%=usuVO.getEmailUsu()%>
                                    </p>
                                </div>
                            </div>
                            <div class="card-footer">
                            </div>
                        </div>
                        <!--<div class="card">
                          <div class="card-header">
                            <h4 class="card-title">Team Members</h4>
                          </div>
                          <div class="card-body">
                            <ul class="list-unstyled team-members">
                              <li>
                                <div class="row">
                                  <div class="col-md-2 col-2">
                                    <div class="avatar">
                                      <img src="../assets/img/faces/ayo-ogunseinde-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                    </div>
                                  </div>
                                  <div class="col-md-7 col-7">
                                    DJ Khaled
                                    <br />
                                    <span class="text-muted">
                                      <small>Offline</small>
                                    </span>
                                  </div>
                                  <div class="col-md-3 col-3 text-right">
                                    <btn class="btn btn-sm btn-outline-success btn-round btn-icon"><i class="fa fa-envelope"></i></btn>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="row">
                                  <div class="col-md-2 col-2">
                                    <div class="avatar">
                                      <img src="../assets/img/faces/joe-gardner-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                    </div>
                                  </div>
                                  <div class="col-md-7 col-7">
                                    Creative Tim
                                    <br />
                                    <span class="text-success">
                                      <small>Available</small>
                                    </span>
                                  </div>
                                  <div class="col-md-3 col-3 text-right">
                                    <btn class="btn btn-sm btn-outline-success btn-round btn-icon"><i class="fa fa-envelope"></i></btn>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="row">
                                  <div class="col-md-2 col-2">
                                    <div class="avatar">
                                      <img src="../assets/img/faces/clem-onojeghuo-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                    </div>
                                  </div>
                                  <div class="col-ms-7 col-7">
                                    Flume
                                    <br />
                                    <span class="text-danger">
                                      <small>Busy</small>
                                    </span>
                                  </div>
                                  <div class="col-md-3 col-3 text-right">
                                    <btn class="btn btn-sm btn-outline-success btn-round btn-icon"><i class="fa fa-envelope"></i></btn>
                                  </div>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>-->
                    </div>
                    <div class="col-md-8">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Editar Perfil</h5>
                            </div>
                            <div class="card-body">
                                 <% if (request.getAttribute("MensajeExitoA") != null) {%>

                                                 <div class="alert alert-info">
                                    
                                    <strong>Información!</strong> Los cambios se verán aplicados <strong>la proxima vez que inicie sesión</strong>.
                                </div>
                                                <%}%>
                               
                                <form action="Usuario" method="POST">
                                    <div class="row">
                                        <div class="col-md-5 pr-1">
                                            <div class="form-group">
                                                <label>Número de Cédula</label>
                                                <input type="number" class="form-control" readonly placeholder="" value="<%=usuVO.getIdentificacionUsu()%>" name="txtId">
                                            </div>
                                        </div>
                                        <div class="col-md-3 px-1">
                                            <div class="form-group">
                                                <label>Nombres y apellidos</label>
                                                <input type="text" class="form-control" placeholder="Username" value="<%=usuVO.getNombreUsu()%>" name="txtnombre" maxlength="2" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-4 pl-1">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Correo electrónico</label>
                                                <input type="email" class="form-control" value="<%=usuVO.getEmailUsu()%>" name="txtemail" maxlength="30" required="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Clave</label>
                                                <input type="password" onkeyup="validar()" class="form-control" placeholder="Clave" value="<%=usuVO.getClaveUsu()%>" name="txtclave" maxlength="11" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Validar clave</label>
                                                <input type="password" onkeyup="validar()" class="form-control" placeholder="Clave" value="" name="ValClave" maxlength="11" required="">
                                                <small id="mensajePass"></small>
                                            </div>
                                        </div>
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Número Telefónico</label>
                                                <input type="text" class="form-control" placeholder="Telefono" value="<%=usuVO.getTelefonoUsu()%>" name="txttelefono"  maxlength="11" pattern="[0-9]{1,11}" title="Solo se adminten numeros" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Dirección</label>
                                                <input type="text" class="form-control" placeholder="Home Address" value="<%=usuVO.getDireccionUsu()%>" name="txtdireccion"  maxlength="11">
                                                <input type="hidden" class="form-control" placeholder="Home Address" value="<%=usuVO.getRolId()%>" name="txtrol">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="update ml-auto mr-auto">
                                            <button type="submit" class="btn btn-round" id="ActualiPerfil" name="opcion" value="7">Actualizar Perfil</button>
                                        </div>
                                    </div>
                                </form>
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
                                        <a href="pagPrincipal.jsp" target="">Inicio</a>
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
<jsp:include page="templates/scripts.jsp" />
    </div>

</body>
</html>
