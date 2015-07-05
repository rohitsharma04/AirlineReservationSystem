<!DOCTYPE html>
<html lang="en">
<head>
<title>AirLines | Get Fare</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_italic_600.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_italic_400.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/ie6_script_other.js"></script>
<script type="text/javascript" src="js/html5.js"></script>
<![endif]-->
</head>
<body id="page3">
<!-- START PAGE SOURCE -->
<div class="body1">
  <div class="main">
    <header>
      <div class="wrapper">
        <h1><a href="index.jsp" id="logo">AirLines</a><span id="slogan">International Travel</span></h1>
        <div class="right">
          <nav>
            <ul id="top_nav">
              <li><a href="index.jsp"><img src="images/img1.gif" alt=""></a></li>
              <li><a href="#"><img src="images/img2.gif" alt=""></a></li>
              <li class="bg_none"><a href="#"><img src="images/img3.gif" alt=""></a></li>
            </ul>
          </nav>
          <nav>
            <ul id="menu">
              <li><a href="index.jsp">Home</a></li>
              <li ><a href="bookings.jsp">Bookings</a></li>
              <li><a href="checkstatus.jsp">Check status</a></li>
              <li id="menu_active"><a href="getfare.jsp">Get fare</a></li>
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
  <section id="content">
    <div class="res"><!--style="display:none;"-->
		<form>
			<table>
				<tr>
					<td>Departure City:</td>
					<td>
						<select class="border">
							<option selected>SELECT CITY</option>
							<option>New Delhi</option>
							<option>Mumbai</option>
							<option>Kolkata</option>
							<option>Bengaluru</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Destination City:</td>
					<td>
						<select class="border">
							<option selected>SELECT CITY</option>
							<option>New Delhi</option>
							<option>Mumbai</option>
							<option>Kolkata</option>
							<option>Bengaluru</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Date:</td>
					<td><input type="date" name="date" id="datePicker" class="border" /></td>
				</tr>
				<tr>
					<td>Departure Time:</td>
					<td><input type="time" name="departuretime" class="border" /></td>
				</tr>
				<tr>
					<td>Arrival Time:</td>
					<td><input type="time" name="arrivaltime" class="border" /></td>
				</tr>
				<tr>
					<td>Class:</td>
					<td>
						<select class="border" name="class" value="---CHOOSE CLASS---">
							<option value="1">Business</option>
							<option value="2">First Class</option>
							<option value="3">Economy</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan=2><a href="#" style="float:left;"class="button2">GET FARE</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="res"><!--style="display:none;"-->
		<form>
			<table>
				<tr>
					<td>Departure City:</td>
					<td></td>
				</tr>
				<tr>
					<td>Destination City:</td>
					<td></td>
				</tr>
				<tr>
					<td>Date:</td>
					<td></td>
				</tr>
				<tr>
					<td>Departure Time:</td>
					<td></td>
				</tr>
				<tr>
					<td>Arrival Time:</td>
					<td></td>
				</tr>
				<tr>
					<td>Class:</td>
					<td></td>
				</tr>
				<tr>
					<td><H3 style="font-size:23px; ">FARE : 2000 INR</H3></td>
				</tr>
				<tr>
					<td colspan=2><a href="#" style="float:left;"class="button2"><< BACK</a></td>
				</tr>
			</table>
		</form>
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