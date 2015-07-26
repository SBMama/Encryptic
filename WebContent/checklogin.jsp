<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>authenticating</title>
    </head>
    <body>
	<%@ page import = "java.sql.*" %>
	<%int i=0,j=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.8.201.130:3306/encrypticbeta","adminLg3gGi2","5jcfHJjIpe7v");
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/encrypt","root","");
	Statement stmt  = conn.createStatement();
	String[] users=new String[10];
	String[] pass=new String[10];
	String sql="select  id,pass from login"; 
	
    ResultSet rs = stmt.executeQuery(sql);
    try {
		if(rs!=null) {
		while(rs.next()) {
		users[i]=rs.getString(1);
		pass[i]=rs.getString(2);
		i++;
		}}}
		
     catch(SQLException e) {
        e.printStackTrace();
    } stmt.close();rs.close();stmt=null;rs=null;
	
  %>
        <%
        String username=request.getParameter("id");
        String password=request.getParameter("pass");
		
	while(j<i){
	
        if((username.equals(users[j]) && password.equals(pass[j])))
            {
			session.setAttribute("user",username);
            response.sendRedirect("dashboard.jsp");
            break;
			}
		else	{out.println("Error");}		
       j++;
	   }
	conn.close();
        %>
    </body>
</html>


