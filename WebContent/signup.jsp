<%@page import="nes.EncryptionStart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
	<head>
		<title>New User Sign up</title>
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

		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="index.html">Encryptic</a> [beta]</h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						
						<li><a href="logout.jsp"><h4>Logout</h4></a></li>
					</ul>
				</nav>
			</header>

		<!-- Main -->
			<section id="main" class="container 75%">
				<header>
					<h2>Create your account</h2>
					
				</header>
				<div class="box">
					<form method="post" action="NewUser.jsp">
						    <div class="row uniform 50%">
						    <div class="6u 12u(mobilep)">
							<input type="text" name="name" id="name" value="" placeholder="Name" required/>
						    </div>
						    <div class="6u 12u(mobilep)">
							<input type="email" name="email" id="email" value="" placeholder="Email" required />
						    </div>
						    </div>
						    <div class="row uniform 50%">
						    <div class="6u 12u(mobilep)">
							<input type="text" name="username" id="username" placeholder="username" required/>
						    </div>
						    <div class="6u 12u(mobilep)">
							<input type="password" name="pass" id="pass" value="" placeholder="Password" required/>
							</div>
							</div>
							<center><div class="row uniform 50%">
							<div class="6u 12u(mobilep)">
							<input type="number" name="phone" size ="10" placeholder="Phone Number" required/>
							</div>
							<div class="6u 12u(mobilep)">
							<input type="date" name="dob" id="dob" value="Date of birth"   required/>
							</div>
							</div>
							</center>
							</div>
						<div class="row uniform">
							<div class="12u">
								<ul class="actions align-center">
									<li><input type="submit" value="Sign Up" /></li>
								</ul>
							</div>
						</div>
					</form>
				</div>
			</section>
			<script>
			
			</script>
			
		<!-- Footer -->
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
			

	</body>
</html>