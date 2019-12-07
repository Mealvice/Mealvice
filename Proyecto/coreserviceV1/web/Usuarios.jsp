<%-- 
    Document   : ProductoPla
    Created on : 20/08/2019, 08:53:05 PM
    Author     : jlemu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
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
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
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
        <link href="estilos.css" rel="stylesheet" />
    </head>

    <body class="">
        <div class="wrapper ">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <!--
                  Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
                -->
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                        <div class="logo-image-small">
                            <img src="assets/img/logo-small.png">
                        </div>
                    </a>
                    <a href="http://www.creative-tim.com" class="simple-text logo-normal">
                        Mealservice
                        <!-- <div class="logo-image-big">
                          <img src="../assets/img/logo-big.png">
                        </div> -->
                    </a>
                </div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li class="active">
                            <a>
                                <i class="nc-icon nc-single-02"></i>
                                <p>Usuarios</p>
                            </a>
                        </li>
                        <li >
                            <a href="Pedidos.jsp">
                                <i class="nc-icon nc-paper"></i>
                                <p>Pedidos</p>
                            </a>
                        </li>
                        <li >
                            <a href="./map.html">
                                <i class=" nc-icon nc-cart-simple"></i>
                                <p>Productos</p>
                            </a>
                        </li>
                        <li>
                            <a href="./notifications.html">
                                <i class="nc-icon nc-map-big"></i>
                                <p>Carta</p>
                            </a>
                        </li>
                        <li>
                            <a href="./user.html">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Mesas</p>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
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
                            <a class="navbar-brand" href="#pablo">Gestion de Productos</a>
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
                                    <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <div class="row">
                        <div class="col-md-4">


                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Producto</h5>
                            </div>
                            <div class="card-body">
                                <form method="POST" action="Usuario">
                                    <div class="row">
                                        <div class="col-md-5 pr-1">
                                            <div class="form-group">
                                                <label> Identificación</label>
                                                <input type="text" class="form-control" placeholder="Numero de documento" name="txtId">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input type="text" class="form-control" placeholder="Nombre completo" name="txtnombre">
                                            </div>
                                            <div class="form-group">
                                                <label>Teléfono</label>
                                                <input type="text" class="form-control" placeholder="Teléfono" name="txttelefono">
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
                                                <input type="text" class="form-control" placeholder="Direcion" name="txtdireccion">
                                            </div>

                                            <div class="form-group">
                                                <label>E-mail</label>
                                                <input type="text" class="form-control" placeholder="E-mail" name="txtemail">
                                            </div>
                                            <div class="form-group">   
                                                <label>Clave</label>
                                                <input type="text" class="form-control" placeholder="Clave de acceso" name="txtclave">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-md-6 pl-1">

                                        </div>
                                        <div class="col-md-6 pl-1">
                                            <div class="form-group">




                                            </div>
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Descripcion</label>
                                                <textarea class="form-control textarea"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="update ml-auto mr-auto">
                                            <button type="submit" class="botonesN" name="opcion" value="1">Registrar</button>
                                            <button type="submit" class="botonesN " name="opcion" value="2">Actualizar</button>
                                            <button type="submit" class="botonesN" name="opcion" value="3">Eliminar</button>
                                        </div>
                                    </div>
                                </form>
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
                                    <table class="table" id="tabla">
                                        <thead class=" text-primary">
                                        <th>Identificacion</th>
                                        <th>Nombre de Usuario</th>
                                        <th>Telefono</th>
                                        <th>Direccion</th>
                                        <th>E-Mail</th>
                                        <th>Rol</th>
                                        <th>Clave</th>
                                        <th> </th>
                                        </thead>
                                        <tbody>
                                            <%
                                                UsuarioVO usVO = new UsuarioVO();
                                                UsuarioDAO usDAO = new UsuarioDAO();
                                                ArrayList<UsuarioVO> ListarUsuarios = usDAO.listar(); 
                                                if (ListarUsuarios.size() <= 0) {%>
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
                                        for (int i = 0; i < ListarUsuarios.size(); i++) {
                                            usVO = ListarUsuarios.get(i);
                                    %>
                                    <tr>
                                        <td> <%= usVO.getIdentificacionUsu()%>   </td>
                                        <td> <%= usVO.getNombreUsu()%>   </td>
                                        <td> <%= usVO.getTelefonoUsu()%>   </td>
                                        <td> <%= usVO.getDireccionUsu()%>   </td>
                                        <td> <%= usVO.getEmailUsu()%>   </td>
                                        <td> <%= usVO.getRolId()%>   </td>
                                        <td> <input type="password" readonly="true" class="form-control" value="<%= usVO.getClaveUsu()%>"></td>
                                        <td><input type="button" class="nc-icon nc-zoom-split btn btn-round" onclick="verPassword();"></td>
                                        
                                        
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

                    <div class="card-body">
                        <div class="col-md-6 pr-1">
                            <div class="input-group no-border">
                                <input type="text" value="" class="form-control" placeholder="Buscar..." id="buscarE">
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <i class="nc-icon nc-zoom-split"></i>
                                    </div>
                                </div>
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
