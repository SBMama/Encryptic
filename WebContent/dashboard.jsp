<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>User Dashboard</title>
	  <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body onload="bck()">
<%@ page import = "java.io.*,java.util.*,java.sql.*,java.util.Date,nes.TestJava.*,nes.*" %>
<% 
nes.Rsa r = new nes.Rsa();
String notification="";
String date="",Date_today="";
String Name="",Email="";
String username=session.getAttribute("user").toString();
r.generateKeys(username);
Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://127.8.201.130:3306/encrypticbeta","adminLg3gGi2","5jcfHJjIpe7v");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/encrypt","root","");


Statement stmt  = conn.createStatement();    
String sql="";    
sql="select name,email from login where id='"+username+"'"; 
ResultSet rs = stmt.executeQuery(sql);

try {
if(rs!=null) {
while(rs.next()) {
Name=rs.getString(1);
Email=rs.getString(2);

}}}
catch(SQLException e) {
e.printStackTrace();
} stmt.close();rs.close();stmt=null;rs=null;

stmt  = conn.createStatement();   
sql="select sysdate()";
rs = stmt.executeQuery(sql);

try {
if(rs!=null) {
while(rs.next()) {
date=rs.getString(1);

}}}
catch(SQLException e) {
e.printStackTrace();
} stmt.close();rs.close();stmt=null;rs=null;

Date_today=date.substring(0,10);

File dir = new File("C:\\My Files\\"+username);

//File dir = new File(".\\"+username);

dir.mkdir();

String newreceieve="",datereceive="",namereceieve="",descriptionrecieve="";
stmt  = conn.createStatement();    
sql="";    
sql="select f,d,description,sender from message where id='"+username+"' order by d limit 1"; 
rs = stmt.executeQuery(sql);	
try {
    if(rs!=null) {
    	while(rs.next()) {
    		namereceieve=rs.getString(1);
    		datereceive=rs.getString(2);
    		descriptionrecieve=rs.getString(3);
    		newreceieve=rs.getString(4);
    	}
    		
    	}
    }
catch(SQLException e) {
    e.printStackTrace();
    } stmt.close();rs.close();stmt=null;rs=null;
  notification ="You've received an encrypted file from "+newreceieve+" on "+datereceive+". ";
  Date dd = new Date();

%>


        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <ul class="nav navbar-right top-nav">
            <div class="navbar-header">
               
                <a class="navbar-brand" href="dashboard.jsp">Dashboard.</a> 
            </div>
            
            <!-- Top Menu Items -->
            
               <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=Name %> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="dashboard.jsp"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="logout.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
</nav>
<hr><br>
 <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
               
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                         (Notification) Keys updated for the day! 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-warning alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                         <% out.println(notification); %> 
                        </div>
                    </div>
                </div>
                
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                       <div class="huge">Encrypt</div>
                                        <div>Encrypt new file</div>
                                    </div>
                                </div>
                            </div>
                            <a href="encrypt.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Perform</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">Decrypt</div>
                                        <div>Decrypt received file</div>
                                    </div>
                                </div>
                            </div>
                            <a href="decrypt.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Perform</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">Keys</div>
                                        <div>keys for today</div>
                                    </div>
                                </div>
                            </div>
                            <a href="" data-toggle="modal" data-target="#key">
                                <div class="panel-footer" >
                                    <span class="pull-left" >Display</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix" ></div>
                                </div>
                            </a>
                        </div>
                    </div>
					<script>
					
					</script>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">Account</div>
                                        <div>Information</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" data-toggle="modal" data-target="#info">
                                <div class="panel-footer">
                                    <span class="pull-left">Display</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <hr>
                
<div class="col-lg-2">
</div>                   

 <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i><center>Activities</center></h3>
                            </div>
                            <div class="panel-body">
                             <div class="panel panel-primary">
                            <div class="panel-heading"><center> All I have encrypted </center> </div>
                            <div class="panel-body">
                            <%
                            stmt  = conn.createStatement();    
                            sql="";    
                            sql="select d,f,description,id from message where sender='"+username+"'"; 
                            rs = stmt.executeQuery(sql);	
							try {
                            if(rs!=null) { %>
                            <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                            	<th>Date</th>
                                                <th>File Name</th>
                                                <th>Description</th>
                                                <th>Receiver/Sent to</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <tbody>
     											<%		while(rs.next()) {  %>
				                                 <tr>
				                                   <td><%=rs.getString(1)%></td>
				                                   <td><%=rs.getString(2)%></td>
				                                   <td><%=rs.getString(3)%></td>
				                                   <td><%=rs.getString(4)%></td>
				
				                                 </tr>
  <%    	}  %>	
                                        </tbody>
                                    </table>
                                </div>
                            
                            <h3><% 
                            }%></h3>
                            </div>
                            <% 
                            
                            }
                            catch(SQLException e) {
                            e.printStackTrace();
                            } stmt.close();rs.close();stmt=null;rs=null;

                            %>
                            </div></div>
                            <hr>
                              <div class="panel-body">
                             <div class="panel panel-success">
                            <div class="panel-heading"><center><strong> All Files received </strong></center> </div>
                            <div class="panel-body">
                            <%
                            stmt  = conn.createStatement();    
                            sql="";    
                            sql="select d,f,description,sender from message where id='"+username+"'"; 
                            rs = stmt.executeQuery(sql);	
							try {
                            if(rs!=null) { %>
                            <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                            	<th>Date</th>
                                                <th>File Name</th>
                                                <th>Description</th>
                                                <th>Sender/Received from</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <tbody>
     											<%		while(rs.next()) {  %>
				                                 <tr>
				                                   <td><%=rs.getString(1)%></td>
				                                   <td><%=rs.getString(2)%></td>
				                                   <td><%=rs.getString(3)%></td>
				                                   <td><%=rs.getString(4)%></td>
				
				                                 </tr>
  <%    	}  %>	
                                        </tbody>
                                    </table>
                                </div>
                            
                            <h3><% 
                            }%></h3>
                            </div>
                            <% 
                            
                            }
                            catch(SQLException e) {
                            e.printStackTrace();
                            } stmt.close();rs.close();stmt=null;rs=null;
                            
                           
                            %>
                            </div></div>
                            
                            </div>
                        </div>
                    
                    
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

       
        <!-- /#page-wrapper -->

 
    <!-- /#wrapper -->

    <!-- jQuery -->
  <% 
   stmt  = conn.createStatement();
   sql="select D,pub,modulus from keyrsa where id='"+username+"' and D ='"+Date_today+"'"; 
   rs = stmt.executeQuery(sql);
   String m="",pub="",d="";
   try {
   if(rs!=null) {
   while(rs.next()) {
   d=rs.getString(1);
   pub=rs.getString(2);
   m=rs.getString(3);
}}}
catch(SQLException e) {
e.printStackTrace();
} stmt.close();rs.close();stmt=null;rs=null;
  

stmt  = conn.createStatement();
sql="select count(*) from message where sender ='"+username+"'"; 
rs = stmt.executeQuery(sql);
String count ="";
try {
if(rs!=null) {
	while(rs.next()) {
	count = rs.getString(1);}}}
catch(SQLException e) {
e.printStackTrace();
} stmt.close();rs.close();stmt=null;rs=null;
  conn.close();
  %>

	<div id="key" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" >
  <div class="modal-dialog" >
  <div class="modal-content">
      <div id="head" class="modal-header">
		<strong>Keys for the day</strong>
  
      </div>
      <div class="modal-body">
	<center><h3>Only Public Key and Modulus is displayed for security purposes.</h3></center>
	 <hr>
	 <h4> Date : <% out.println(d); %> </h4>
	 <br>
	 <h4> Public Key : <% out.println(pub); %> </h4>
	 <br>
	 <h4 style=" word-wrap: break-word;"> Modulus : <% out.println(m); %> </h4>
  </div>
  
   
<div class="modal-footer" class="close" >
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
</div>

  </div>
</div></div>

<div id="info" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" >
  <div class="modal-dialog" >
  <div class="modal-content">
      <div id="head" class="modal-header">
		<strong>My account information</strong>
  
      </div>
      <div class="modal-body">
	
	 <h4> Name : <strong><% out.println(Name); %> </strong></h4>
	 <h4> Email : <strong> <% out.println(Email); %></strong> </h4>
	 <h4> User-Id : <strong><% out.println(username); %> </strong></h4>
	 <h4> Account type : <strong></strong> </h4>
	 <h4> Files Encrypted : <strong><% out.println(count); %></strong></h4>
	 
  </div>
  
   <div class="modal-footer" class="close" >
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
  </div>
</div></div>

<script>

</script>
</body>
				<ul>
					<li>&copy; Encryptic. A Project by Subhayan Bhattacharya & Bhaskar Ghosh dastidar</li><li> <a href=#></a></li>
				</ul>
</html>
