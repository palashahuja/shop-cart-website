<%-- 
    Document   : cart
    Created on : 12 Nov, 2015, 5:18:50 AM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%!
        String productId,productName,productPrice, productDescription, imagePath;
        %>
        <%
        productId = request.getParameter("id");
    %>
    <%
        if(null == session.getAttribute("cart")){
            ArrayList<String> ar = new ArrayList<>();
            ar.add(productId);
            session.setAttribute("cart", ar);
        }
        else{
            ArrayList<String> ar = (ArrayList<String>) session.getAttribute("cart");
            ar.add(productId);
            session.setAttribute("cart", ar);
        }
  
        String pageId = request.getParameter("page_id");
        if(pageId.equals("1")){
        response.sendRedirect("../views/products.jsp?page_id=1");
        }
        else if(pageId.equals("2")){
        response.sendRedirect("../views/order.jsp");
        }
        %>
    </body>
</html>
