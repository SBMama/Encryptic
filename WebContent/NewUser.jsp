<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authenticating</title>
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
<footer >
				<!--  <ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
					<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
				</ul> -->
				<ul >
					<li>&copy; Encryptic. A Project by Subhayan Bhattacharya & Bhaskar Ghosh dastidar</li><li> <a href=#></a></li>
				</ul>
			</footer>

</html>