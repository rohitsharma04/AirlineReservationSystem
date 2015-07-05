<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>ADMIN PANEL</title>
		<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
		<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script> 
		<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>
		<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			$(document).pngFix( );
			});
		</script>
	</head>
	<body>
		<div id="page-top-outer">  
			<h1>WELCOME TO THE ADMIN PANEL OF AIRLINE RESERVATION SYSTEM</h1>
		</div>
		<div class="nav-outer-repeat"> 
			<div class="nav-outer"> 
				<div id="nav-right">
					<div class="nav-divider">&nbsp;</div>
					<div class="showhide-account"><img src="images/shared/nav/nav_myaccount.gif" width="93" height="14" alt="" /></div>
					<div class="nav-divider">&nbsp;</div>
					<a href="" id="logout"><img src="images/shared/nav/nav_logout.gif" width="64" height="14" alt="" /></a>
					<div class="clear">&nbsp;</div>
				</div>
				<div class="nav">
					<div class="table">
						<ul class="current">
							<li><a href="#"><b>Flight Details</b></a>
								<div class="select_sub show">
									<ul class="sub">
										<li><a href="index.jsp">View all flight</a></li>
										<li  class="sub_show"><a href="#">Add flight</a></li>
										<li><a href="cancelflight.jsp">Cancel flight</a></li>
									</ul>
								</div>
							</li>
						</ul>
						<div class="nav-divider">&nbsp;</div>					
						<ul class="select">
							<li>
							<a href="#"><b>Aerodrum Details</b></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<div id="page-heading"><h2>Add flight</h2></div>
		<div class="add">
			<form method="post" action="">
				<table>
					<tr>
						<td>Company Name:</td>
						<td>
							<select class="border">
								<option selected>SELECT COMPANY</option>
								<option>Kingfisher</option>
								<option>Air India</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Flight Name:</td>
						<td><input type="text" class="border" name="fname"/></td>
					</tr>
					<tr>
						<td>Departure City:</td>
						<td>
							<select class="border" name="city1">
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
							<select class="border" name="city1">
								<option selected>SELECT CITY</option>
								<option>New Delhi</option>
								<option>Mumbai</option>
								<option>Kolkata</option>
								<option>Bengaluru</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Day:</td>
						<td>
							<select class="border" name="day">
								<option selected>SELECT DAY</option>
								<option value="1">Sunday</option>
								<option value="2">Monday</option>
								<option value="3">Tuesday</option>
								<option value="4">Wednesday</option>
								<option value="5">Thursday</option>
								<option value="6">Friday</option>
								<option value="7">Saturday</option>
							</select>
						</td>
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
						<th>&nbsp;</th>
						<td valign="top">
							<input type="submit" value="" class="form-submit" />
							<input type="reset" value="" class="form-reset"  />
						</td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>     
		<div id="footer">
			<div style="float:left; padding-left:20px;">Copyright &copy; 2015 - All Rights Reserved. </div>
			<div style="float:right; padding-right: 20px;">Designed and Developed by <a href="http://www.facebook.com/sakshimaskara07">Sakshi Maskara</a> & <a href="http://www.facebook.com/skyrohithigh">Rohit Sharma</a></div>
		</div>
	</body>
</html>