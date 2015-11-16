<%-- 
    Document   : editproduct
    Created on : Nov 12, 2015, 6:37:34 PM
    Author     : Atul Patnigere
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin Portal</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../css/homestyle.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="../css/style-ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
<center>
  <div class="wrapper">
    <div class="logo"> Shop<strong>Online</strong></div>
    <div class="menu">
      <ul class="solidblockmenu">
        <li><a href="adminproduct.jsp?page_id=1">Products</a></li>
        <li><a href="orderpage.jsp">Orders</a></li>
        <li><a href="payments.jsp">Payments</a></li>
        <li><a href="http://all-free-download.com/free-website-templates/">Offers & Discounts</a></li>
        <li><a href="editproduct.jsp">Add New Products</a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
    <%!
        String productId,productName,productPrice, productDescription, avail, cat, imagePath;
        %>
    <%
        String productId = request.getParameter("id");
        out.println(productId);
        session.setAttribute("product_id", productId);
        String productQuery = "SELECT * FROM product_table where product_id=" + "'" + productId + "';";
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
               productName = rs.getString("name");
               productPrice = rs.getString("price");
               productDescription = rs.getString("description");
               avail = rs.getString("availability");
               cat = rs.getString("category");
               imagePath = rs.getString("image_path");
            }
    }
    catch(Exception e){
        out.println("error<br>");e.printStackTrace();
    }
    %>
    <div style="float: none">
        <table cols="2" align="center">       
        <form action="../api/updateproduct.jsp" method="post" name="upproduct" enctype="multipart/form-data">
            <tr><td><u><b>Name:</b></u>&nbsp;</td><td> <input type="text" name="pname" placeholder="name" /> <br></td></tr>
            <tr><td><u><b>Price:</b></u>&nbsp;</td><td> <input type="text" name="pprice" value="price"<%= productPrice%>" /> <br></td></tr>
            <tr><td><u><b>Availability:</b></u>&nbsp;</td><td> <input type="text" name="avail" value="<%= avail%>" /> <br></td></tr>
            <tr><td><u><b>Category:</b></u>&nbsp;</td><td> <input type="text" name="cat" value="<%= cat%>"/> <br></td></tr>
            <tr><td><u><b>Description:</b></u>&nbsp;</td><td> <textarea name="desc" rows="4" cols="10"><%= productDescription%></textarea> <br></td></tr>
            <tr><td><u><b>Add Image:</b></u>&nbsp;</td><td> <input type="file" name="img"/><br /></td></tr>
            <tr><td><input type="submit" name="submit" value="Edit" /></td></tr>
           
            <%
            if(session.getAttribute("error") != null){
                out.println("<tr><td><u><b>" + session.getAttribute("error") + "</tr></td></u></b>");
                session.setAttribute("error", null);
            }
            if(session.getAttribute("fileName") != null){
                out.println("File uploaded: ");
                out.println(session.getAttribute("fileName"));
                session.setAttribute("fileName", null);
            }
            
            %>
        </form>
        </table>
    </div>
</center>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>

