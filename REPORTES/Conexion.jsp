<%-- 
    Document   : Conexion
    Created on : 18/09/2019, 08:06:33 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            Connection con = null;
            try {
                    
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/coreservicebd", "root", "");
                out.print("conexion en linea");
                } catch (Exception e) {
                    out.print(e.getMessage());
                }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
