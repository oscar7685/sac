<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Object texto=request.getAttribute("texto");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edificio</title>
    </head>
    <body>
        
        <h1>Estamo en la vista edificio <%=texto %></h1>
    </body>
</html>