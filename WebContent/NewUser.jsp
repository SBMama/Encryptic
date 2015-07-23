<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*,nes.EncryptionStart.*" %>
<% 
String Name ="",Email="",username="",password="",dob="";
Name=request.getParameter("name");
Email=request.getParameter("email");
username=request.getParameter("username");
password=request.getParameter("pass");
dob=request.getParameter("dob");
String phone = request.getParameter("phone");

{
	nes.EncryptionStart a = new nes.EncryptionStart();
	if (!Name.equals(""))
	a.newuser(Name, password, username, Email,dob,phone);
	%>
	<center><h4>You have been registered. Please <a href="login.html">Login</a> To continue</h4> </center>
	<%
}




%>

</body>
</html>