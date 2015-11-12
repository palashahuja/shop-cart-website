<%-- 
    Document   : sample_load_products.jsp
    Created on : 27 Oct, 2015, 2:31:57 PM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style>
        ul.rig {
	list-style: none;
	font-size: 0px;
	margin-left: -2.5%; /* should match li left margin */
}
ul.rig li {
	display: inline-block;
	padding: 10px;
	margin: 0 0 2.5% 2.5%;
	background: #fff;
	border: 1px solid #ddd;
	font-size: 16px;
	font-size: 1rem;
	vertical-align: top;
	box-shadow: 0 0 5px #ddd;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}
ul.rig li a{
        text-decoration: none;
        color: #999;
}
ul.rig li a:hover{
        color: #333;
}
ul.rig li img {
	max-width: 100%;
	height: auto;
	margin: 0 0 10px;
}
ul.rig li h3 {
	margin: 0 0 5px;
}
ul.rig li p {
	font-size: .9em;
	line-height: 1.5em;
	color: #999;
}
/* class for 2 columns */
ul.rig.columns-2 li {
	width: 47.5%; /* this value + 2.5 should = 50% */
}
/* class for 3 columns */
ul.rig.columns-3 li {
	width: 30.83%; /* this value + 2.5 should = 33% */
}
/* class for 4 columns */
ul.rig.columns-4 li {
	width: 22.5%; /* this value + 2.5 should = 25% */
}
 
@media (max-width: 480px) {
	ul.grid-nav li {
		display: block;
		margin: 0 0 5px;
	}
	ul.grid-nav li a {
		display: block;
	}
	ul.rig {
		margin-left: 0;
	}
	ul.rig li {
		width: 100% !important; /* over-ride all li styles */
		margin: 0 0 20px;
	}
}
        </style>
<title>Shop Online</title>
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
<%
    String productQuery = "SELECT * FROM product_table";
    String driverName = "com.mysql.jdbc.Driver";
    String dbSelectURL =  "jdbc:mysql://localhost/shop_cart";
    String dbName = "root";
    String dbPassword = "";
    out.println("<ul class='rig columns-4'>");
    try{
    Class.forName(driverName);
    Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(productQuery);
    while(rs.next()){
        String productName = rs.getString("name");
        String productId = rs.getString("product_id");
        String productPrice = rs.getString("price");
        String productDescription = rs.getString("description");
        String imagePath = rs.getString("image_path");
        out.println("<li>");
        if(!imagePath.equals("")){
        out.println("<img height='209' width='140' src=");
        out.println(imagePath);
        out.println("/>");
        }
        out.println("<h3>");
        out.println("<a href='product_display.jsp?id=");
        out.println(productId);
        out.println("'>");
        out.println(productName);
        out.println("</a>");
        out.println("</h3>");
        out.println("<p>");
        out.println(productDescription);
        out.println("<br>");
        out.println("<b>");
        out.println(productPrice);
        out.println("</b>");
        out.println("</p>");
        out.println("</li>");
    }
    }
    catch(Exception e){
        out.println("error<br>");e.printStackTrace();
    }
%>
       
    </body>
</html>










