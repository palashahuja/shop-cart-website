<%-- 
    Document   : editproduct
    Created on : Nov 12, 2015, 6:37:34 PM
    Author     : Atul Patnigere
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="http://all-free-download.com/free-website-templates/">Products</a></li>
        <li><a href="orderpage.jsp">Orders</a></li>
        <li><a href="http://all-free-download.com/free-website-templates/">Payments</a></li>
        <li><a href="http://all-free-download.com/free-website-templates/">Offers & Discounts</a></li>
        <li><a href="editproduct.jsp">Add New Products</a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
    <div style="float: none">
        <table cols="2" align="center">       
        <form action="updateproduct.jsp" name="upproduct">
            <tr><td><u><b>Name:</b></u>&nbsp;</td><td> <input type="text" name="pname" /> <br></td></tr>
            <tr><td><u><b>Price:</b></u>&nbsp;</td><td> <input type="text" name="pprice" /> <br></td></tr>
            <tr><td><u><b>Availability:</b></u>&nbsp;</td><td> <input type="text" name="avail" /> <br></td></tr>
            <tr><td><u><b>Category:</b></u>&nbsp;</td><td> <input type="text" name="cat" /> <br></td></tr>
            <tr><td><u><b>Description:</b></u>&nbsp;</td><td> <textarea name="desc" rows="4" cols="10"></textarea> <br></td></tr>
            <tr><td><u><b>Add Image:</b></u>&nbsp;</td><td> <input type="image" name="img"/><br></td></tr>
            <tr><td colspan="2">    <input type="submit" name="submit" value="Add" /></td></tr>
                
                
        </form>
        </table>
    </div>
</center>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>

