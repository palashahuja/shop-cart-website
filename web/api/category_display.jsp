<%-- 
    Document   : category_display
    Created on : 14 Nov, 2015, 3:53:48 PM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
    <%
        String category = (String) request.getParameter("category");
        String sortCategory = (String) request.getParameter("sort");
        out.println(category);
        out.println(sortCategory);
        session.setAttribute("category", category);
        session.setAttribute("sort", sortCategory);
        response.sendRedirect("../views/category.jsp");
        %>
    </body>
</html>
