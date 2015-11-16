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

<style>
    .pay-id{
        float: left;
        margin-left: 18%;
    }
    .pay-item{
        float: left;
        margin-left: 10%;
    }
    .pay-id-order{
        float: left;
        margin-left: 21%;
    }
    .pay-item-order{
        float: left;
        margin-left: 11%;
        width: 10%
    }
    div.product-text{
        clear: left;
        display: inline-block;
        margin-left: 50px;
        margin-top: 30px;
    }
    .button{
        text-decoration:none; 
        text-align:center; 
 padding:5px 5px; 
 border:solid 1px #004F72; 
 -webkit-border-radius:4px;
 -moz-border-radius:4px; 
 border-radius: 4px; 
 font:12px Arial, Helvetica, sans-serif; 
 font-weight:bold; 
 color:#E5FFFF; 
 background-color:#3BA4C7; 
 background-image: -moz-linear-gradient(top, #3BA4C7 0%, #1982A5 100%); 
 background-image: -webkit-linear-gradient(top, #3BA4C7 0%, #1982A5 100%); 
 background-image: -o-linear-gradient(top, #3BA4C7 0%, #1982A5 100%); 
 background-image: -ms-linear-gradient(top, #3BA4C7 0% ,#1982A5 100%); 
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1982A5', endColorstr='#1982A5',GradientType=0 ); 
 background-image: linear-gradient(top, #3BA4C7 0% ,#1982A5 100%);   
 -webkit-box-shadow:0px 0px 2px #bababa, inset 0px 0px 1px #ffffff; 
 -moz-box-shadow: 0px 0px 2px #bababa,  inset 0px 0px 1px #ffffff;  
 box-shadow:0px 0px 2px #bababa, inset 0px 0px 1px #ffffff;
    }
</style>

</head>
<body>
<center>
  <div class="wrapper">
    <div class="logo"> Shop<strong>Online</strong></div>
    <div class="menu">
      <ul class="solidblockmenu">
        <li><a href="products.jsp?page_id=1">Home</a></li>
        <li><a href="category.jsp">Categories</a></li>
        <li><a href="deals.jsp">Hot Deals</a></li>
        <li><a href="order.jsp">Place Order</a></li>
        <li><a href="track_your_order.jsp"> Track Your Order </a></li>
        <li><a href="../api/logout.jsp"> Logout </a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
        <%
try
{
// Test the DB connection by making an empty table
String checkQuery = "SELECT * FROM voucher_table";

Class.forName( driver );
// initialize the Connection, with our DB info ...
Connection con = DriverManager.getConnection( url, name, pass );
Statement stat = con.createStatement();
%>
<%
ResultSet rs = stat.executeQuery(checkQuery);






%>


    <p class='pay-id'>Voucher ID</p>
    <p class='pay-item'>Discount Amount (Rs)</p>
    <p class='pay-item'>Threshold Amount (Rs)</p>
    <p class='pay-item'>Expiration Date</p>
    
    <% while(rs.next()){
        int id = rs.getInt("voucher_id");
        %>
    
        <p class='pay-id-order'> <%= rs.getString("voucher_id") %></p>
        <p class='pay-item-order'> <%= rs.getString("discount_amount") %></p>
        <p class='pay-item-order'> <%= rs.getString("threshold_amount") %></p>
        <p class='pay-item-order'> <%= rs.getString("expiration_date") %> &nbsp; &nbsp;&nbsp;<br/><br/> <u>
    <% } %>
    
    <br/>
    <br/>
    
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
