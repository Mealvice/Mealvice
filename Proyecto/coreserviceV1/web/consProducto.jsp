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
                                    <b> Exito - </b> El producto se registró corectamente</span>
                            </div>
                            <%}%>
                        </div>


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
                                    <b> Exito - </b> El producto se actualizó corectamente</span>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="col-md-12">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Gestión de Productos</h5>
                            </div>
                            <div class="col-md-6 pr-1">
                                <div class="input-group no-border">
                                    <button class="btn text-cente"  data-toggle="modal" data-target="#ModalReg"><i class="nc-icon nc-simple-add fa-1x"></i> Registrar producto</button>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <div class="table">
                                        <table class="table table-striped table-bordered" id="FormProd">
                                            <thead class=" text-primary">
                                            <th>Nombre</th>
                                            <th>Precio</th>
                                            <th>Tipo Producto</th>
                                            <th>Estado</th>
                                            <th>Editar</th>
                                            </thead>
                                            <tbody>
                                                <%
                                                    productoVO proVO = new productoVO();
                                                    productoDAO proDAO = new productoDAO();
                                                    ArrayList<productoVO> listarProducto = proDAO.listar();
                                                    for (int i = 0; i < listarProducto.size(); i++) {
                                                        proVO = listarProducto.get(i);
                                                %>

                                                <tr >
                                                    <td hidden=""><%=proVO.getIdProducto()%></td>
                                                    <td><%=proVO.getNombreProducto()%></td>
                                                    <td>$<%=proVO.getPrecioProducto()%></td>
                                                    <td><%=proVO.getTipoProducto()%></td>
                                                    <td><%=proVO.getEstadoProducto()%></td>
                                                    <!--<button type="submit" class="nc-icon nc-zoom-split btn btn-round" name="btn"  value="5" ></button>-->
                                                    <td><a class="nc-icon nc-ruler-pencil btn" style="color:#fff;" title="Actualizar"  data-toggle="modal" data-target="#ModalActualizar<%=i%>"></a></td>
                                                </tr>
                                            <div class="modal fade" id="ModalActualizar<%=i%>" tabindex="-1" role="dialog" aria-labelledby="editUsua" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Modificando el producto <strong><%=proVO.getNombreProducto()%></strong></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div> 
                                                        <div class="modal-body">
                                                            <form method="POST" action="Producto" >
                                                                <div class="row">
                                                                    <input type="hidden" class="form-control" placeholder="ID"  name="txtNoPro" required="" value="<%=proVO.getIdProducto()%>" hidden>
                                                                    <div class="col-md-5 pr-1">
                                                                        <div class="form-group">
                                                                            <label>Nombre</label>
                                                                            <input type="text" class="form-control" placeholder="Nombre"  name="txtNombre" required="" value="<%=proVO.getNombreProducto()%>"  maxlength="20">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Precio</label>
                                                                            <input type="text" class="form-control" placeholder="Precio" name="txtPrePro" required="" value="<%=proVO.getPrecioProducto()%>" maxlength="11" pattern="[0-9]{1,11}" title="Solo se adminten numeros" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6 pl-1">
                                                                        <div class="form-group">
                                                                            <label>Tipo de Producto</label>
                                                                            <select name="txtTiProducto" class="form-control" value="<%=proVO.getTipoProducto()%>">
                                                                                <option value="plato">Plato</option>
                                                                                <option value="bebida">Bebida</option>
                                                                                <option value="adicional">Adicional</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Nuevo Estado </label><small>El sestado actual es <strong><%=proVO.getEstadoProducto()%></strong></small>
                                                                            <select name="txtEstPro" class="form-control" <%=proVO.getEstadoProducto()%>>
                                                                                <option value="activo">Activo</option>
                                                                                <option value="agotado">Agotado</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button class="btn" data-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn btn-warning" name="opcion" value="2">Actualizar</button>
                                                        </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}
                                            %>
                                            </tbody>
                                        </table>
                                    </div>       
                                </div>
                            </div>




                            <form method="POST" action="Producto" >
                                <div class="modal fade" id="ModalReg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Registrar producto</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <%
                                                                int count;
                                                                int resultado;
                                                                productoVO pediVO = new productoVO();
                                                                productoDAO pediDAO = new productoDAO();
                                                                ArrayList<productoVO> listarc = pediDAO.listarc();
                                                                for (int i = 0; i < listarc.size(); i++) {
                                                                    pediVO = listarc.get(i);
                                                                    String resul = String.valueOf(pediVO.getCount());
                                                                    count = Integer.parseInt(resul);
                                                                    resultado = count + 1;
                                                            %>
                                                            <input type="hidden" class="form-control"  placeholder="ID" value="<%=resultado%>" name="txtNoPro" readonly>
                                                            <%}%>


                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Nombre</label>
                                                            <input type="text" class="form-control" placeholder="Nombre"  name="txtNombre" required="" maxlength="20" spellcheck=false"">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Precio</label>
                                                            <input type="text" class="form-control" placeholder="Precio" name="txtPrePro" maxlength="11" pattern="[0-9]{1,11}" title="Solo se adminten numeros" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Tipo de Producto</label>
                                                            <select name="txtTiProducto" class="form-control">
                                                                <option value="plato">Plato</option>
                                                                <option value="bebida">Bebida</option>
                                                                <option value="adicional">Adicional</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
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
                                                <button type="submit" class=" btn" name="opcion"  value="1">Registrar</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        </form>
                    </div>
                    <jsp:include page="templates/footer.jsp" />
                </div>
            </div>
        </div>
        <!--   Core JS Files   -->
        <jsp:include page="templates/scripts.jsp" />
    </body>

</html>

