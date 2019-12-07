<%-- 
    Document   : Menu
    Created on : 27-ago-2019, 15:18:15
    Author     : Lenovo
--%>

<%@page import="modeloDAO.mesaDAO"%>
<%@page import="modeloVO.mesaVO"%>
<%@page import="modeloDAO.productoDAO"%>
<%@page import="modeloVO.productoVO"%>
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
    <jsp:include page="../templates/head.jsp" />
    <body class="">
        <div class="wrapper ">
            <jsp:include page="../templates/menu.jsp" />
            <div class="content">
                <div class="card card-user">
                    <%if (usuVO.getRolId().equals("4")) {%>
                    <center><br><br>
                        <div class="col-lg-auto">
                            <div class="card card-stats">
                                <div class="card-body ">
                                    <div class="row">
                                        <div class="col-12 col-md-5">
                                            <div class="icon-big text-center icon-warning">
                                                <i class="nc-icon nc-simple-remove text-danger"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-5 pr-1">
                                            <h1>ESTE MODULO NO ESTÁ DISPONIBLE</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </center>
                    <%}%>
                    <%if (usuVO.getRolId().equals("3") || usuVO.getRolId().equals("1")) {
                    %>

                    <div class="card-header">
                        <h5 class="card-title">Registrar Pedido</h5>
                    </div>
                    <div class="card-body">
                        <form method="post" action="Pedido" id="registrar">
                            <div class="row">

                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>N° Pedido</label>
                                        <%
                                            int count;
                                            int resultado;
                                            pedidoVO pediVO = new pedidoVO();
                                            pedidoDAO pediDAO = new pedidoDAO();
                                            ArrayList<pedidoVO> listarc = pediDAO.listarc();
                                            for (int i = 0; i < listarc.size(); i++) {
                                                pediVO = listarc.get(i);
                                                String resul = String.valueOf(pediVO.getCount());
                                                count = Integer.parseInt(resul);
                                                resultado = count + 1;
                                        %>
                                        <input type="number" class="form-control"  placeholder="N° Pedido" value="<%=resultado%>" name="txtidPedido" readonly>
                                        <%}%>
                                    </div>
                                </div>

                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Mesero</label>
                                        <input type="number" class="form-control"  placeholder="Mesero" value="<%=usuVO.getIdentificacionUsu()%>" name="txtidUsuario" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Estado</label>
                                        <input type="number" class="form-control"  placeholder="Espera" value="Espera" name="txtestadoPedido" readonly>
                                    </div>
                                </div>

                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Mesa</label>

                                        <%
                                            mesaVO mesVO = new mesaVO();
                                            mesaDAO mesDAO = new mesaDAO();
                                            ArrayList<mesaVO> listarMesaD = mesDAO.listarD();
                                            if (listarMesaD.size() <= 0) {%>
                                        <div class="alert alert-warning alert-dismissible fade show">
                                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                <i class="nc-icon nc-simple-remove"></i><br>
                                            </button>
                                            <span>
                                                <b> Advertencia - </b> No hay mesas disponibles</span>
                                        </div>
                                        <%} else {%><select class="form-control" name="txtidMesa"><option selected="true" disabled="disabled">seleccione una mesa...</option><%
                                            for (int i = 0; i < listarMesaD.size(); i++) {
                                                mesVO = listarMesaD.get(i);
                                            %>
                                            <option  value="<%=mesVO.getIdMesa()%>">No Mesa: <%=mesVO.getIdMesa()%>, capacidad: <%=mesVO.getCapacidadMesa()%></option>
                                            <%}
                                                }%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <%String produ[] = new String[10];%>
                            <div class="row">
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Productos seleccionados</label>
                                        <div class="control-styles">
                                            <div class="">
                                                <table class="table table-hover table-bordered">
                                                    <thead class=" text-primary">
                                                        <tr>
                                                            <th>1</th>
                                                            <th>1</th>
                                                            <th>1</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <%for (int i = 0; i < produ.length; i++) {%>
                                                            <td><%=produ[i]%></td>
                                                            <% }%>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label for="carta" >Productos En carta</label>
                                        <div class="">
                                            <table class="table table-hover table-bordered">
                                                <thead class=" text-primary">
                                                    <tr>
                                                        <th>Producto</th>
                                                        <th>Precio</th>
                                                        <th> </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        productoVO proVO = new productoVO();
                                                        productoDAO proDAO = new productoDAO();
                                                        ArrayList<productoVO> listarProducto = proDAO.listar();

                                                        for (int i = 0; i < listarProducto.size(); i++) {

                                                            proVO = listarProducto.get(i);
                                                    %>
                                                    <tr>
                                                        <td><%=proVO.getNombreProducto()%></td>
                                                        <td>$<%=proVO.getPrecioProducto()%></td>
                                                        <td><input type="button" class="btn btn-round" onclick="<%produ[i] = proVO.getNombreProducto();%>" value="+"></td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Observacion</label>
                                        <textarea class="form-control textarea" name="txtobservacionPedido"></textarea>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="update ml-auto mr-auto">
                                    <button type="submit" class="btn btn-round" name="boton" value="Registrar">Registrar</button>
                                </div>

                            </div>
                            <div class="row">
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
                                            <b> Exito - </b> El pedido se registró corectamente</span>
                                    </div>
                                    <%}%>
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


