<!DOCTYPE html>
<html lang="en">
	<head>
		<title>AirLines</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
		<link href="css/searchStyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
		<script type="text/javascript" src="js/cufon-yui.js"></script>
		<script type="text/javascript" src="js/cufon-replace.js"></script>
		<script type="text/javascript" src="js/Myriad_Pro_italic_600.font.js"></script>
		<script type="text/javascript" src="js/Myriad_Pro_italic_400.font.js"></script>
		<script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
	</head>
<body id="page1">
	<!-- START PAGE SOURCE -->
	<div class="body1">
	  <div class="main">
		<header>
		  <div class="wrapper">
			<h1><a href="index.jsp" id="logo">AirLines</a><span id="slogan">International Travel</span></h1>
			<div class="right">
			  <nav>
				<ul id="top_nav">
				  <li><a href="#"><img src="images/img1.gif" alt=""></a></li>
				  <li><a href="#"><img src="images/img2.gif" alt=""></a></li>
				  <li class="bg_none"><a href="#"><img src="images/img3.gif" alt=""></a></li>
				</ul>
			  </nav>
			  <nav>
				<ul id="menu">
				  <li id="menu_active"><a href="index.jsp">Home</a></li>
				  <li><a href="bookings.jsp">Bookings</a></li>
				  <li><a href="checkstatus.jsp">Check status</a></li>
				  <li><a href="getfare.jsp">Get fare</a></li>
				  <li><a href="contacts.jsp">contacts</a></li>
				</ul>
			  </nav>
			</div>
		  </div>
		</header>
	  </div>
	</div>
	<div class="main">
	  <div id="banner">
		<div class="text1"> COMFORT<span>Guaranteed</span>
		  
		</div>
	  </div>
	</div>
	<div class="main">
	  <section id="content" >
		<h2 >Airline Reservation System</h2>
		<div class="search">
			<div>
				<div class="left" style="width:200px; padding-left:100px; float: left;">
					FROM
					<div class="clear"></div>
					<select class="border">
						<option selected>SELECT CITY</option>
						<option>New Delhi</option>
						<option>Mumbai</option>
						<option>Kolkata</option>
						<option>Bengaluru</option>
					</select>
				</div>
				<div  class="right"  style="width:200px; margin-left:20px;	float: left;">
					TO<div class="clear"></div>
					<select class="border">
						<option selected>SELECT CITY</option>
						<option>New Delhi</option>
						<option>Mumbai</option>
						<option>Kolkata</option>
						<option>Bengaluru</option>
					</select>
				</div>	
			</div>
			<div style="clear:both"></div>
			<div class="date">
				DATE<div class="clear"></div>
				<input class="border" type="date" id="datePicker"/>
			</div>
			<a href="#" style=" margin-left:140px; padding-left:95px ; width:200px;float:left;"class="button2">SEARCH FLIGHTS</a>
		</div>
	  </section>
	</div>
	<div class="body2">
	  <div class="main">
	    <footer>
		  <div class="footerlink">
			<p class="lf">Copyright &copy; 2015 - All Rights Reserved</p>
			<p class="rf">Designed and Developed by <a href="http://www.facebook.com/sakshimaskara07">Sakshi Maskara</a> & <a href="http://www.facebook.com/skyrohithigh">Rohit Sharma</a></p>
			<div style="clear:both;"></div>
		  </div>
		</footer>
	  </div>
	</div>
	<script type="text/javascript"> Cufon.now(); </script>
	<script>
		document.getElementById('datePicker').valueAsDate = new Date();
	</script>
	<!-- END PAGE SOURCE -->
</body>
</html>