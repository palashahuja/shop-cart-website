<%-- 
    Document   : updateproduct
    Created on : Nov 12, 2015, 7:02:16 PM
    Author     : Atul Patnigere
--%>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%
String DBNAME = "shop_cart";
// mysql driver
String driver = "com.mysql.jdbc.Driver";
String discount_amount = request.getParameter("discount");
String threshold_amount = request.getParameter("threshold");
String avail = request.getParameter("date");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
out.println(avail);
java.util.Date date = sdf.parse(request.getParameter("date"));
out.println(date.toString());
java.sql.Date date1 = new java.sql.Date(date.getTime());

float discount = Float.parseFloat(discount_amount);
float threshold = Float.parseFloat(threshold_amount);



// the "url" to our DB, the last part is the name of the DB
String url = "jdbc:mysql://localhost/" + DBNAME;
// the default DB username and password may be the same as your control panel login

String name = "root";
String pass = "";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title> -->
    </head>
    <body>
        <%
try
{
// Test the DB connection by making an empty table
String checkQuery = "INSERT INTO voucher_table (expiration_date,discount_amount,threshold_amount) "
        + "VALUES ('"+date1+"','"+discount+"','"+threshold+"')";

Class.forName( driver );
// initialize the Connection, with our DB info ...
Connection con = DriverManager.getConnection( url, name, pass );
Statement stat = con.createStatement();
%>
<%
int a = stat.executeUpdate(checkQuery);
if(a!=0)
{
    response.sendRedirect("../views/discounts.jsp");
}
/*if(rs.next()){
    
}
else{
    session.setAttribute("errorMsg", "password or email is incorrect");
    session.setAttribute("previouspage", "../views/loginandregisterpage.html");
    response.sendRedirect("../views/errormsg.jsp");
}*/
%>

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

