<%-- 
    Document   : ProductoPla
    Created on : 20/08/2019, 08:53:05 PM
    Author     : jlemu
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.productoDAO"%>
<%@page import="modeloVO.productoVO"%>
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
  <link rel="icon" type="image/png" href="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Mealvice
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
                        <li >
                            <a href="pedidos.jsp">
                                <i class="nc-icon nc-paper"></i>
                                <p>Pedidos</p>
                            </a>
                        </li>
                        <li class="active ">
                            <a>
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
                  <form method="POST" action="Producto" name="formulario">
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>Codigo Producto</label>
                        <input type="text" class="form-control" placeholder="IdProducto" name="txtNoPro">
                      </div>
                    </div>

                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" placeholder="Nombre" name="txtNombre">
                      </div>
                    </div>
                     <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Precio</label>
                        <input type="number" class="form-control" placeholder="Precio" name="txtPrePro">
                      </div>
                    </div>
                    
                  </div>
                  <div class="row">
                   
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>Tipo de Producto</label>
                        <select name="txtTiProducto" class="form-control">
                            <option value="plato">Plato</option>
                            <option value="bebida">Bebida</option>
                          <option value="adicional">Adicional</option>
                        </select>
                      </div>
                    </div>
                     <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>Estado</label>
                        <select name="txtEstPro" class="form-control">
                          <option value="activo">Activo</option>
                          <option value="agotado">Agotado</option>
                          
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                        <button type="submit" class="btn btn-round" name="btn" value="1">Registrar</button>
                         
                          
                        
                      <button type="submit" class="btn btn-round " name="btn" value="2">Actualizar</button>
                      <button type="submit" class="btn btn-round" name="btn" value="3">Eliminar</button>
                    </div>
                  </div>
                      <%
            if(request.getAttribute("MensajeError")!= null){ %>
              
            ${MensajeError}
                
                <%
                    }else{
                %>
                ${MensajeExito}
                <%
                    }
                %>
                </form>
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
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                     <th>NoProduco</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Tipo Producto</th>
                            <th>Estado</th>
                    </thead>
                      <%
                        
                        productoVO proVO = new productoVO();
                        productoDAO proDAO = new productoDAO();
                        ArrayList<productoVO>listarProducto = proDAO.listar();
                        
                        for(int i = 0; i< listarProducto.size();i++){
                        
                        proVO= listarProducto.get(i);

                        %>
                    <tbody>
                      <tr>
                        <td><%=proVO.getIdProducto()%></td>
                        <td id="nomPro"><%=proVO.getNombreProducto()%></td>
                        <td><%=proVO.getPrecioProducto()%></td>
                        <td><%=proVO.getTipoProducto()%></td>
                        <td><%=proVO.getEstadoProducto()%></td>
                        <td class="text-center">
                           <form>
                            <!--<a class="btn btn-warning" href="Producto?accion=editar&id=<//%= proVO.getIdProducto()%>" name="btn" value="4" >Editar</a>-->
                            </form>
                            
                            <form method="POST" action="Producto?id=<%= proVO.getIdProducto()%>" >
<!--                            <button type="submit" class="btn btn-warning" name="btn" value="4">Editar</button>-->
                            </form>
                            
                            
                            
                           
                        </td>
                      </tr>
                      <%}%>
                    
                    </tbody>
                  </table>
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
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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
