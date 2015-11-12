<%-- 
    Document   : sample_load_products.jsp
    Created on : 27 Oct, 2015, 2:31:57 PM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    String productQuery = "SELECT * FROM product_table";
    String driverName = "com.mysql.jdbc.Driver";
    String dbSelectURL =  "jdbc:mysql://localhost/shop_cart";
    String dbName = "root";
    String dbPassword = "";
    try{
    Class.forName(driverName);
    Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(productQuery);
    while(rs.next()){
        String productName = rs.getString("name");
        out.println(productName);
        String imagePath = rs.getString("image_path");
        if(!imagePath.equals("")){
        out.println("<br>");
        out.println("<img width = '300px' height= '500px' src=");
        out.println(imagePath);
        out.println("/>");
        }
        out.print("<br>");
    }
    }
    catch(Exception e){
        out.println("error<br>");e.printStackTrace();
    }
%>
       
    </body>
</html>
