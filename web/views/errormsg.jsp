<%-- 
    Document   : errormsg
    Created on : 17 Oct, 2015, 5:20:01 AM
    Author     : palash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head><title></title></head>
    <%=session.getAttribute("errorMsg").toString()%>
    <% String prevPath  =  session.getAttribute("previouspage").toString(); %>
    . Please go back to <a href = '<%=prevPath%>' > the previous page.</a>
</html>
