<%-- 
    Document   : ProductoPla
    Created on : 20/08/2019, 08:53:05 PM
    Author     : Rene
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.mesaDAO"%>
<%@page import="modeloVO.mesaVO"%>
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
                    <div class="col-md-4">


                    </div>
                </div>


                <div class="card-body">
                    <div class="col-md-12">

                        <div class="col-md-12">
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
                                    <b> Exito - </b> La mesa se actualizó correctamente</span>
                            </div>
                            <%}%>
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
                                    <b> Exito - </b> La mesa se registró correctamente</span>
                            </div>
                            <%}%>
                        </div>
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Gestión de Mesas</h5>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-6 pr-1">
                                    <div class="input-group no-border">
                                        <button class="btn text-center"  data-toggle="modal" data-target="#ModalRegi"><i class="nc-icon nc-simple-add fa-1x"></i> Añadir mesa</button>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <br>
                                    <%
                                        mesaVO mesVO = new mesaVO();
                                        mesaDAO mesDAO = new mesaDAO();
                                        ArrayList<mesaVO> listarProducto = mesDAO.listar();
                                        //if(request.getAttribute("columna")!= null){
                                        //  int co = Integer.parseInt(request.getAttribute("columna").toString());

                                        for (int i = 0; i < listarProducto.size(); i++) {
                                            //if(i==co)
                                            mesVO = listarProducto.get(i);
                                            //}
                // style="background-color: #b21f2d; color: white; border-radius: 20px;" Inactiva
                                            //style="background-color: #28a745; color: white; border-radius: 20px;" Activa
%>


                                    <form method="POST" action="Mesa" >
                                        <input type="hidden" value="<%=mesVO.getIdMesa()%>" name="txtIdMesa" class="form-control" readonly>
                                        <div class="card" style="width: 10rem; height: 15rem;" style="">
                                            <%if (mesVO.getEstadoMesa().equals("ocupada")) {
                                            %> <div class="card-body" style="background-color: white; border: 6px solid #b21f2d; color: black; border-radius: 10px;"><%
                                                }
                                                if (mesVO.getEstadoMesa().equals("Sin Pedido")) {
                                                %> <div class="card-body" style="background-color: white; border: 6px solid #ffcc00; color: black; border-radius: 10px;"><%
                                                }
                                                if (mesVO.getEstadoMesa().equals("vacia")) {
                                                    %><div class="card-body" style=" background-color: white; border: 6px solid #28a745; color: black; border-radius: 10px;"><%}%>
                                                        <%%>
                                                        <h5 class="card-title">La mesa <b>#<%= mesVO.getIdMesa()%></b> está <%=mesVO.getEstadoMesa()%></h5>
                                                        <p>Capacidad: <b><%=mesVO.getCapacidadMesa()%> Personas</b></p>
                                                        <%if (mesVO.getEstadoMesa().equals("ocupada")) {
                                                        %><button type="submit" class="btn btn-round" name="btn" value="5"style="background-color: #b21f2d;" title="Click para cambiar a 'Vacía' el estado de la mesa">Vaciar</button>
                                                        <%
                                                            }
                                                            if (mesVO.getEstadoMesa().equals("vacia")) {
                                                        %><button type="submit" class="btn btn-round" name="btn" value="6"style="background-color: #28a745;" title="Click para cambiar a 'Ocupado' el estado de la mesa">Usar</button><br>
                                                        <%}%>
                                                    </div>
                                                </div>
                                                </form>   
                                                <%}%>
                                            </div>





                                        </div>
                                </div>
                            </div>



                            <div class="col-md-12">

                            </div>






                            <form method="POST" action="Mesa" >
                                <div class="modal fade" id="ModalRegi" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Registrar mesa</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>

                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-6 pr-1">
                                                        <div class="form-group">
                                                            <label>Nº mesa</label>
                                                            <%
                                                                int count;
                                                                int resultado;
                                                                mesaVO mesaCountVO = new mesaVO();
                                                                mesaDAO mesaCountDAO = new mesaDAO();
                                                                ArrayList<mesaVO> listarCountMesa = mesaCountDAO.CountMesa();
                                                                for (int i = 0; i < listarCountMesa.size(); i++) {
                                                                    mesaCountVO = listarCountMesa.get(i);
                                                                    String resul = String.valueOf(mesaCountVO.getCount());
                                                                    count = Integer.parseInt(resul);
                                                                    resultado = count + 1;
                                                            %>
                                                            <input type="text" class="form-control" placeholder="Nº mesa"  name="txtIdMesa" value="<%=resultado%>" required="" readonly>
                                                            <%}%>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 pr-1">
                                                        <div class="form-group">
                                                            <label>Capacidad</label>
                                                            <input type="number" class="form-control" placeholder="Capacidad"  name="txtCapacidadMesa" required="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 pl-1">
                                                        <div class="form-group">
                                                            <label>Estado</label>
                                                            <select name="txtEstadoMesa" class="form-control" readonly>
                                                                <option value="vacia">vacía</option>
                                                            </select>
                                                            <small>Incialmente el estado de una mesa será <b>Vacia</b>.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class=" btn btn-success" name="btn"  value="1">Registrar</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>



                        </div>
                    </div>
                    </form>
                </div>




                <footer class="footer footer-black  footer-white ">
                    <div class="container-fluid">
                        <div class="row">
                            <nav class="footer-nav">
                                <ul>
                                    <li>
                                        <a href="ActualizarMesa.jsp" target="">Inicio</a>
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
</div>
<jsp:include page="templates/scripts.jsp" />
</body>

</html>

