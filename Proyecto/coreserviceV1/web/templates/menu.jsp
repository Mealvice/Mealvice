<%-- 
    Document   : menu
    Created on : 03-sep-2019, 22:27:30
    Author     : Lenovo
--%>
<%@page import="modeloVO.UsuarioVO"%>
<%
    HttpSession sesion2 = (HttpSession) request.getSession();
    UsuarioVO usuVO = (UsuarioVO) sesion2.getAttribute("usuario");
%>
<div class="sidebar" data-color="white" data-active-color="danger">
    <!--
      Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
    <div class="logo">
        <a href="" class="simple-text logo-normal">
            <div class="logo-image-big">
                <img src="img/Logo-nombre-3.png">
            </div>
        </a>
    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li>
                <a href="MenuPrincipal.jsp">
                    <i class="nc-icon nc-bank "></i>
                    <p>Inicio</p>
                </a>
            </li>
            <li>
                <a href="PerfilUsuario.jsp">
                    <i class="nc-icon nc-badge"></i>
                    <p>Perfil</p>
                </a>
            </li>

            <hr>
            <%if (usuVO.getRolId().equals("1") || usuVO.getRolId().equals("2") || usuVO.getRolId().equals("3")) {
            %>
            <li >
                <a href="HomePedidos.jsp">
                    <i class="nc-icon nc-paper"></i>
                    <p>Pedidos</p>
                </a>
            </li>
            <%}%>
            <%if (usuVO.getRolId().equals("1") || usuVO.getRolId().equals("4")) {
            %>
            <li>
                <a href="consMesa.jsp">
                    <i class="nc-icon nc-layout-11"></i>
                    <p>Mesas</p>
                </a>
            </li>
            <%}%>
            <%if (usuVO.getRolId().equals("1")) {
            %>
            <li >
                <a href="HomeUsuarios.jsp">
                    <i class="nc-icon nc-single-02"></i>
                    <p>Usuarios</p>
                </a>
            </li>
            <li>
                <a href="consProducto.jsp">
                    <i class=" nc-icon nc-cart-simple"></i>
                    <p>Productos</p>
                </a>
            </li>
            <li>
                <a href="consCarta.jsp">
                    <i class="nc-icon nc-map-big"></i>
                    <p>Carta</p>
                </a>
            </li>
            <%}%>

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
                <a class="navbar-brand" href="#pablo">Bienvenido a Mealservice</a>
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
                    <!--Cocinero
                    <li class="nav-item">
                        <a class="nav-link btn-magnify" href="#pablo">
                            <i class="nc-icon nc-cart-simple"></i><sup style="color: red;">1</sup>
                        </a>
                    </li>
                    <!--Cocinero
                    <li class="nav-item">
                        <a class="nav-link btn-magnify" href="#pablo">
                            <i class="nc-icon nc-delivery-fast"></i>
                            <sup style="color: red;">1</sup>
                            <sup style="color: red;"><i class="nc-icon nc-check-2" style="color: green;"></i></sup>
                            <p>
                                <span class="d-lg-none d-md-block">Stats</span>
                            </p>
                        </a>
                    </li>-->
                    
                    <li class="nav-item">
                        <a class="nav-link btn-magnify" href="PerfilUsuario.jsp">
                            <strong><i class="nc-icon nc-circle-10 nc-button-power" title="Perfil"></i><%=usuVO.getNombreUsu() %></strong>
                            <p>
                                <span class="d-lg-none d-md-block">Perffil de usuario</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-magnify" href="#" data-toggle="modal" data-target="#exampleModal">
                            <i class="nc-icon nc-button-power" title="Cerrar Sesion"></i>
                            <p>
                                <span class="d-lg-none d-md-block">Cerrar Sesión</span>
                            </p>
                        </a>
                    </li>
                </ul>

            </div>

        </div>

    </nav>
    <form method="post" action="Sesiones">
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title center" id="exampleModalLabel">Cerrar Sesión</h5>
                    </div>
                    <div class="modal-body">

                        <h2 class="text-center">¿DESEAS CERRAR LA SESIÓN?</h2>
                        <center><i class="nc-icon nc-user-run fa-5x"></i></center>
                        <p class="text-center">Al cerrar la sesión, es posible que se pierdan los datos que aun no han sido guardados, 
                            en tal caso, vuelva y guarde los datos.</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal">No, continuar!</button>
                        <button type="submit" class="btn btn-success"  value="Cerrar Sesion" >Si, salir!</button>
                    </div>
                </div>
            </div>
        </div>
    </form>