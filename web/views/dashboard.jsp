
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%
String DBNAME = "shop_cart";
// mysql driver
String driver = "com.mysql.jdbc.Driver";
String pname = request.getParameter("username");
String password = request.getParameter("password");
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
String checkQuery = "SELECT COUNT(*) FROM product_table";

Class.forName( driver );
// initialize the Connection, with our DB info ...
Connection con = DriverManager.getConnection( url, name, pass );
Statement stat = con.createStatement();
%>
<%
ResultSet rs = stat.executeQuery(checkQuery);
System.out.println("HELLO!!");
rs.next();
int count = rs.getInt(1);
System.out.println("Total No. of Products: "+count); 

/*if(rs.next()){
    
}
else{
    session.setAttribute("errorMsg", "password or email is incorrect");
    session.setAttribute("previouspage", "../views/loginandregisterpage.html");
    response.sendRedirect("../views/errormsg.jsp");
}*/
%>
<h3>Total No. of Products: </h3><%= count%>
<h3>No. of Recent Orders: </h3>

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
