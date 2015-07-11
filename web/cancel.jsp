<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.ClassMaster"%>
<%@page import="entity.AerodrumMaster"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entity.FlightMaster"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="entity.CustomerDetails"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Cancellation</title>
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
    </head>
    <body id="page2" <c:if test="${requestScope.message != null}"> onload="swal({
                title: '${requestScope.message}',
                text: 'Your Amount will be refunded Soon',
                type: 'success'
            });"</c:if>
        <c:if test="${requestScope.emessage != null}"> onload="swal({
                    title: 'Reservation Cancellation Failed',
                    text: 'ERROR : ${requestScope.emessage}',
                    type: 'error'
                });"</c:if>
            >
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
                        <a href="bookings.jsp" style="float:left;"class="button1">RESERVATION OF TICKETS</a>
                        <a href="cancel.jsp" style="float:left;"class="button1 current">CANCELLATION OF TICKETS</a>
                    </div>
                <c:if test="${requestScope.message != null or requestScope.emessage != null}">
                    <a href="cancel.jsp" style="float:left;"class="button2"><< BACK</a>
                </c:if>
                <c:if test="${requestScope.message == null and requestScope.emessage == null}">
                    <c:if test="${param.pnrno == null}">
                        <form action="cancel.jsp" method="get">
                            <div class="cancel" > <!--style="display:none;"--> 
                                <div class="up">
                                    <span><b>ENTER YOUR PNR NO:</b></span>
                                    <input type="text" name="pnrno" class="border" required pattern="[0-9]+" oninvalid="setCustomValidity('Please Enter Your PNR Number')" oninput="setCustomValidity('')"/>
                                </div>
                                <input type="submit" value="SUBMIT" style="float:left;" class="button2"/>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${param.pnrno != null}">
                        <%
                            Session s = daolayer.HibernateDAOLayer.getSession();
                            Criteria c = s.createCriteria(CustomerDetails.class);
                            c.add(Restrictions.eq("pnrNumber", Integer.parseInt(request.getParameter("pnrno"))));
                            pageContext.setAttribute("listOfPnr", c.list());
                        %>
                        <c:if test="${listOfPnr.isEmpty()}">
                            <script type="text/javascript">
                                swal({
                                    title: "No Reservation Record Found",
                                    text: "Please Make Sure You are Entering the Correct PNR",
                                    timer: 2000,
                                    showConfirmButton: false});
                            </script>
                            <form action="cancel.jsp" method="get">
                                <div class="cancel" > <!--style="display:none;"--> 
                                    <div class="up">
                                        <span><b>ENTER YOUR PNR NO:</b></span>
                                        <input type="text" name="pnrno" class="border" required pattern="[0-9]+" oninvalid="setCustomValidity('Please Enter Your PNR Number')" oninput="setCustomValidity('')"/>
                                    </div>
                                    <input type="submit" value="SUBMIT" style="float:left;" class="button2"/>
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${! listOfPnr.isEmpty()}">
                            <%
                                pageContext.setAttribute("customer", c.list().get(0));
                            %>
                            <div class="cancel" ><!--style="display:none;"-->
                                <div class="up">

                                    <span><b>YOUR FLIGHT DETAILS ARE:</b></span>
                                    <table>
                                        <tr>
                                            <td>Flight No:</td>
                                            <td>${customer.getFlightNumber().getFlightNumber()}</td>
                                        </tr>
                                        <tr>
                                            <td>Flight Name:</td>
                                            <td>${customer.getFlightNumber().getFlightName()}</td>
                                        </tr>
                                        <tr>
                                            <td>Departure City:</td>
                                            <td>${customer.getFlightNumber().getSourceId().getAerodrumName()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Destination City:</td>
                                            <td>
                                                ${customer.getFlightNumber().getDestinationId().getAerodrumName()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Arrival Time:</td>
                                            <td>${customer.getFlightNumber().getArrivalTime()}</td>
                                        </tr>
                                        <tr>
                                            <td>Departure Time:</td>
                                            <td>${customer.getFlightNumber().getDepartureTime()}</td>
                                        </tr>
                                        <tr>
                                            <td>Class:</td>
                                            <td>${customer.getClassId().getClassName()}</td>
                                        </tr>
                                    </table>

                                    <span>Are you sure you want to cancel your booking?</span>
                                </div>
                                <a href="cancellationhandler?pnrno=${param.pnrno}" style="float:left;"class="button2">YES</a>
                                <a href="cancel.jsp" style="float:left;"class="button2">NO</a>
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