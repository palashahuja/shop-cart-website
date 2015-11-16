<%-- 
    Document   : track_your_order
    Created on : 13 Nov, 2015, 12:47:25 PM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Shop Online</title>
<link href="../css/homestyle.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="../css/style-ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<style>
    .order-titles{
        float: left;
        margin-left: 10%;
    }
    .order-item{
        float: left;
        
        margin-left: 21%;
    }
    .order-item-product{
        float:left;
        width: 15%;
        margin-left:10%;
    }
    .order-qty{
        float: left;
        margin-left: 15%;
    }
    .order-qty-product{
        float:left;
        margin-left:4%;
    }
    .order-price-product{
        float:left;
        margin-left: 7%;
    }
    .order-price{
        float: left;
        margin-left: 5%;
    }
    .removal{
        float: left;
        margin-left: 2%;
    }
 
    .total-price{
        float: left;
        margin-left: 43%;
    }
    .order-delivery-status{
        float: left;
        margin-left: 10%;
    }
    .address-inp{
        float: left;
        margin-left: 10%;
        width: 20%;
    }
    #address-id{
        float: left;
        margin-left: 10%;
        width: 20%;
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
    <br />
    <br />
</center> 
<%! ArrayList<String> ar = new ArrayList<>(); %>
                <p class = 'order-item'> ITEM </p>
                <p class = 'order-qty'> QTY </p>
                <p class = 'order-price'> PRICE </p>
                
            <br />
            <br />
            <center>
            <hr style="width: 90%;">
            </center>
            <%
                
                String email = (String)session.getAttribute("email");
                String driverName = "com.mysql.jdbc.Driver";
                String dbSelectURL =  "jdbc:mysql://localhost/shop_cart";
                String dbName = "root";
                String dbPassword = "";
                String orderProductQuery = "SELECT * FROM order_detail_table where email=? ORDER BY order_date DESC";
                try{
                     Class.forName(driverName);
                     Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
                     PreparedStatement ps = con.prepareStatement(orderProductQuery);
                     ps.setString(1, email);
                     ResultSet rs = ps.executeQuery();
                     while(rs.next()){
                            
                            String productIdQuery = "SELECT * FROM product_table where product_id=?";
                            String productId = rs.getString("product_id");
                            String orderId = rs.getString("order_id");
                            int orderStatus = rs.getInt("order_state");
                            Connection con_1 = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
                            PreparedStatement ps_1 = con_1.prepareStatement(productIdQuery);
                            ps_1.setInt(1, Integer.parseInt(productId));
                            ResultSet rs_1;
                            rs_1 = ps_1.executeQuery();
                            while(rs_1.next()){
                            String productName = rs_1.getString("name");
                            String productPrice = rs_1.getString("price");
                            String imagePath = rs_1.getString("image_path");
                            String productQuantity = rs.getString("quantity");
                            String productDescription = rs_1.getString("description");
                           if(!imagePath.equals("")){
                                out.println("<img style='margin-left:5%; float:left;' height='109' width='80' src=");
                                out.println(imagePath);
                                out.println("/>");
                            }
                           out.println("<p class='order-item-product'>");
                           out.println("<b>"+ productName + "</b>");
                           out.println("<br />");
                           out.println(productDescription);
                           out.println("</p>");
                           out.println("<p class='order-qty-product'>");
                           out.println(productQuantity);
                           out.println("</p>");
                           out.println("<p class='order-price-product'>");
                           out.println("<b>" + productPrice + "</b>");
                           out.println("</p>");
                           out.println("<p class='order-delivery-status'>");
                           String deliveryStatus=null;
                           if(orderStatus == 0){
                               deliveryStatus = "undelivered";
                           }
                           else if(orderStatus == 1){
                               deliveryStatus = "delivered";
                           }
                           out.println("<b>" + deliveryStatus + "</b>");
                           out.println("</p>");
                           out.println("<center><hr style='width: 90%;'></center>");
                           out.println("<br />");
                           
                     }
                }
                }
                catch(Exception e){
                    out.println(e.toString());
                }
                %>