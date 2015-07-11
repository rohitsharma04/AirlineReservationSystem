<%@page import="entity.FlightFareMap"%>
<%@page import="java.sql.Date"%>
<%@page import="entity.CustomerDetails"%>
<%@page import="entity.DayMaster"%>
<%@page import="daolayer.HibernateDAOLayer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.AerodrumMaster"%>
<%@page import="entity.ClassMaster"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entity.FlightMaster"%>
<%@page import="org.hibernate.Session"%>
<%!
    public static int findNumberOfSeats(FlightMaster fm, String date) {
        Date d = Date.valueOf(date);
        int bookedSeats = 0;
        for (CustomerDetails c : fm.getCustomers()) {
            if (d.getTime() == c.getReservationDate().getTime()) {
                bookedSeats++;
            }
        }
        int totalSeats = 0;
        for (FlightFareMap ffm : fm.getFare()) {
            totalSeats += ffm.getNumberOfSeats();
        }
        return totalSeats - bookedSeats;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Check Status</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="favicon.ico"/>
        <!-- SWeet Alert -->
        <script src="dist/jquery-2.1.3.min.js"></script>
        <script src="dist/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="dist/sweetalert.css">
        <!--.......................-->
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
    <body id="page4">
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
                                    <li><a href="contacts.jsp"><img src="images/img2.gif" alt=""></a></li>
                                    <li class="bg_none"><a href="adminlogin.jsp"><img src="images/img3.gif" alt=""></a></li>
                                </ul>
                            </nav>

                            <nav>
                                <ul id="menu">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li ><a href="bookings.jsp">Bookings</a></li>
                                    <li id="menu_active"><a href="checkstatus.jsp">Check status</a></li>
                                    <li ><a href="getfare.jsp">Get fare</a></li>
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
                    <a href="#" style="float:left;"class="button1 current">CHECK FLIGHT STATUS</a>
                    <a href="pnrstatus.jsp" style="float:left;"class="button1">CHECK PNR STATUS</a>
                </div>
                <c:if test="${param.flightno == null}">
                    <form action="checkstatus.jsp" method="get">
                        <div class="cancel" > <!--style="display:none;"--> 
                            <div class="up">
                                <span><b>ENTER FLIGHT NO:</b></span>
                                <input type="text" name="flightno" class="border" pattern="[0-9]+" required oninvalid="setCustomValidity('Please Enter Flight Number')" oninput="setCustomValidity('')"/>
                            </div>
                            <div class="up" >
                                <span><b>SELECT DATE :</b></span>
                                <input type="date" name="date" class="border" id="datePicker"
                                       required style="margin-left: 30px;"
                                       oninvalid="setCustomValidity('Please enter your date of Journey')" 
                                       oninput="setCustomValidity('')">
                            </div>
                            <input type="submit" value="CHECK STATUS" style="float:left;" class="button2"/>
                        </div>
                    </form>
                </c:if>
                <c:if test="${param.flightno != null}">
                    <%
                        Session s = HibernateDAOLayer.getSession();
                        Criteria c = s.createCriteria(FlightMaster.class);
                        c.add(Restrictions.eq("flightNumber", Integer.parseInt(request.getParameter("flightno"))));
                        pageContext.setAttribute("listOfFlights", c.list());
                    %>
                    <c:if test="${listOfFlights.isEmpty()}">
                        <script type="text/javascript">
                            swal({
                                title: "No Flights Found",
                                text: "Please Make Sure You are Entering the Correct Flight Number",
                                timer: 2000,
                                showConfirmButton: false});
                        </script>
                        <form action="checkstatus.jsp" method="get">
                            <div class="cancel" > <!--style="display:none;"--> 
                                <div class="up">
                                    <span><b>ENTER FLIGHT NO:</b></span>
                                    <input type="text" name="flightno" class="border" pattern="[0-9]+" required oninvalid="setCustomValidity('Please Enter Flight Number')" oninput="setCustomValidity('')"/>
                                </div>
                                <div class="up" >
                                    <span><b>SELECT DATE :</b></span>
                                    <input type="date" name="date" class="border" id="datePicker"
                                           required style="margin-left: 30px;"
                                           oninvalid="setCustomValidity('Please enter your date of Journey')" 
                                           oninput="setCustomValidity('')">
                                </div>
                                <input type="submit" value="CHECK STATUS" style="float:left;" class="button2"/>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${!listOfFlights.isEmpty()}">
                        <%
                            Date date = Date.valueOf(request.getParameter("date"));
                            Boolean flag = false;
                            for (DayMaster dm : ((FlightMaster) c.list().get(0)).getDays()) {
                                if (dm.getDayId() == (date.getDay() + 1)) {
                                    flag = true;
                                }
                            }
                            pageContext.setAttribute("flag", flag);
                        %>
                        <c:if test="${!flag}">
                            
                        <script type="text/javascript">
                            swal({
                                title: "Not Scheduled",
                                text: "The Flight is not scheduled on the ${param.date}",
                                timer: 2000,
                                showConfirmButton: false});
                        </script>
                        <form action="checkstatus.jsp" method="get">
                            <div class="cancel" > <!--style="display:none;"--> 
                                <div class="up">
                                    <span><b>ENTER FLIGHT NO:</b></span>
                                    <input type="text" name="flightno" class="border" pattern="[0-9]+" required oninvalid="setCustomValidity('Please Enter Flight Number')" oninput="setCustomValidity('')"/>
                                </div>
                                <div class="up" >
                                    <span><b>SELECT DATE :</b></span>
                                    <input type="date" name="date" class="border" id="datePicker"
                                           required style="margin-left: 30px;"
                                           oninvalid="setCustomValidity('Please enter your date of Journey')" 
                                           oninput="setCustomValidity('')">
                                </div>
                                <input type="submit" value="CHECK STATUS" style="float:left;" class="button2"/>
                            </div>
                        </form>
                        </c:if>
                        <c:if test="${flag}">
                            <div class="pnr" ><!--style="display:none;"-->
                                <br>
                                <span><b>FLIGHT DETAILS OF ${param.flightno} ARE:</b></span>
                                <table>
                                    <tr>
                                        <td>Flight Name:</td>
                                        <td>${listOfFlights.get(0).getFlightName()}</td>
                                    </tr>
                                    <tr>
                                        <td>Departure City:</td>
                                        <td>${listOfFlights.get(0).getSourceId().getAerodrumName()}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Destination City:</td>
                                        <td>${listOfFlights.get(0).getDestinationId().getAerodrumName()}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Days:</td>
                                        <td>
                                            <c:forEach var="day" items="${listOfFlights.get(0).days}">
                                                ${day.getDayName()},
                                            </c:forEach>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Arrival Time:</td>
                                        <td>${listOfFlights.get(0).getArrivalTime()}</td>
                                    </tr>
                                    <tr>
                                        <td>Departure Time:</td>
                                        <td>${listOfFlights.get(0).getDepartureTime()}</td>
                                    </tr>
                                    <% FlightMaster flight = (FlightMaster) c.list().get(0);%>
                                    <tr>
                                        <td>No. of seats available:</td>
                                        <td><%= findNumberOfSeats(flight, request.getParameter("date"))%></td>
                                    </tr>
                                    <tr>
                                        <td colspan=2><a href="checkstatus.jsp" style="float:left;"class="button2"><< BACK</a></td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
                    </c:if>
                </c:if>
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
        <script type="text/javascript"> Cufon.now();</script>
        <!-- END PAGE SOURCE -->
    </body>
</html>