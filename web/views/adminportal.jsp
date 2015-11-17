
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <li><a href="adminportal.jsp">Dashboard</a></li>
        <li><a href="adminproduct.jsp?page_id=1">Products</a></li>
        <li><a href="orderpage.jsp">Orders</a></li>
        <li><a href="payments.jsp">Payments</a></li>
        <li><a href="discounts.jsp">Offers & Discounts</a></li>
        <li><a href="editproduct.jsp">Add New Products</a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
    <div>
       <% try
{
// Test the DB connection by making an empty table
String checkQuery = "SELECT COUNT(*) FROM product_table";

String checkQuery1 = "SELECT COUNT(*) AS PR_C FROM order_detail_table WHERE order_date > ?;";

Class.forName( driver );
// initialize the Connection, with our DB info ...
Connection con = DriverManager.getConnection( url, name, pass );
PreparedStatement stat1 = con.prepareStatement(checkQuery1);
Statement stat = con.createStatement();
%>
<%
ResultSet rs = stat.executeQuery(checkQuery);
java.util.Date tempDate = new java.util.Date();
java.sql.Date currentDate = new java.sql.Date(tempDate.getTime() - 7*24*60*60*1000);
stat1.setDate(1, currentDate);
ResultSet rs1 = stat1.executeQuery();
rs.next();
int count = rs.getInt(1);
rs1.next();
int deliveryCount = rs1.getInt("PR_C");

/*if(rs.next()){
    
}
else{
    session.setAttribute("errorMsg", "password or email is incorrect");
    session.setAttribute("previouspage", "../views/loginandregisterpage.html");
    response.sendRedirect("../views/errormsg.jsp");
}*/
%>
<u><h2>Welcome Administrator</h2></u>
<br/><br/>
<h3>Total No. of Products: </h3><%= count%>
<h3>Orders Placed Last Week: </h3> <%= deliveryCount %>

<%
// close connection
con.close();
}
catch (SQLException sqle)
{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }
catch(ClassNotFoundException cnfe)
{ out.println("<p> Error opening JDBC, cause:</p> <b>" + cnfe + "</b>");}
%>
    </div>
</center>

</html>