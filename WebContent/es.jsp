<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>authenticating</title>
    </head>
    <body>
	<%@ page import = "java.sql.*,nes.EncryptionStart.*" %>
	  <center>Encrypting. Please wait. This may take a while. </center>
	<%
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/encrypt","root","");
    String fileName1 =session.getAttribute("fname1").toString();
    String fileName2 =session.getAttribute("fname2").toString();
	String targetid = request.getParameter("target");
	String description = request.getParameter("des");
	session.setAttribute("target",targetid);
	session.setAttribute("description",description);
    String username=session.getAttribute("user").toString();
   
    %>
      
    
  <% 
  nes.EncryptionStart t=new nes.EncryptionStart(username,fileName1,fileName2,targetid,description);
  

  t.enc();
  conn.close();
  
  response.sendRedirect("complete.jsp");
  
  %>
    </body>
</html>


