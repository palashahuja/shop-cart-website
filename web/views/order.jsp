<%-- 
    Document   : order
    Created on : 12 Nov, 2015, 3:55:20 PM
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
<%! ArrayList<String> ar = new ArrayList<>(); %>
<%  if(null == session.getAttribute("cart")){
    out.println("You haven't added products to the cart.<br />");
    out.println("Please go back to the");
    out.println("<a href='products.jsp?page_id=1'/>products page.</a>");
    out.println("</body>");
    out.println("</html>");
    return;
}
%>
                <p class = 'order-item'> ITEM </p>
                <p class = 'order-qty'> QTY </p>
                <p class = 'order-price'> PRICE </p>
                
            <br />
            <br />
            <center>
            <hr style="width: 90%;">
            </center>
            <%! Map<String, Integer> productCount = new HashMap<>();%>
            <%
                productCount.clear();
                ar = (ArrayList<String>) session.getAttribute("cart");
                
                for(String productId : ar){
                    if(productCount.containsKey(productId)){
                        int count = productCount.get(productId);
                        count += 1;
                        productCount.put(productId, count);
                    }
                    else{
                        productCount.put(productId, 1);
                    }
                }
                String driverName = "com.mysql.jdbc.Driver";
                String dbSelectURL =  "jdbc:mysql://localhost/shop_cart";
                String dbName = "root";
                String dbPassword = "";
                int totalPrice = 0;
                for(String productId : productCount.keySet()){
                    String productQuery = "SELECT * FROM product_table where product_id='" + productId + "';" ;
                    try{
                          Class.forName(driverName);
                          Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
                          Statement st = con.createStatement();
                          ResultSet rs = st.executeQuery(productQuery);
                           while(rs.next()){
                           String productName = rs.getString("name");
        //String productId = rs.getString("product_id");
                           String productPrice = rs.getString("price");
                           String productDescription = rs.getString("description");
                           String imagePath = rs.getString("image_path");
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
                           out.println(productCount.get(productId));
                           out.println("</p>");
                           out.println("<p class='order-price-product'>");
                           out.println("<b>" + productPrice + "</b>");
                           out.println("</p>");
                           out.println("<center><hr style='width: 90%;'></center>");
                           out.println("<br />");
                           totalPrice += Integer.parseInt(productPrice)*productCount.get(productId);
                          }
                           
                    }
                    catch(Exception e){
                       out.println("error<br />");e.printStackTrace();
                    }
                }
                
                //session.invalidate();
                session.setAttribute("total price",totalPrice);
                out.println("<p class='total-price'>");
                out.println("Total price:");
                out.println("<b>" +totalPrice+"</b>");
                out.println("</p>"); 
            %>
            <br />
            <form class='address-inp' action="payment_method.jsp">
            <h3> <b> Address: </b> </h3>
            <input id = "address-input" size="50" name="address-input" placeholder="address"/>
            <br />
            <br />
            <form class='address-inp' action="payment_method.jsp">
            <h3> <b> Enter Voucher Code: </b> </h3>
            <input id = "voucher-input" size="50" name="voucher-input" placeholder="voucher-code"/>
            <br />
            <br />
            <input type='submit' class='button' value='Proceed to Payment'/>
            </form>
           ￼
    </body>
</html>
