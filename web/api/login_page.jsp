<%-- 
    Document   : login_page.jsp
    Created on : 15 Oct, 2015, 7:35:51 PM
    Author     : palash
--%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%
String DBNAME = "shop_cart";
// mysql driver
String driver = "com.mysql.jdbc.Driver";
String email = request.getParameter("username");
String password = request.getParameter("password");
// the "url" to our DB, the last part is the name of the DB
String url = "jdbc:mysql://localhost/" + DBNAME;
// the default DB username and password may be the same as your control panel login

String name = "root";
String pass = "";
%>

<html>
<head>
</head>
<body>
<%
try
{
// Test the DB connection by making an empty table
String checkQuery = "SELECT * FROM user_table where email = '" + email + "' and password = '" + password + "'";  
Class.forName( driver );
String adminMail = "admin@mail.com";
String adminPass = "admin";
if(email.equals(adminMail) && password.equals(adminPass)){
   response.sendRedirect("../views/adminportal.jsp");
   return;
}
// initialize the Connection, with our DB info ...
Connection con = DriverManager.getConnection( url, name, pass );
Statement stat = con.createStatement();
%>
<%
ResultSet rs = stat.executeQuery(checkQuery);
if(rs.next()){
    session.setAttribute("email", email);
    response.sendRedirect("../views/products.jsp?page_id=1");
}
else{
    session.setAttribute("errorMsg", "password or email is incorrect");
    session.setAttribute("previouspage", "../views/loginandregisterpage.html");
    response.sendRedirect("../views/errormsg.jsp");
}
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
