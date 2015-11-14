<%-- 
    Document   : register_page
    Created on : 15 Oct, 2015, 7:38:31 PM
    Author     : palash
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.regex.*"  %>
<%
    String userName = request.getParameter("usernamesignup"); // username id = usernamesignup
    String email = request.getParameter("emailsignup"); // email id = emailsignup
    String password = request.getParameter("passwordsignup");  // password id = passwordsignup
    String address = request.getParameter("addresssignup");
    String prevPath = "../views/loginandregisterpage.html";
    String password_confirm = request.getParameter("passwordsignup_confirm");
    String phoneNumber = request.getParameter("phonesignup");
    String errorOccured  = "no error occured";
    String EMAIL_PATTERN =               
		"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    String PHONE_NUMBER_PATTERN =
                 "\\d{10}";
    Pattern emailpattern = Pattern.compile(EMAIL_PATTERN);
    Pattern phonenumberPattern = Pattern.compile(PHONE_NUMBER_PATTERN);
   
    if(!password.equals(password_confirm)){
        errorOccured = "The passwords do not match";
        }
    else if(!emailpattern.matcher(email).matches()){ // checking whether the input is a a valid email.
        errorOccured = "input email is invalid";
    }
    else if(!phonenumberPattern.matcher(phoneNumber).matches()){
        errorOccured = "phone number is "
                + "invalid";
    }
 
    try{
        String insertQuery = "INSERT INTO user_table(name, password, phone_number,"
                + "user_address, email) values('" + userName + "','" + password + "','"+ phoneNumber
                + "','" + address + "','" + email + "');";
        String driverName = "com.mysql.jdbc.Driver";
        String dbSelectURL =  "jdbc:mysql://localhost/shop_cart";
        String dbName = "root";
        String dbPassword = "";
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(dbSelectURL, dbName ,dbPassword);
        Statement st = con.createStatement();
        st.executeUpdate(insertQuery);
    }
    catch(Exception e){
        errorOccured = e.getMessage();
    }
    if(!errorOccured.equals("no error occured")){
        session.setAttribute("errorMsg", errorOccured);
        session.setAttribute("previouspage", prevPath);
        response.sendRedirect("../views/errormsg.jsp");
    }
    else{
        response.sendRedirect("../views/loginandregisterpage.html");
    }
   
%>