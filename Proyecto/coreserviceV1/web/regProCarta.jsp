<%-- 
    Document   : ProductoPla
    Created on : 20/08/2019, 08:53:05 PM
    Author     : jlemu
--%>

<%@page import="modeloDAO.detalleCartaDAO"%>
<%@page import="modeloVO.detalleCartaVO"%>
<%@page import="modeloVO.cartaVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.productoDAO"%>
<%@page import="modeloVO.productoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <!--Producto-->
            <div class="content">

                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-12">

                            <% if (request.getAttribute("MensajeErrorR") != null) {%>
                            <div class="alert alert-danger alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span>
                                    <b> Error - </b> Se produjo un error</span>
                            </div>
                            <%}%>
                            <% if (request.getAttribute("MensajeExitoR") != null) {%>

                            <div class="alert alert-success alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-check-2"></i><br>
                                </button>
                                <span>
                                    <b> Exito - </b> El producto se agregó correctamente</span>
                            </div>
                            <%}%>
                            <% if (request.getAttribute("MensajeExitoE") != null) {%>

                            <div class="alert alert-success alert-dismissible fade show">
                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                    <i class="nc-icon nc-check-2"></i><br>
                                </button>
                                <span>
                                    <b> Exito - </b> Se ha eliminado el producto de la carta correctamente</span>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card card-user">
                        <div class="card-header">
                            <h6><a class="btn" href="consCarta.jsp" style="float: right">Terminar</a><a class=" fa fa-reply-all btn" href="consCarta.jsp" style="float: right">Volver</a></h6>
                            <%
                                String idCarta = String.valueOf(request.getAttribute("id"));
                            %>
                            <h5 class="card-title">Registrar Productos a la carta #<%=idCarta%></h5>
                        </div>
                        <div class="card-body">
                            <form method="post" action="detalleCartaControlador">
                                <input type="hidden" class="form-control"  placeholder="N° producto" value="<%=idCarta%>" name="txtidCarta" readonly>
                                <button type="button" class="btn" data-toggle="modal" data-target="#ModalAgregar">Agregar Producto</button>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered" id="example">
                                        <thead class=" text-primary">

                                        <th>Nombre</th>
                                        <th>Precio</th>
                                        <th>Tipo Producto</th>
                                        <th class="text-right">Acciones</th>

                                        </thead>
                                        <%

                                            productoVO proDetVO = new productoVO();
                                            productoDAO proDEtDAO = new productoDAO(proDetVO);
                                            ArrayList<productoVO> listarProductoDet = proDEtDAO.listarId(idCarta);
                                            //if(request.getAttribute("columna")!= null){
                                            //  int co = Integer.parseInt(request.getAttribute("columna").toString());

                                            for (int i = 0; i < listarProductoDet.size(); i++) {
                                                //if(i==co)
                                                proDetVO = listarProductoDet.get(i);
                                                //}
                                        %>
                                        <tbody>
                                            <tr >

                                                <td><%=proDetVO.getNombreProducto()%></td>
                                                <td><%=proDetVO.getPrecioProducto()%></td>
                                                <td><%=proDetVO.getTipoProducto()%></td>
                                                <td><a class="btn text-right" href="detalleCartaControlador?btn=Eliminar&txtIdProducto=<%=proDetVO.getIdProducto()%>&txtidCarta=<%=idCarta%>">Eliminar</a></td>
                                            </tr>
                                            <%}
                                            %>

                                        </tbody>
                                    </table>
                                </div>


                                <%%> 
                                <h6></h6>
                                <div class="modal fade modal-md" id="ModalAgregar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Agregar productos</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-bordered" id="TablaProductosRegCarta">
                                                                <thead class=" text-primary">
                                                                <th>Nombre</th>
                                                                <th>Precio</th>
                                                                <th>Tipo Producto</th>
                                                                <th>Agregar producto</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        productoVO proVO = new productoVO();
                                                                        productoDAO proDAO = new productoDAO();
                                                                        ArrayList<productoVO> listarProducto = proDAO.listar();
                                                                        //if(request.getAttribute("columna")!= null){
                                                                        //  int co = Integer.parseInt(request.getAttribute("columna").toString());

                                                                        for (int i = 0; i < listarProducto.size(); i++) {
                                                                            //if(i==co)
                                                                            proVO = listarProducto.get(i);
                                                                            //}
                                                                    %>

                                                                    <tr>
                                                                        <td><%=proVO.getNombreProducto()%></td>
                                                                        <td><%=proVO.getPrecioProducto()%></td>
                                                                        <td><%=proVO.getTipoProducto()%></td>
                                                                        <td><a class=" btn" href="detalleCartaControlador?btn=Registrar&txtIdProducto=<%=proVO.getIdProducto()%>&txtidCarta=<%=idCarta%>">+</a></td>
                                                                    </tr>
                                                                    <%}
                                                                    %>

                                                                </tbody>
                                                            </table>
                                                        </div>

                                                    </div>



                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

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
        <jsp:include page="templates/footer.jsp" />
    </div>
</div>
<!--   Core JS Files   -->
<jsp:include page="templates/scripts.jsp" />
</body>

</html>

