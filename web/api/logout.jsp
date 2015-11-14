<%-- 
    Document   : logout
    Created on : 14 Nov, 2015, 2:52:16 PM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("../views/loginandregisterpage.html");
            %>
    </body>
</html>
