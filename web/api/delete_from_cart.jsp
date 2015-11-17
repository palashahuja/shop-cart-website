<%-- 
    Document   : delete_from_cart
    Created on : 17 Nov, 2015, 8:54:06 AM
    Author     : palash
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%

String pid = (String) request.getParameter("id");
ArrayList<String> ar =  (ArrayList<String>) session.getAttribute("cart");
ArrayList<String> new_arr = new ArrayList<>();
for(String product_id : ar){
    if(!product_id.equals(pid))
        new_arr.add(product_id);
}
session.setAttribute("cart", new_arr);
response.sendRedirect("../views/order.jsp");

// the "url" to our DB, the last part is the name of the DB
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title> -->
    </head>
    <body>
   
    </body>
</html>
