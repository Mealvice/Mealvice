<%-- 
    Document   : Menu
    Created on : 27-ago-2019, 15:18:15
    Author     : Lenovo
--%>

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
            <div class="content">
                <div class="row">
                    <div class="col-lg-6 col-md-9 col-sm-9">
                        <div class="card card-stats">
                            <div class="card-body ">
                                <div class="row">
                                    <div class="col-5 col-md-4">
                                        <div class="icon-big text-center icon-warning">
                                            <i class="nc-icon nc-single-02 text-success"></i>
                                        </div>
                                    </div>
                                    <div class="col-7 col-md-8">
                                        <div class="numbers">
                                            <p class="card-category">Nombre de usuario</p>
                                            <p class="card-title"><%=usuVO.getNombreUsu()%>
                                            <p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer ">
                                <hr>
                                <div class="stats">
                                    <i class="fa fa-refresh"></i><%=usuVO.getIdentificacionUsu()%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-9 col-sm-9">
                        <div class="card card-stats">
                            <div class="card-body ">
                                <div class="row">
                                    <div class="col-5 col-md-4">
                                        <div class="icon-big text-center icon-warning">
                                            <i class="nc-icon nc-badge text-info"></i>
                                        </div>
                                    </div>
                                    <div class="col-7 col-md-8">
                                        <div class="numbers">
                                            <p class="card-category">Rol en el sistema</p>
                                            <%if (usuVO.getRolId().equals("1")) {
                                            %><p class="card-title">Administrador<%
                                                }
                                                if (usuVO.getRolId().equals("2")) {
                                                %><p class="card-title">Cocinero<%}%>
                                                <%if (usuVO.getRolId().equals("3")) {
                                                %><p class="card-title">Mesero<%
                                                    }
                                                    if (usuVO.getRolId().equals("4")) {
                                                %><p class="card-title">Recepcionista<%}%>
                                            <p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
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
                            <a href="" target="_blank">Inicio</a>
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
    <jsp:include page="templates/scripts.jsp" />
</body>

</html>

