<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Shop Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../css/homestyle.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="../css/style-ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
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
        <li><a href=order.jsp>Place Order</a></li>
        <li><a href="add_to_cart.jsp">Add to Cart</a></li>
      </ul>
      <div class="clear"></div>
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
    </center>
</body>
</html>