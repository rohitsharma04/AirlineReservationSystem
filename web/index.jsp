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

    //Getting Aerodrums
    Criteria c2 = s.createCriteria(AerodrumMaster.class);
    List<AerodrumMaster> listOfAerodrums = c2.list();
%>

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
                    <form method="get" action="index.jsp">
                        <div>
                            <div class="left" style="width:200px; padding-left:240px; float: left;">
                                FROM
                                <div class="clear"></div>
                                <select class="border" name="from">
                                    <option value="-1" selected>SELECT CITY</option>
                                    <%
                                        for (AerodrumMaster aerodrum : listOfAerodrums) {

                                    %>
                                    <option value="<%=aerodrum.getAerodrumId()%>"><%=aerodrum.getAerodrumName()%></option>
                                    <%                                    }
                                    %>
                                </select>
                            </div>
                            <div  class="right"  style="width:200px; margin-left:20px; 	float: left;">
                                TO<div class="clear"></div>
                                <select class="border" name="to">
                                    <option value="-1" selected>SELECT CITY</option>
                                    <%
                                        for (AerodrumMaster aerodrum : listOfAerodrums) {

                                    %>
                                    <option value="<%=aerodrum.getAerodrumId()%>"><%=aerodrum.getAerodrumName()%></option>
                                    <%                                    }
                                    %>
                                </select>
                            </div>	
                        </div>
                        <div style="clear:both"></div>
                        <div class="date" style="margin-left: 340px;">
                            DATE<div class="clear"></div>
                            <input class="border" type="date" name="date" id="datePicker"/>
                        </div>
                        <input type="submit" value="SEARCH FLIGHTS" style=" margin-left:275px; padding-left:95px;padding-right: 95px ; float:left;"class="button2"/>
                    </form>
                </div>
                <div class="res"><!--style="display:none;"-->
                    <form>

                        <%-- Printing Flight Details if found --%>
                        <%
                            //When Search is entered
                            String to = request.getParameter("to");
                            String from = request.getParameter("from");
                            String date = request.getParameter("date");
                            //Found the souce and checking if there is any flight which will go from source to destination on the said day
                            Date d;
                            if (date != null) {
                                d = Date.valueOf(date);
                                DayMaster day = (DayMaster) s.get(DayMaster.class, d.getDay() + 1);
                                //out.println("<h1 style=\"color:red;\">" + day.getDayName() + "</h1>");
                                List<FlightMaster> flights = day.getFlights();
                                Boolean isFlightFound = false;
                                for (FlightMaster flight : flights) {
                                    if (flight.getSourceId().getAerodrumId() == Integer.parseInt(from)
                                            && flight.getDestinationId().getAerodrumId() == Integer.parseInt(to)) {
                                        isFlightFound = true;
                        %>

                        <table>
                            <tr>
                                <td>Departure City:</td>
                                <td><%=flight.getSourceId().getAerodrumName()%></td>
                            </tr>
                            <tr>
                                <td>Destination City:</td>
                                <td><%=flight.getDestinationId().getAerodrumName()%></td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td><%=date%></td>
                            </tr>
                            <tr>
                                <td>Departure Time:</td>
                                <td><%=flight.getDepartureTime().toString()%></td>
                            </tr>
                            <tr>
                                <td>Arrival Time:</td>
                                <td><%=flight.getArrivalTime().toString()%></td>
                            </tr>
                            <%
                                for (FlightFareMap fare : flight.getFare()) {
                            %>
                            <tr>
                                <td><%=fare.getClassId().getClassName()%>Class:</td>
                                <td><%=fare.getFare()+" INR"%></td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td colspan=2><a href="bookings.jsp?flightNumber=<%=flight.getFlightNumber()%>&date=<%=date%>" style="float:left;"class="button2">BOOK THIS >></a></td>
                            </tr>
                        </table>


                        <%                                                }
                            }
                            if (!isFlightFound) {
                        %>
                        <h3 style="font-size:23px;">No Flights Found</h3>
                        <%
                                }
                            }
                        %>

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
        <script type="text/javascript"> Cufon.now();</script>
        <script>
            document.getElementById('datePicker').valueAsDate = new Date();
        </script>
        <!-- END PAGE SOURCE -->
    </body>
</html>