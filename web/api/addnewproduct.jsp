<%-- 
    Document   : updateproduct
    Created on : Nov 12, 2015, 7:02:16 PM
    Author     : Atul Patnigere
--%>


<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="javax.imageio.ImageIO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title> -->
    </head>
    <body>
<%
String DBNAME = "shop_cart";
// mysql driver
String driver = "com.mysql.jdbc.Driver";


// the "url" to our DB, the last part is the name of the DB
String url = "jdbc:mysql://localhost/" + DBNAME;
// the default DB username and password may be the same as your control panel login

String db_name = "root";
String db_pass = "";
      String contentType = request.getContentType();
      
      if(contentType.indexOf("multipart/form-data;") >= 0){
       out.println("123");
       FileItemFactory factory = new DiskFileItemFactory();
       ServletFileUpload upload = new ServletFileUpload(factory);
       List items = null;
       try 
       {
               items = upload.parseRequest(request);
       }
       catch (FileUploadException e) 
       {
               e.printStackTrace();
       }
       Iterator itr = items.iterator();     //this will create iterator object from list..used for traversing the data.
       String pname=null, pprice=null, avail=null, cat=null, desc=null,itemName=null;
       float price=0;
       int availability=0;
       while (itr.hasNext()) 
       {
           FileItem item = (FileItem) itr.next();
          
           if (item.isFormField())   //checking if its normal field then we read as normal. no need to store in disc
            {
                       String name = item.getFieldName();
                       String value = item.getString();
                                            
                       if(name.equals("pname"))
                       {
                               pname = value;
                               
                        }
                       else if(name.equals("pprice"))
                        {  
                               pprice = value;
                        }
                       else if(name.equals("avail"))
                       {
                           avail = value;
                       }
                       else if(name.equals("cat"))
                       {
                           cat = value;
                       }
                       else if(name.equals("desc"))
                       {
                           desc = value;
                       }
                      
                       
                        
            }
            else                                      //this else part for process about PDF file
             {
                try {
        
                   itemName = item.getName();    //this will return the pdf file name
                   String filename= "/home/palash/NetBeansProjects/shop-cart-website/web/images/";
                   filename=filename+itemName;       //now concatenation the file name with upload  path.
                   File savedFile=new File(filename);
                   try (InputStream input = item.getInputStream()) {
                         try {
                             ImageIO.read(input).toString();
        // It's an image (only BMP, GIF, JPG and PNG are recognized).
                         } catch (Exception e) {
                           session.setAttribute("error","image not uploaded");
                           response.sendRedirect("../views/add_new_product.jsp");
                     }
}
                    item.write(savedFile);    //saving file into disc,item contain which you select the file.
                                                                //here item will copy into the savedFile and store into di
   
                }
                catch(Exception ste)
                {
                    out.println(ste);
                }
              }
          }
                 if(pname == null || desc == null || cat == null || pprice ==  null || avail == null ){
                           session.setAttribute("error","form not filled");
                           //response.sendRedirect("../views/add_new_product.jsp");
                           return;
                       }
                       try{
                           price = Float.parseFloat(pprice);
                       }
                       catch(Exception e){
                           session.setAttribute("error","incorrect value entered for price.");
                           response.sendRedirect("../views/add_new_product.jsp");
                       }
                       try{
                           availability = Integer.parseInt(avail);
                       }
                       catch(Exception e){
                           session.setAttribute("error","incorrect value entered for price.");
                           response.sendRedirect("../views/add_new_product.jsp");
                       }
                 Class.forName( driver );
// initialize the Connection, with our DB info ...
                 String updateQuery = "INSERT INTO product_table(name, price, availability, image_path, category, description, upload_date)   VALUES(?,?,?,?,?,?,?);";
                 Connection con = DriverManager.getConnection( url, db_name, db_pass );
                 PreparedStatement ps = con.prepareStatement(updateQuery);
                 ps.setString(1, pname);
                 ps.setFloat(2, price);
                 ps.setInt(3, availability);
                 ps.setString(4, "../images/" + itemName);
                 ps.setString(5, cat);
                 ps.setString(6, desc);
                 java.util.Date tempDate = new java.util.Date();
                 java.sql.Date propDate = new java.sql.Date(tempDate.getTime());
                 ps.setDate(7, propDate);
                 //ps.setInt(8, product_id);
                 out.println(ps.toString());
                 ps.executeUpdate();
                 
      }
      out.println("123");
      response.sendRedirect("../views/add_new_product.jsp");
    
%>      
    </body>
</html>

