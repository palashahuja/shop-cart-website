<%-- 
    Document   : updateproduct
    Created on : Nov 12, 2015, 7:02:16 PM
    Author     : Atul Patnigere
--%>


<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%
String DBNAME = "shop_cart";
// mysql driver
String driver = "com.mysql.jdbc.Driver";
String pname = request.getParameter("pname");
String pprice = request.getParameter("pprice");
String avail = request.getParameter("avail");
String cat = request.getParameter("cat");
String desc = request.getParameter("desc");
float price = Float.parseFloat(pprice);
int av = Integer.parseInt(avail);

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
String checkQuery = "INSERT INTO product_table (name,price,availability,category,description) "
        + "VALUES ('"+pname+"','"+price+"','"+av+"','"+cat+"','"+desc+"')";

Class.forName( driver );
// initialize the Connection, with our DB info ...
Connection con = DriverManager.getConnection( url, name, pass );
Statement stat = con.createStatement();
%>
<%
stat.executeUpdate(checkQuery);
System.out.println("HELLO!!");

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

