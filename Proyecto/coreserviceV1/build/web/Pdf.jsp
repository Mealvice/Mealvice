<%-- 
    Document   : Pdf
    Created on : 4/12/2019, 12:21:23 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>

<%@page import="javax.servlet.ServletResponse"%>
<%@include file="Conexion.jsp"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        File reportfile = new File (application.getRealPath("PedidoR.jasper"));
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        
        int valor = Integer.parseInt(request.getParameter("txtparametro"));
        parameter.put("pedido", new Integer(valor));
    
        byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        
outputstream.flush();
outputstream.close();
        %>
        
    </body>
</html>
