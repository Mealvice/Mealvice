<%-- 
    Document   : VistaReportes
    Created on : 25/09/2019, 08:42:27 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Vista Reportes</h1>
        
        <form name=" form1" action="PdfReportes.jsp">
            <input type="number" name ="txtparametro"/>
            <input type="submit" value="Genera PDF"/>
        </form>
    </body>
</html>
