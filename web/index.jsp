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
        <link rel="stylesheet" href="themes/default/default.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="themes/light/light.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="themes/dark/dark.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="themes/bar/bar.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />

        <script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-replace.js"></script>
        <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
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
            <div id="wrapper">
                <div class="slider-wrapper theme-default">
                    <div id="slider" class="nivoSlider">
                        <img src="images/slider1.jpg" data-thumb="images/slider1.jpg" alt="" />
                        <img src="images/slider2.jpg" data-thumb="images/slider2.jpg" alt="" />
                        <img src="images/slider3.jpg" data-thumb="images/slider3.jpg" alt=""  />
                        <img src="images/slider4.jpg" data-thumb="images/slider4.jpg" alt=""  />
                    </div>
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
                                <b>FROM</b>
                                <div class="clear"></div>
                                <select class="border" name="from" required oninvalid="setCustomValidity('Please Choose Source City')" oninput="setCustomValidity('')">
                                    <option value="">--SELECT CITY--</option>
                                    <%
                                        for (AerodrumMaster aerodrum : listOfAerodrums) {

                                    %>
                                    <option value="<%=aerodrum.getAerodrumId()%>"><%=aerodrum.getAerodrumName()%></option>
                                    <%                                    }
                                    %>
                                </select>
                            </div>
                            <div  class="right"  style="width:200px; margin-left:20px; 	float: left;">
                                <b>TO</b><div class="clear"></div>
                                <select class="border" name="to" required oninvalid="setCustomValidity('Please Choose Destination City')" oninput="setCustomValidity('')">
                                    <option value="">SELECT CITY</option>
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
                            <b>DATE</b><div class="clear"></div>
                            <input class="border" type="date" name="date" id="datePicker" required oninvalid="setCustomValidity('Please Enter a correct Date')" oninput="setCustomValidity('')"/>
                        </div>
                        <input type="submit" value="SEARCH FLIGHTS" style=" margin-left:275px; padding-left:95px;padding-right: 95px ; float:left;"class="button2"/>
                    </form>
                </div>
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
                <div class="res"><!--style="display:none;"-->
                    <form>
                        <table>
                            <tr>
                                <td>
                                    Flight Number:
                                </td>
                                <td>
                                    <%=flight.getFlightNumber()%>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    Flight Name:
                                </td>
                                <td>
                                    <%=flight.getFlightName()%>
                                </td>
                            </tr>
                            <tr>
                                <td><b>Departure City:</b></td>
                                <td><%=flight.getSourceId().getAerodrumName()%></td>
                                <td><b>Destination City:</b></td>
                                <td><%=flight.getDestinationId().getAerodrumName()%></td>
                            </tr>
                            <tr>
                                <td><b>Date:</b></td>
                                <td><%=date%></td>
                            </tr>
                            <tr>
                                <td><b>Departure Time:</b></td>
                                <td><%=flight.getDepartureTime().toString()%></td>
                                <td><b>Arrival Time:</b></td>
                                <td><%=flight.getArrivalTime().toString()%></td>
                            </tr>

                            <tr>
                                <%
                                    for (FlightFareMap fare : flight.getFare()) {
                                %>
                                <td><b><%=fare.getClassId().getClassName()%> Class:</b></td>
                                <td><%=fare.getFare() + " INR"%></td>
                                <%
                                    }
                                %>
                            </tr>

                            <tr>
                                <td colspan=2><a href="bookings.jsp?flightNumber=<%=flight.getFlightNumber()%>&date=<%=date%>" style="float:left;"class="button2">BOOK THIS >></a></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <%                                                }
                    }
                    if (!isFlightFound) {
                %>
                <h3 style="font-size:23px;">No Flights Found</h3>
                <%
                        }
                    }
                %>
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
        <script type="text/javascript">
            $(window).load(function () {
                $('#slider').nivoSlider();
            });
        </script>
        <script>
            $('#slider').nivoSlider({
                effect: 'random', // Specify sets like: 'fold,fade,sliceDown'
                slices: 15, // For slice animations
                boxCols: 8, // For box animations
                boxRows: 4, // For box animations
                animSpeed: 500, // Slide transition speed
                pauseTime: 3000, // How long each slide will show
                startSlide: 0, // Set starting Slide (0 index)
                directionNav: true, // Next & Prev navigation
                controlNav: true, // 1,2,3... navigation
                controlNavThumbs: false, // Use thumbnails for Control Nav
                pauseOnHover: true, // Stop animation while hovering
                manualAdvance: false, // Force manual transitions
                prevText: 'Prev', // Prev directionNav text
                nextText: 'Next', // Next directionNav text
                randomStart: true, // Start on a random slide
                beforeChange: function () {
                }, // Triggers before a slide transition
                afterChange: function () {
                }, // Triggers after a slide transition
                slideshowEnd: function () {
                }, // Triggers after all slides have been shown
                lastSlide: function () {
                }, // Triggers when last slide is shown
                afterLoad: function () {
                }         // Triggers when slider has loaded
            });
        </script>
        <!-- END PAGE SOURCE -->
    </body>
</html>