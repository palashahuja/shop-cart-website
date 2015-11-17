<%-- 
    Document   : orderpage
    Created on : Nov 13, 2015, 12:10:26 PM
    Author     : Atul Patnigere
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%
String DBNAME = "shop_cart";
// mysql driver
String driver = "com.mysql.jdbc.Driver";
String pname = request.getParameter("username");
String password = request.getParameter("password");
// the "url" to our DB, the last part is the name of the DB
String url = "jdbc:mysql://localhost/" + DBNAME;
// the default DB username and password may be the same as your control panel login

String name = "root";
String pass = "";
%>
<!DOCTYPE html>
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
         <li><a href="adminportal.jsp">Dashboard</a></li>
        <li><a href="adminproduct.jsp?page_id=1">Products</a></li>
        <li><a href="orderpage.jsp">Orders</a></li>
        <li><a href="payments.jsp">Payments</a></li>
        <li><a href="http://all-free-download.com/free-website-templates/">Offers & Discounts</a></li>
        <li><a href="editproduct.jsp">Add New Products</a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
        <%
try
{
// Test the DB connection by making an empty table
String checkQuery = "SELECT * FROM order_table";

Class.forName( driver );
// initialize the Connection, with our DB info ...
Connection con = DriverManager.getConnection( url, name, pass );
Statement stat = con.createStatement();
%>
<%
ResultSet rs = stat.executeQuery(checkQuery);






%>

<table cols="5" name="orders" border="2">
    <tr><th>Order ID</th><th>Shipping Address</th><th>User ID</th><th>Discount (Rs)</th><th>Total Price(Rs)</th></tr>
    <% while(rs.next()){ %>
    <tr>
        <td> <%= rs.getString(1) %></td>
        <td> <%= rs.getString(2) %></td>
        <td> <%= rs.getString(3) %></td>
        <td> <%= rs.getString(4) %></td>
        <td> <%= rs.getString(5) %></td>
    </tr>
    <% } %>
</table>

<%
// close connection
con.close();
}
catch (SQLException sqle)
{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }
catch(ClassNotFoundException cnfe)
{ out.println("<p> Error opening JDBC, cause:</p> <b>" + cnfe + "</b>");}
%>
    </body>
</html>
