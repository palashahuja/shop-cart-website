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
        .button{
            margin-left: 50%;
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
        .button-left{
            margin-left: 40%;
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
    .button-right{
            margin-left: 5%;
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
        <li><a href="home.html">Home</a></li>
        <li><a href="category.jsp">Categories</a></li>
        <li><a href="deals.jsp">Hot Deals</a></li>
        <li><a href="order.jsp">Place Order</a></li>
        <li><a href="track_your_order.jsp"> Track Your Order </a></li>
        <li><a href="../api/logout.jsp"> Logout </a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
   <br />
    <br />
</center>
<%
    String productQuery = "SELECT * FROM product_table";
    String driverName = "com.mysql.jdbc.Driver";
    String dbSelectURL =  "jdbc:mysql://localhost/shop_cart";
    String dbName = "root";
    String dbPassword = "";
    int page_id = Integer.parseInt(request.getParameter("page_id"));
    int numberOfRecords = 8;
    out.println("<ul class='rig columns-4'>");
    try{
    Class.forName(driverName);
    Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(productQuery);
    rs.last();
    int totalNumberOfRows = rs.getRow();
    rs.beforeFirst();
    int numberOfPages = totalNumberOfRows/numberOfRecords;
    int remain = totalNumberOfRows % numberOfRecords;
    if(remain != 0){
        numberOfPages++;
    }
    String sqlQuery = "SELECT * FROM product_table LIMIT ?, ?;";
    PreparedStatement ps = con.prepareStatement(sqlQuery);
    int row_id = (page_id - 1)*numberOfRecords;
    ps.setInt(1, row_id);
    ps.setInt(2, numberOfRecords);
    ResultSet rs_1 = ps.executeQuery();
    while(rs_1.next()){
        String productName = rs_1.getString("name");
        String productId = rs_1.getString("product_id");
        String productPrice = rs_1.getString("price");
        String productDescription = rs_1.getString("description");
        String imagePath = rs_1.getString("image_path");
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
    out.println("</ul>");
       if(page_id == 1){
           %>
           <a href="products.jsp?page_id=2" class = "button">  Next </a>
           <%
       }
       else if(page_id == numberOfPages){
           out.println("<a class = 'button' href='products.jsp?page_id=");
           out.println(numberOfPages-1);
           out.println("'> Previous </a>");
       }
       else{
           out.println("<a class = 'button-left' href='products.jsp?page_id=");
           out.println(page_id - 1);
           out.println("'> Previous </a>");
           out.println("<a class = 'button-right' href='products.jsp?page_id=");
           out.println(page_id + 1);
           out.println("'> Next </a>");
       }
    }
    catch(Exception e){
        out.println(e.toString());
    }
%>
       
    </body>
</html>










