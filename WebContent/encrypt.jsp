<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Encrypt your files</title>
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
					<li><h4><% out.println("Welcome "+username);%> </h4></li>
						<li><a href="index.html">Home</a></li>
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
					<h2>Encrypt your files/databases</h2>
					<p>Encryption with public key.</p>
				</header>
				<div class="box">
					<span class="image featured"><img src="images/pic01.jpg" alt="" /></span>

					
					<h3><strong> Step 1: </strong>Encryption : Upload File/Database</h3>
					<p>Encryption of your file</p>
					<div class="row">
						<div class="6u 6u(mobilep)">
						
						<form action="upload.jsp" method="post"
                        enctype="multipart/form-data">
						
						<input type="file" name="file1" value ="Upload" required /> 
						</br>
						
						
						
						</div>
						
					
					
				<div class="6u 6u(mobilep)">
				<h3><strong> Step 2: </strong>Carrier : Upload a music file (mp3)</h3>
					<p>The mp3 file will wrap around your encrypted file, and no one will ever know what it contains hidden.</p>
						
						
						<input type="file" name="file2" value ="Upload" required /> 
						<br>
						
						</div>
					</div>
					<hr>
					<center><input type="submit" value="Upload both files" /> </center>
						</form>
				
					<div class="row">
						<div class="6u 6u(mobilep)">
						<!--<a href="#" class="button special">See today's public key and modulus.</a></li> -->
							
							<p></p>
						
						
						</div>
						
					</div>
					
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

<script>

</script>