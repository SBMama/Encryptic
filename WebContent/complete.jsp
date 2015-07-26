<!DOCTYPE HTML>

<html>
	<head>
		<title>Encryption complete</title>
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
	<body><%@ page import = "java.sql.*" %>
	
<% 
String username=session.getAttribute("user").toString();
%>
		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="index.html">Encryptic</a> [beta]</h1>
				<nav id="nav">
					<ul>
					<li><a href="#" class="button big"><%= username%></a></li>
						<li><a href="dashboard.jsp">Home</a></li>
						
						<li><a href="logout.jsp"><h4>Logout</h4></a></li>
					</ul>
				</nav>
			</header>

		<!-- Main -->
			<section id="main" class="container">
			<div class="box">
			<center>
			
			<h3>Encryption completed!</h3>
		<hr>
		
		<div class="row">
						<div class="6u 12u(mobilep)">
						
				<a href="encrypt.jsp" class="button special big">Encrypt Another</a>
						</div>
						<div class="6u 12u(mobilep)">
						<a href="dashboard.jsp" class="button special big">Go to dashboard</a>
						</div>
				</div>
			
			</center>
			</div>					

			
			</section>

		<!-- Footer -->
			<footer id="footer">
				
				<ul class="copyright">
					<li>&copy; Encryptic. A Project by Subhayan Bhattacharya & Bhaskar Ghosh dastidar</li><li> <a href=#></a></li>
				</ul>
			</footer>

	</body>
</html>

<script>

</script>