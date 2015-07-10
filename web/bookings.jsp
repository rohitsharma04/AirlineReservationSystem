<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.FlightFareMap"%>
<%@page import="entity.FlightMaster"%>
<%@page import="java.sql.Date"%>
<%@page import="entity.ClassMaster"%>
<%@page import="entity.DayMaster"%>
<%@page import="entity.AerodrumMaster"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entity.CompanyMaster"%>
<%@page import="daolayer.HibernateDAOLayer"%>
<%@page import="org.hibernate.Session"%>
<%
    Session s = HibernateDAOLayer.getSession();
    Criteria c = s.createCriteria(ClassMaster.class);
    pageContext.setAttribute("listOfClasses", c.list());
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Bookings</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="favicon.ico"/>
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
    <body id="page2">
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
                                    <li id="menu_active"><a href="bookings.jsp">Bookings</a></li>
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
            <section id="content">
                <div class="book">
                    <a href="bookings.jsp" style="float:left;"class="button1 current">RESERVATION OF TICKETS</a>
                    <a href="cancel.jsp" style="float:left;"class="button1">CANCELLATION OF TICKETS</a>
                </div>
                <%-- Printing Message from the addflighthandler --%>
                <c:if test="${requestScope.message != null}">
                    <h3 style="color: red;">${requestScope.message}</h3>
                </c:if>
                <div class="res">
                    <form method="POST" action="reservationhandler">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <h2>Flight Details</h2>
                                </td>
                            </tr>
                            <tr>
                                <td>Flight Number:</td>
                                <td>
                                    <input type="text" name="flightNumber" class="border" 
                                           required oninvalid="setCustomValidity('Please Enter Correct Flight Number')" oninput="setCustomValidity('')"
                                           value ="${param.flightNumber}" 
                                           <c:if test="${param.flightNumber != null}">readonly="true"</c:if>
                                               />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Date:
                                    </td>
                                    <td>
                                        <input type="date" class="border" name="dateOfJourney" id="datePicker" required oninvalid="setCustomValidity('Please enter your date of Journey')" oninput="setCustomValidity('')"
                                               value="${param.date}"
                                        <c:if test="${param.date != null}">readonly="true"</c:if>
                                            />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Class:</td>
                                    <td>
                                        <select class="border" name="class" value="---CHOOSE CLASS---" required oninvalid="setCustomValidity('Please Choose a Class')" oninput="setCustomValidity('')">
                                            <option value="" >SELECT CLASS</option>
                                        <c:forEach var="c" items="${listOfClasses}">
                                            <option value="${c.getClassId()}">${c.getClassName()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <h2>Personal Details</h2>
                                </td>
                            </tr>
                            <tr>
                                <td>Full Name:</td>
                                <td><input type="text" name="passengerName" class="border" required pattern="[A-Za-z\s]+" oninvalid="setCustomValidity('Please Enter Your Name Correctly')" oninput="setCustomValidity('')"/></td>
                            </tr>
                            <tr>
                                <td>Date Of Birth:</td>
                                <td>
                                    <input  class="border" name="dateOfBirth" type="date" id="datePicker" required oninvalid="setCustomValidity('Please Enter your Birthdate')" oninput="setCustomValidity('')"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender:</td>
                                <td><input type="radio" name="gender" value="female" required />F
                                    <input type="radio" name="gender" value="male" required />M</td>
                            </tr>
                            <tr>
                                <td>City:</td>
                                <td><input type="text" name="city" class="border" required pattern="[A-Za-z\s]+" oninvalid="setCustomValidity('Please Enter the name of your city')" oninput="setCustomValidity('')"/></td>
                            </tr>
                            <tr>
                                <td>Passport ID:</td>
                                <td><input type="text" name="passportId" class="border" pattern="[A-Z0-9]+" required oninvalid="setCustomValidity('Enter Your Passport Number')" oninput="setCustomValidity('')"/></td>
                            </tr>
                            <tr>
                                <td>Email ID:</td>
                                <td><input type="email" name="email" class="border" required oninvalid="setCustomValidity('Please Enter Valid Email')" oninput="setCustomValidity('')"/></td>
                            </tr>
                            <tr>
                                <td>Contact No:</td>
                                <td><input type="text" name="contactNumber" class="border" pattern="[0-9]{10}" required oninvalid="setCustomValidity('Please Enter Your 10 digit Mobile Number')" oninput="setCustomValidity('')" /></td>
                            </tr>
                            <tr>
                                <td colspan=2><input type="submit" value = "BOOK NOW" style="float:left;"class="button2"/></td>
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
        </div><!--
        <script>
            document.getElementById('datePicker').valueAsDate = new Date();
        </script>
        -->
        <script type="text/javascript"> Cufon.now();</script>
        <!-- END PAGE SOURCE -->
    </body>
</html>