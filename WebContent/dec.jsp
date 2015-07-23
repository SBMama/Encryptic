
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

String filename=request.getParameter("file");
out.println("Success!");

nes.EncryptionStart ne = new nes.EncryptionStart(username,filename);

ne.dec();



//response.sendRedirect("login.html");

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
<div class="box">
				<h3><strong>Decrypted File/Database</strong> </h3>
				<p> You can either download your encrypted file/database or view it here.</p>
				<div class="row">
						<div class="7u 12u(mobilep)">
						
				<a href="#" class="button special big">View</a>
						</div>
						<div class="5u 12u(mobilep)">
						<a href="#" class="button special big">Download</a>
						</div>
				</div>
				</div><div>
</body>
</html>