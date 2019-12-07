<%-- 
    Document   : Mesa_CRUD
    Created on : 20/08/2019, 08:53:05 PM
    Author     : René
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.mesaDAO"%>
<%@page import="modeloVO.mesaVO"%>
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

                <div class="content">
                    <div class="row">
                        <div class="col-md-4">


                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Mesas</h5>
                            </div>
                            <div class="card-body">
                                <form method="POST" action="Mesa" name="formulario">
                                    <div class="row">
                                        <div class="col-md-5 pr-1">
                                            <div class="form-group">
                                                <label>Codigo Mesa</label>
                                                <input type="number" class="form-control" placeholder="IdMesa" name="txtIdMesa">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Capacidad</label>
                                                <input type="number" class="form-control" placeholder="Capacidad" name="txtCapacidadMesa">
                                            </div>
                                        </div>


                                    </div>
                                    <div class="row">

                                        <div class="col-md-6 pl-1">
                                            <div class="form-group">
                                                <label>Estado</label>
                                                <select name="txtEstadoMesa" class="form-control">
                                                    <option value="ocupada">ocupada</option>
                                                    <option value="vacia">vacia</option>

                                                </select>
                                            </div>
                                        </div>

                                    </div>


                                    <div class="row">

                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">                                                
                                                <label>Descrición</label>
                                                <input type="text" class="form-control" placeholder="Descripcion" name="txtDescripcionMesa">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="update ml-auto mr-auto">
                                            <button type="submit" class="btn" name="btn" value="1">Registrar</button>
                                            <button type="submit" class="btn" name="btn" value="2">Actualizar</button>
                                            <button type="submit" class="btn" name="btn" value="3">Eliminar</button>
                                        </div>
                                    </div>
                                    <%
                                        if (request.getAttribute("MensajeError") != null) { %>

                                    ${MensajeError}

                                    <%
                                    } else {
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
                                <th>IdMesa</th>
                                <th>Capacidad</th>
                                <th>Estado</th>
                                <th>Descripcion</th>

                                </thead>
                                <%
                                    mesaVO mesVO = new mesaVO();
                                    mesaDAO mesDAO = new mesaDAO();
                                    ArrayList<mesaVO> listarMesa = mesDAO.listar();

                                    for (int i = 0; i < listarMesa.size(); i++) {

                                        mesVO = listarMesa.get(i);

                                %>
                                <tbody>
                                    <tr>
                                        <td><%=mesVO.getIdMesa()%></td>
                                        <td><%=mesVO.getCapacidadMesa()%></td>
                                        <td><%=mesVO.getDescripcionMesa()%></td>
                                        <td><%=mesVO.getEstadoMesa()%></td>


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
    <jsp:include page="templates/scripts.jsp" />
</body>

</html>
