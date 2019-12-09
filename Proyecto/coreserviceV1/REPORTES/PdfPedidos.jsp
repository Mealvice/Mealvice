<%-- 
    Document   : PdfPedidos
    Created on : 24/09/2019, 05:50:04 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><%-- 
    Document   : Pdf
    Created on : 18/09/2019, 08:23:13 AM
    Author     : PC
--%>


<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.view.JasperViewer" %>
<%@page import="javax.servlet.ServletResponse" %>

<%@include file="Conexion.jsp" %>
<%@include file="pedido.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        File reportfile = new File (application.getRealPath("report1.jasper"));
        Map<String, Object> parameter = new HashMap<String, Object>();
        
         
       String valor = request.getParameter("txtparametro");
       
        parameter.put("id", new Integer(valor));
        byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(bytes,0, bytes.length);
        
        outputStream.flush();
        outputStream.close();
 
        %>
    </body>
</html>

        <h1>Hello World!</h1>
    </body>
</html>
