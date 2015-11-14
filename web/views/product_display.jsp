<%-- 
    Document   : product_display
    Created on : 12 Nov, 2015, 2:20:24 AM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Shop Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../css/homestyle.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="../css/style-ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<style>
    div.product-text{
        clear: left;
        display: inline-block;
        margin-left: 50px;
        margin-top: 30px;
    }
    .button{
        text-decoration:none; 
        text-align:center; 
 padding:11px 11px; 
 border:solid 1px #004F72; 
 -webkit-border-radius:4px;
 -moz-border-radius:4px; 
 border-radius: 4px; 
 font:18px Arial, Helvetica, sans-serif; 
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
        <li><a href="http://all-free-download.com/free-website-templates/">Home</a></li>
        <li><a href="category.jsp">Categories</a></li>
        <li><a href="products.jsp">Products</a></li>
        <li><a href="deals.jsp">Hot Deals</a></li>
        <li><a href="order.jsp">Place Order</a></li>
        <li><a href="add_to_cart.jsp">Add to Cart</a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  <div class="search">
    <div class="search-text"> Search the world of shopping!&nbsp;
      <input type="text" size="40" />
      &nbsp;&nbsp;</div>
    <div style="float:left; margin-left:5px; margin-top:10px;">
      <input type="image" src="../images/search.jpg" />
    </div>
  </div>
  <div class="hot-search">
    <div class="hot-search-text"> Hot Searches: Apple iPod Nano, Hugo Boss Clothing, HD DVD Player, DSLR Camera, Toshiba 32&quot; LCD TV, Unsecured Loans, Excersise Machines..</div>
  </div>
</center>
    <%!
        String productId,productName,productPrice, productDescription, imagePath;
        %>
    <%
        String productId = request.getParameter("id");
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
               imagePath = rs.getString("image_path");
            }
    }
    catch(Exception e){
        out.println("error<br>");e.printStackTrace();
    }
    %> 
    		   
    <img style='float: left; margin: 40px;' src='<%=imagePath%>'></img>
    <div class ='product-text'>
        <h3><%=productName%></h3>
        <p><%=productDescription%></p>
        <h3>Price: Rs.<%=productPrice%></h3>      
    </div>
        <a href="../api/cart.jsp?id=<%=productId  %>&page_id=1" id="add-to-cart" class="button">Add to Cart</a>
        <a href="../api/cart.jsp?id=<%=productId  %>&page_id=2" id="buy-now" class="button">Buy Now</a>
    </body>
</html>
        
        