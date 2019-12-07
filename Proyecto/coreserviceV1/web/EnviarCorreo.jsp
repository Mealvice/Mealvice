<%-- 
    Document   : index
    Created on : 02-jul-2019, 17:06:16
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Correo con JAVA MAIL</h1>
        
        <form method="post" action="envioCorreo2" style="">
            <label>Para: </label><input type="text" name="receptor" value="" placeholder="Destinatario" size="50"/><br>
            <label>Asunto: </label><input type="text" name="asunto" value="" placeholder="Destinatario" size="50" /><br>
            <textarea name="contenido" rows="4" cols="50" size="50"></textarea>
            <input type="submit" value="Enviar">
        </form>
    </center>
</body>
</html>
