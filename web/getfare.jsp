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
    //Getting days from DayMaster
    Criteria c3 = s.createCriteria(DayMaster.class);
    List<DayMaster> listOfDays = c3.list();
    //Getting Class from ClassMaster
    Criteria c4 = s.createCriteria(ClassMaster.class);
    List<ClassMaster> listOfClasses = c4.list();
%>

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
                    <form method="get" action="getfare.jsp">
                        <table>
                            <tr>
                                <td>Departure City:</td>
                                <td>
                                    <select class="border" name="sourceId">
                                        <option value="-1" selected>SELECT CITY</option>
                                        <%
                                            for (AerodrumMaster aerodrum : listOfAerodrums) {
                                        %>
                                        <option value="<%=aerodrum.getAerodrumId()%>"><%=aerodrum.getCity()%></option>
                                        <% }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Destination City:</td>
                                <td>
                                    <select class="border" name="destinationId">
                                        <option value="-1" selected>SELECT CITY</option>
                                        <%
                                            for (AerodrumMaster aerodrum : listOfAerodrums) {
                                        %>
                                        <option value="<%=aerodrum.getAerodrumId()%>"><%=aerodrum.getCity()%></option>
                                        <% }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td><input type="date" name="date" id="datePicker" class="border" /></td>
                            </tr>

                            <tr>
                                <td>Class:</td>
                                <td>
                                    <select class="border" name="class" value="---CHOOSE CLASS---">
                                        <%
                                            for (ClassMaster c : listOfClasses) {

                                        %>
                                        <option value="<%=c.getClassId()%>"><%=c.getClassName() + " Class"%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" class="button2" style="float: left;" value="GET FARE" /></td>

                            </tr>
                        </table>
                    </form>
                </div>
                <div class="res"><!--style="display:none;"-->

                    <%-- Printing Flight Details if found --%>
                    <%
                        //When Search is entered
                        String sourceId = request.getParameter("sourceId");
                        String destinationId = request.getParameter("destinationId");
                        String date = request.getParameter("date");
                        String classId = request.getParameter("class");
                        //Found the souce and checking if there is any flight which will go from source to destination on the said day
                        Date d;
                        if (date != null) {
                            d = Date.valueOf(date);
                            DayMaster day = (DayMaster) s.get(DayMaster.class, d.getDay() + 1);
                            //out.println("<h1>" + day.getDayName() + "</h1>");
                            List<FlightMaster> flights = day.getFlights();
                            Boolean isFlightFound = false;
                            for (FlightMaster flight : flights) {
                                if (flight.getSourceId().getAerodrumId() == Integer.parseInt(sourceId)
                                        && flight.getDestinationId().getAerodrumId() == Integer.parseInt(destinationId)) {
                                    isFlightFound = true;

                                    //out.println("Flight Found");
                    %>
                    <table>
                        <tr>
                            <td>
                                <h2>Fare Details</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>Flight Number:</td>
                            <td><%=flight.getFlightNumber()%></td>
                        </tr>
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
                            <td><%=d.toString()%></td>
                        </tr>
                        <tr>
                            <td>Departure Time:</td>
                            <td><%=flight.getDepartureTime().toString()%></td>
                        </tr>
                        <tr>
                            <td>Arrival Time:</td>
                            <td><%=flight.getArrivalTime().toString()%></td>
                        </tr>
                        <tr>
                            <td>Class:</td>
                            <td><%=flight.getFare().get(Integer.parseInt(classId) - 1).getClassId().getClassName()%></td>
                        </tr>
                        <tr>
                            <td><H3 style="font-size:23px; ">FARE : <%=flight.getFare().get(Integer.parseInt(classId) - 1).getFare()%> INR</H3></td>
                        </tr>
                        <tr>
                            <td colspan=2><a href="#" style="float:left;"class="button2"><< BACK</a></td>
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