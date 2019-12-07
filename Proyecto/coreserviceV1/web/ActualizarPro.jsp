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
                <!--Producto-->
                <div class="content">

                    <div class="row">
                        <div class="col-md-4">


                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card card-user">
                            <div class="card-header">
                                 <h6><a class=" fa fa-reply-all btn btn-round" href="consProducto.jsp" style="float: right">Volver</a></h6>
                                <h5 class="card-title">Registrar Productos a la carta</h5>
                                
                            </div>
                            <div class="card-body">
                               
                                
                                <form method="post" action="Producto">
                                    <div class="table-responsive">
                                        <table class="table" id="tabla">
                                            <thead class=" text-primary">
                                            <th>NoProduco</th>
                                            <th>Nombre</th>
                                            <th>Precio</th>
                                            <th>Tipo Producto</th>
                                            <th>Estado</th>
                                            <th class="text-right"> </th>
                                            </thead>
                                            <tbody>
                                                <%
                                            productoVO proVo = (productoVO) request.getAttribute("voLlenoC");
                                            if (proVo == null) {%>
                                            </tbody>
                                        </table>
                                        <div class="alert alert-info alert-dismissible fade show">
                                            <span>
                                                <b> Información - </b>Aqui aparecerá el producto que desea actualizar</span>
                                        </div>
                                        <%} else {%>
                                        <tr>
                                            <td><%= proVo.getIdProducto()%></td>
                                            <td><%= proVo.getNombreProducto()%></td>
                                            <td>  <%= proVo.getPrecioProducto()%> </td>
                                            <td>  <%= proVo.getTipoProducto()%> </td>
                                            <td>  <%= proVo.getEstadoProducto()%> </td>
                                            <td class="text-right" ><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#ModalActu">EDITAR</button> </td>
                                        </tr>
                                        <%}%>
                                        </tbody>
                                        </table>
                                        
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                       
                        <div class="table-responsive">
                            <form method="POST" action="Producto" >
                                
                                       
                                        
                                        <%
                                        productoVO prodVo = (productoVO) request.getAttribute("voLlenoC");
                                        if (prodVo != null) {
                                    %>
                                    
                                    <div class="modal fade" id="ModalActu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Actualizar producto</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">

                                                        <div class="col-md-5 pr-1">
                                                            <div class="form-group">
                                                                <label>No Producto</label>
                                                                <input type="number" class="form-control"  placeholder="N° producto" value="<%=prodVo.getIdProducto()%>" name="txtNoPro" readonly>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-5 pr-1">
                                                            <div class="form-group">
                                                                <label>Nombre</label>
                                                                <input type="text" class="form-control" placeholder="Nombre" value="<%=prodVo.getNombreProducto()%>" name="txtNombre" required="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-5 pr-1">
                                                            <div class="form-group">
                                                                <label>Precio</label>
                                                                <input type="number" class="form-control" placeholder="Precio" name="txtPrePro" value="<%=prodVo.getPrecioProducto()%>" required="">
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




                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                    <button type="submit" class="nc-icon nc-ruler-pencil btn btn-round" name="btn"  value="2">Guardar Cambios</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <%}%>
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

