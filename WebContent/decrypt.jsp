
<!--
	Alpha by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Decrypt your files</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/jquery.scrollgress.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		
	</head>

	<body>
<%@ page import = "java.sql.*,nes.*" %>
<% 
String username=session.getAttribute("user").toString();
nes.Showfiles ob = new nes.Showfiles();
String[] files=ob.main(username);

System.out.println(username);

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/encrypt","root","");
Statement stmt  = conn.createStatement();
String sql ="select f,sender,description from message where id='"+username+"'";
%>



		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="index.html">Encryptic</a> [beta]</h1>
				<nav id="nav">
					<ul>
						<li><strong> <%out.print("Welcome "+username); %></strong></li>
						<li><a href="dashboard.jsp">Home</a></li>
						<li>
							<a href="" class="icon fa-angle-down">Quick Links</a>
							<ul>
								<li><a href="encrypt.html">Encrypt</a></li>
								<li><a href="decrypt.html">Decrypt</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li>
									<!--<a href="">Submenu</a>
									<ul>
										<li><a href="#">Option One</a></li>
										<li><a href="#">Option Two</a></li>
										<li><a href="#">Option Three</a></li>
										<li><a href="#">Option Four</a></li>
									</ul>
								</li>
								-->
							</ul>
						</li>
						<li><a href="logout.jsp"><h4>Logout</h4></a></li>
					</ul>
				</nav>
			</header>

		<!-- Main -->
			<section id="main" class="container">
				<header>
					<h2>Decryption</h2>
					
				</header>
				<div class="box">
					
						
					
					<h3><strong> </strong>Decryption : Chose File/Database</h3>
<% ResultSet rs = stmt.executeQuery(sql);
try {
	if(rs!=null) {
%>
<table>

<thead>
   <tr>
      	<th>File Name</th>
		 <th>Sender</th>
		<th>Description/Note</th>
     
		 
   </tr>
</thead>
<tbody>
  <%		while(rs.next()) {  %>
				<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				
				</tr>
<%    	}  %>	

</tbody>
</table>
<%    	}  %>	
  <%	
     }catch(SQLException e) {
        e.printStackTrace();
    }
finally {	stmt.close();rs.close();stmt=null;rs=null; conn.close();}
  %>
					
							<form action="dec.jsp" method="post">
	 <input class="form-control input-lg" type="text" placeholder="file" name="file">
							
							</p>
					<center><input type="submit" class="btn btn-info" href="#" value="Start" /></center>	 </form>
						</div>
					</div>
					<div class="row">
						<div class="4u 12u(mobilep)">
						<p>
						</p>
						</div>
					<div class="4u 12u(mobilep)">	
					
					</div>
					</div>
					<div class="row">
						<div class="4u 12u(mobilep)">
						<p>
						</p>
						</div>
						<div class="4u 12u(mobilep)">
							
						</div>
					</div>	
				</div>
				<hr />
				
			</section>
			

		<!-- Footer -->
			<footer id="footer">
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
					<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</footer>

	</body>
</html>