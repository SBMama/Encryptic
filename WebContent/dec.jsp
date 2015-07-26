

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
//out.println("Success!");

nes.EncryptionStart ne = new nes.EncryptionStart(username,filename);

ne.dec();



//response.sendRedirect("login.html");

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
			<div class="box">
			<Center><h1>Success!</h1></Center>
			</div>
			<div class="box">
				<h3><strong>Decrypted File/Database</strong> </h3>
				<p> You can download your decrypted file now.</p>
				<p> After downloading, please open in notepad and save as filename.html </p>
				<div class="row">
						<div class="7u 12u(mobilep)">
						<% String downloadlink ="file:\\D"+":\\"+username+"de2.txt";%>
				<!--  <a href="<c:url value = username+"de2.txt"/>" class="button special big">View/Download</a>-->
					<a href="download.jsp" class="button special big ">Download</a>
					
					
						</div>
						
						<div class="5u 12u(mobilep)">
						<a href="dashboard.jsp" class="button special big">Dashboard</a>
						</div>
				</div>
				</div><div>
</body>
<footer id="footer">
				<!--  <ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
					<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
				</ul> -->
				<ul class="copyright">
					<li>&copy; Encryptic. A Project by Subhayan Bhattacharya & Bhaskar Ghosh dastidar</li><li> <a href=#></a></li>
				</ul>
			</footer>

</html>