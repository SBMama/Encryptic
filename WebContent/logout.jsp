<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging out</title>
</head>
<body >



  <% 
    HttpSession s = request.getSession(false);
    s.invalidate();
  %>
  
 
  <script>
function loggedout(){
	alert("You have been logged out successfully");
	location.href="login.html";
}

</script>
 <script>
  loggedout();
  </script>
  <center>Logged out!</center>
</body>
</html>