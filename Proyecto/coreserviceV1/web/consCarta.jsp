<%-- 
    Document   : ProductoPla
    Created on : 20/08/2019, 08:53:05 PM
    Author     : jlemu
--%>

<%@page import="modeloDAO.cartaDAO"%>
<%@page import="modeloVO.cartaVO"%>
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
                                                <% if (request.getAttribute("MensajeErrorR") != null) {%>
                                                <div class="alert alert-danger alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-simple-remove"></i>
                                                    </button>
                                                    <span>
                                                        <b> Error - </b> La carta de ese día ya se encuantra registrada</span>
                                                </div>
                                                <%}%>
                                                <% if (request.getAttribute("MensajeExitoR") != null) {%>

                                                <div class="alert alert-success alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-check-2"></i><br>
                                                    </button>
                                                    <span>
                                                        <b> Exito - </b> La carta se registró correctamente</span>
                                                </div>
                                                <%}%>
                                                <% if (request.getAttribute("MensajeErrorA") != null) {%>
                                                <div class="alert alert-danger alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-simple-remove"></i>
                                                    </button>
                                                    <span>
                                                        <b> Error - </b> Se produjo un error</span>
                                                </div>
                                                <%}%>
                                                <% if (request.getAttribute("MensajeExitoA") != null) {%>

                                                <div class="alert alert-success alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-check-2"></i><br>
                                                    </button>
                                                    <span>
                                                        <b> Exito - </b> La carta se actualizó corectamente</span>
                                                </div>
                                                <%}%>
                    </div>
                </div>


                <div class="card-body">
                    <div class="col-md-12">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Cartas</h5>
                            </div>
                            <div class="col-md-6 pr-1">
                                <div class="input-group no-border">
                                    <a style="color: #fff;" class=" btn fa fa-plus-circle a"  data-toggle="modal" data-target="#ModalReg">Registrar Carta</a>
                                </div>
                            </div>
                            <div class="col-md-12 pr-1">
                                <form method="POST" action="Carta" >
                                    <div class="table-responsive">
                                    <table class="table table-striped table-bordered" id="FormCarta">
                                        <thead class=" text-primary">
                                        <th>Código Carta</th>
                                        <th>Día</th>
                                        <th>Acciones</th>

                                        </thead>
                                        <%
                                            cartaVO carVo = new cartaVO();
                                            cartaDAO carDAO = new cartaDAO(carVo);
                                            ArrayList<cartaVO> listarCarta = carDAO.listar();
                                            //if(request.getAttribute("columna")!= null){
                                            //  int co = Integer.parseInt(request.getAttribute("columna").toString());

                                            for (int i = 0; i < listarCarta.size(); i++) {
                                                //if(i==co)
                                                carVo = listarCarta.get(i);
                                                //}
                                        %>
                                        <tbody>
                                            <tr >
                                                <td><%=carVo.getIdCarta()%></td>
                                                <td><%=carVo.getDiaCarta()%></td>

                                                    <!--<button type="submit" class="nc-icon nc-zoom-split btn btn-round" name="btn"  value="5" ></button>-->
                                                    <td><a class="nc-icon nc-ruler-pencil btn" title="Actualizar Carta" href="detalleCartaControlador?btn=Consultar&txtidCarta=<%=carVo.getIdCarta()%>"></a></td>
                                            </tr>
                                            <%}
                                            %>

                                        </tbody>
                                    </table>
                                            </div>
                                            </div>
                                    <div class="card-body">
                                        <div class="">
                                            
                                            <div class="col-md-12">
                                                
                                            </div>
                                            <form method="POST" action="Carta" >
                                                <div class="modal fade" id="ModalReg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document" style="">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Registrar Carta</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="col-md-4 pr-1">
                                                                        <div class="form-group">
                                                                            <label>Codigo Carta</label>
                                                        <%
                                                            int count;
                                                            int resultado;
                                                            cartaVO pediVO = new cartaVO();
                                                            cartaDAO pediaDAO = new cartaDAO();
                                                            ArrayList<cartaVO> listarc = pediaDAO.listarc();
                                                            for (int i = 0; i < listarc.size(); i++) {
                                                                pediVO = listarc.get(i);
                                                                String resul = String.valueOf(pediVO.getCount());
                                                                count = Integer.parseInt(resul);
                                                                resultado = count + 1;
                                                        %>
                                                        <input type="number" class="form-control"  placeholder="CodCarta" value="<%=resultado%>" name="txtidCarta" readonly>
                                                        <%}%>
                                                                            
                                                                            
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6 pl-1">
                                                                        <div class="form-group">
                                                                            <label>Dia</label>
                                                                            <select name="txtDiaCarta" class="form-control">
                                                                                <option value="...">Dia...</option>
                                                                                <option value="Lunes">Lunes</option>
                                                                                <option value="Martes">Martes</option>
                                                                                <option value="Miercoles">Miercoles</option>
                                                                                <option value="Jueves">Jueves</option>
                                                                                <option value="Viernes">Viernes</option>
                                                                                <option value="Sabado">Sabado</option>
                                                                                <option value="Domingo">Domingo</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>

                                                                </div>




                                                            </div>
                                                            <div class="modal-footer">
                                                                <button class="btn btn-round" data-dismiss="modal">Cerrar</button>
                                                                <button type="submit" class="nc-icon nc-ruler-pencil btn btn-round btn-success" name="btn"  value="Registrar">Registrar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>



                                            </form>


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

