<%-- 
    Document   : Producto
    Created on : 13/08/2019, 11:17:03 PM
    Author     : jlemu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.productoDAO"%>
<%@page import="modeloVO.productoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <title>Producto</title>
    </head>
    <body>

        <div class="navegador">
            <div class="nombreForm"><h2>Productos</h2></div>
            <div class="divbtnNav">
                <form method="post" action="Mesa.html">
                    <input type="submit" name="btnMesa" value="Mesa" class="botonNav">
                </form>
                <form method="post" action="Carta.html">
                    <input type="submit" name="btnCarta" value="Carta" class="botonNav">
                </form>
                <form method="post" action="Pedido.html">
                    <input type="submit" name="btnPedido" value="Pedido" class="botonNav">
                </form>
                <form method="post" action="Empleados.html">
                    <input type="submit" name="btnEmpleados"value="Empleados" class="botonNav">
                </form>
            </div>
            <div class="divCerrarSesion">
                <input type="submit" name="btnCerrarSesion"value="Cerrar Sesion" class="botonNav">
            </div>
        </div>

        <div class="divBody">
            <form method="POST" action="Producto">
                <div id="1" class="izq">
                    <label class="label">No Producto</label>
                    <input type="text" name="txtNoPro" class="txtNormal">
                    <br>
                    <br>
                    <br>
                    <label class="label">Nombre</label>
                    <input type="text" name="txtNombre" class="txtNormal">
                    <br>
                    <br>
                    <br>
                    <label class="label">Precio</label>
                    <input type="number" name="txtPrePro" class="txtNormal">


                </div>

                <div id="2" class="izq">

                    <label class="label" >Tipo Producto</label>

                    <select name="txtTiProducto" >
                        <option value="Plato">Plato</option>
                        <option value="Bebida">Bebida</option>
                        <option value="Adicional">Adicional</option>
                    </select>

                    <label class="label" >Estado</label>

                    <select name="txtEstPro" >
                        <option value="Activo">Activo</option>
                        <option value="Agotado">Agotado</option>
                    </select>

                </div>


                <div id="botones" >

                    <input class="botonesN" type="submit" name="Registrar" value="Registrar">
                    <input type="hidden" value="1" name="opcion">
                    </form>                
                    <br>
                    <br>
                    <form>
                        <input class="botonesN" type="submit" name="Actializar" value="Actializar">
                        <input type="hidden" value="2" name="opcion">
                    </form>
                    <br>
                    <br>
                    <form>
                        <input class="botonesN" type="submit" name="Eliminar" value="Eliminar">
                    </form>


                </div>

                <br><br><br><br><br>

                <div>
                    <div class="table">
                                    <table class="table table-striped table-bordered" id="example">
                            <thead>    
                                <tr>
                                    <th>NoProduco</th>
                                    <th>Nombre</th>
                                    <th>Precio</th>
                                    <th>Tipo Producto</th>
                                    <th>Estado</th>


                                </tr>
                            </thead>   
                            <%

                                productoVO proVO = new productoVO();
                                productoDAO proDAO = new productoDAO();
                                ArrayList<productoVO> listarProducto = proDAO.listar();

                                for (int i = 0; i < listarProducto.size(); i++) {

                                    proVO = listarProducto.get(i);

                            %>
                            <tr>
                                <td><%=proVO.getIdProducto()%></td>
                                <td><%=proVO.getNombreProducto()%></td>
                                <td><%=proVO.getPrecioProducto()%></td>
                                <td><%=proVO.getTipoProducto()%></td>
                                <td><%=proVO.getEstadoProducto()%></td>


                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div id="buscar" class="divBuscar">
                        <br>

                        <h2>Consulta Especifica</h2>
                        <label class="label">No Producto</label>
                        <input type="text" name="txtBuscar" class="txtNormal">

                    </div>

                </div>
                <div class="base">
                    <p><img src="img/TituloPeq.png" align="left"><img src="img/admin.png" align="right"></p>
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
    </body>
</html>
