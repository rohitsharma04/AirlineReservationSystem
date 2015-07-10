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
    //Getting Aerodrums
    Criteria c1 = s.createCriteria(AerodrumMaster.class);
    pageContext.setAttribute("listOfAerodrums", c1.list());
    //Getting Class from ClassMaster
    Criteria c2 = s.createCriteria(ClassMaster.class);
    pageContext.setAttribute("listOfClasses", c2.list());
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Get Fare</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="favicon.ico"/>
        <!-- SWeet Alert -->
        <script src="dist/jquery-2.1.3.min.js"></script>
        <script src="dist/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="dist/sweetalert.css">
        <!--.......................-->
        <!--             -->
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
                                    <select class="border" name="sourceId" required oninvalid="setCustomValidity('Please Choose Source City')" oninput="setCustomValidity('')">
                                        <option value="">SELECT CITY</option>
                                        <c:forEach var="aerodrum" items="${listOfAerodrums}">
                                            <option value="${aerodrum.getAerodrumId()}">${aerodrum.getCity()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Destination City:</td>
                                <td>
                                    <select class="border" name="destinationId" required oninvalid="setCustomValidity('Please Choose Destination City')" oninput="setCustomValidity('')">
                                        <option value="">SELECT CITY</option>
                                        <c:forEach var="aerodrum" items="${listOfAerodrums}">
                                            <option value="${aerodrum.getAerodrumId()}">${aerodrum.getCity()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td><input type="date" name="date" id="datePicker" class="border"  required oninvalid="setCustomValidaty('Please select a Date')"/></td>
                            </tr>

                            <tr>
                                <td>Class:</td>
                                <td>
                                    <select class="border" name="classId" value="---CHOOSE CLASS---" required oninvalid="setCustomValidity('Please Choose Class')" oninput="setCustomValidity('')">
                                        <option value="">SELECT CLASS </option>
                                        <c:forEach var="c" items="${listOfClasses}">
                                            <option value="${c.getClassId()}">${c.getClassName()} Class</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" class="button2" style="float: left;" value="GET FARE" /></td>

                            </tr>
                        </table>
                    </form>
                </div>
                <%-- Printing Flight Details if found --%>
                <c:if test="${param.sourceId != null && param.destinationId != null && param.classId != null && param.date != null}">
                    <%
                        DayMaster day = (DayMaster) s.get(DayMaster.class, Date.valueOf(request.getParameter("date")).getDay() + 1);
                        pageContext.setAttribute("flights", day.getFlights());
                    %>
                    <c:forEach var="flight" items="${flights}">
                        <c:if test="${flight.getSourceId().getAerodrumId() == Integer.parseInt(param.sourceId)
                                      && flight.getDestinationId().getAerodrumId() == Integer.parseInt(param.destinationId)}">
                            <c:set scope="page" var="isFlightFound" value="true"/>
                            <div class="res"><!--style="display:none;"-->   
                                <table>
                                    <tr>
                                        <td>
                                            <h2>Fare Details</h2>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Flight Number:</td>
                                        <td>${flight.getFlightNumber()}</td>
                                    </tr>
                                    <tr>
                                        <td>Departure City:</td>
                                        <td>${flight.getSourceId().getAerodrumName()}</td>
                                    </tr>
                                    <tr>
                                        <td>Destination City:</td>
                                        <td>${flight.getDestinationId().getAerodrumName()}</td>
                                    </tr>
                                    <tr>
                                        <td>Date:</td>
                                        <td>${param.date}</td>
                                    </tr>
                                    <tr>
                                        <td>Departure Time:</td>
                                        <td>${flight.getDepartureTime().toString()}</td>
                                    </tr>
                                    <tr>
                                        <td>Arrival Time:</td>
                                        <td>${flight.getArrivalTime().toString()}</td>
                                    </tr>
                                    <tr>
                                        <td>Class:</td>
                                        <td>${flight.getFare().get(Integer.parseInt(param.classId) - 1).getClassId().getClassName()}</td>
                                    </tr>
                                    <tr>
                                        <td><H3 style="font-size:23px; ">FARE : ${flight.getFare().get(Integer.parseInt(param.classId) - 1).getFare()} INR</H3></td>
                                    </tr>
                                    <tr>
                                        <td colspan=2><a href="#" style="float:left;"class="button2"><< BACK</a></td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:if test="${isFlightFound != 'true'}">
                        <!-- <h3 style="font-size:23px;">No Flights Found</h3> -->
                        <script type="text/javascript">
                            swal({
                                title: "No Flights Found",
                                text: "Please Try Searching for Other Fare Details",
                                timer: 2000,
                                showConfirmButton: false});
                        </script>
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
        <script>
            document.getElementById('datePicker').valueAsDate = new Date();
        </script>
        <!-- END PAGE SOURCE -->
    </body>
</html>