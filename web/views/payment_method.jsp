<%-- 
    Document   : payment_method
    Created on : 12 Nov, 2015, 10:33:07 PM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
<title>Shop Online</title>
<link href="../css/homestyle.css" rel="stylesheet" type="text/css" />
<style>
    .credit_cart{
        margin-left: 20%;
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
         <%! String userId, orderId;
             Map<String, Integer> productCount = new HashMap<>();
         %>
        <%
          if(request.getParameter("address-input") == null || session.getAttribute("email") == null){
              out.println("error");
          }
          String address = request.getParameter("address-input");
          String voucherId = request.getParameter("voucher-input");
          String voucherQuery = "SELECT discount_amount AS DIS FROM voucher_table WHERE voucher_id = ?";
      
          //out.println(address);
          String email = (String) session.getAttribute("email");
          ArrayList<String> ar = (ArrayList<String>) session.getAttribute("cart");
          String driverName = "com.mysql.jdbc.Driver";
          String dbSelectURL =  "jdbc:mysql://localhost/shop_cart";
          String idQuery = "SELECT user_id FROM user_table where email='" +email+"';";
          String dbName = "root";
          String dbPassword = "";
          int totalPrice = (int)session.getAttribute("total price");
          String totalPrice_str = Integer.toString(totalPrice);
          String voucherDiscount = null;
          out.println("123");
          try{
               Class.forName(driverName);
               Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(idQuery);
               PreparedStatement ps  = con.prepareStatement(voucherQuery);
               ps.setInt(1, Integer.parseInt(voucherId));
               ResultSet rs_1 = ps.executeQuery();
               while(rs_1.next()){
                   voucherDiscount = rs_1.getString("DIS");
               }
               while(rs.next()){
                   userId = rs.getString("user_id");
               }
          }
          catch(Exception e){
                       out.println(e.toString());
          }
          out.println("456");
          //out.println(userId);
          String discount=null;
          if(voucherDiscount!=null) 
          {discount = voucherDiscount; 
          totalPrice -= Integer.parseInt(discount);
          if(totalPrice < 0){
              out.println("error. voucher not applicable.");
          }
          totalPrice_str = Integer.toString(totalPrice);
          }
          
          String insertQuery = "INSERT INTO order_table(shipping_address, user_id, discount, total_price, payment_type, pay_recieved)   VALUES(?, ?, ?, ?, ?, 1);";
          
          try{
               Class.forName(driverName);
               Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
               PreparedStatement ps_2   = con.prepareStatement(insertQuery);
               ps_2.setString(1, address);
               ps_2.setString(2, userId);
               ps_2.setInt(3, Integer.parseInt(discount));
               ps_2.setInt(4, totalPrice);
               ps_2.setInt(5, 0);
               ps_2.executeUpdate();
          }
          catch(Exception e){
                       out.println(e.toString());
                       
          }
          String orderId_query = "SELECT MAX(order_id) AS maxId FROM order_table;";
           try{
               Class.forName(driverName);
               Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(orderId_query);
               while(rs.next()){
                   orderId = rs.getString("maxId");
               }
          }
          catch(Exception e){
                       out.println("error<br />");e.printStackTrace();
          }
           productCount.clear();
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
           java.util.Date orderDate = new java.util.Date();
           java.util.Date deliveryDate = new java.util.Date(orderDate.getTime() + 3*24*60*60*1000); // adding 3 days to order date .
           java.sql.Date orderSqlDate = new java.sql.Date(orderDate.getTime());
           java.sql.Date deliverySqlDate = new java.sql.Date(deliveryDate.getTime());
           for(String productId: productCount.keySet()){
               String insertQueryorder = "INSERT INTO order_detail_table values(?,?,?,?,?,?,?)";
               int productQuantity = productCount.get(productId);
              try{
               Class.forName(driverName);
               Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
               PreparedStatement st = con.prepareStatement(insertQueryorder);
               st.setInt(1, Integer.parseInt(orderId));
               st.setInt(2, Integer.parseInt(productId));
               st.setString(3, email);
               st.setDate(4, orderSqlDate);
               st.setDate(5, deliverySqlDate);
               st.setInt(6, 0);
               st.setInt(7, productQuantity);
               st.executeUpdate();
              }
               catch(Exception e){
                       //out.println("error<br />");
                       out.println(e.toString());
               }
              
           }
           ar.clear();
           session.setAttribute("cart", ar);
           out.println("<h3 style='margin-left: 10%;'>");
           out.println("order id:");
           out.println(orderId);
           out.println("</h3>");
        %>
        <h3 style='margin-left: 10%;'>order placed successfully !!</h3>
     </body>
</html>
