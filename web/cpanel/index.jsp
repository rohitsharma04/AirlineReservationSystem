<%@page import="org.hibernate.criterion.Projections"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.CompanyMaster"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entity.FlightMaster"%>
<%@page import="org.hibernate.Session"%>
<%@page import="daolayer.HibernateDAOLayer"%>
<%
    int pageSize, numberOfRows, pageNumber;
    Session s = HibernateDAOLayer.getSession();
    Criteria c1 = s.createCriteria(FlightMaster.class);
    c1.setProjection(Projections.rowCount());
    pageSize = 1;
    numberOfRows = Integer.parseInt(c1.list().get(0).toString());
    if (request.getParameter("pageNumber") == null) {
        pageNumber = 1;
    } else {
        try {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        } catch (NumberFormatException e) {
            pageNumber = 1;
        }
    }
    Criteria c2 = s.createCriteria(FlightMaster.class);
    c2.setFirstResult((pageNumber - 1) * pageSize);
    c2.setMaxResults(pageSize);
    pageContext.setAttribute("listOfFlights", c2.list());
    pageContext.setAttribute("pageNumber", pageNumber);
    pageContext.setAttribute("numberOfPages",Math.round((double)numberOfRows/pageSize));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>HOME OF Admin Panel</title>
        <link rel="shortcut icon" href="../favicon.ico"/>
        <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
        <script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>
        <!--  checkbox styling script -->
        <script src="js/jquery/ui.core.js" type="text/javascript"></script>
        <script src="js/jquery/ui.checkbox.js" type="text/javascript"></script>
        <script src="js/jquery/jquery.bind.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('input').checkBox();
                $('#toggle-all').click(function () {
                    $('#toggle-all').toggleClass('toggle-checked');
                    $('#mainform input[type=checkbox]').checkBox('toggle');
                    return false;
                });
            });
        </script>  


        <!--  styled select box script version 1 -->
        <script src="js/jquery/jquery.selectbox-0.5.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.styledselect').selectbox({inputClass: "selectbox_styled"});
            });
        </script>


        <![endif]>

        <!--  styled select box script version 2 --> 
        <script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.styledselect_form_1').selectbox({inputClass: "styledselect_form_1"});
                $('.styledselect_form_2').selectbox({inputClass: "styledselect_form_2"});
            });
        </script>

        <!--  styled select box script version 3 --> 
        <script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.styledselect_pages').selectbox({inputClass: "styledselect_pages"});
            });
        </script>

        <!--  styled file upload script --> 
        <script src="js/jquery/jquery.filestyle.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8">
            $(function () {
                $("input.file_1").filestyle({
                    image: "images/forms/choose-file.gif",
                    imageheight: 21,
                    imagewidth: 78,
                    width: 310
                });
            });
        </script>

        <!-- Custom jquery scripts -->
        <script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

        <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
        <script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
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
                    <a href="logout" id="logout"><img src="images/shared/nav/nav_logout.gif" width="64" height="14" alt="" /></a>
                    <div class="clear">&nbsp;</div>
                </div>
                <div class="nav">
                    <div class="table">
                        <ul class="current">
                            <li><a href="#"><b>Flight Details</b></a>
                                <div class="select_sub show">
                                    <ul class="sub">
                                        <li  class="sub_show"><a href="#">View all flight</a></li>
                                        <li><a href="addflight.jsp">Add flight</a></li>
                                        <li><a href="cancelflight.jsp">Cancel flight</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        <div id="content-outer">
            <div id="content">
                <div id="page-heading">
                    <h2>View All Flight Details</h2>
                </div>
                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                    <tr>
                        <th class="table-header-repeat line-left minwidth-1"><a href="">Flight No.</a>	</th>
                        <th class="table-header-repeat line-left "><a href="">Flight Name</a></th>
                        <th class="table-header-repeat line-left"><a href="">Company Name</a></th>
                        <th class="table-header-repeat line-left"><a href="">Source Name</a></th>
                        <th class="table-header-repeat line-left"><a href="">Destination Name</a></th>
                        <th class="table-header-repeat line-left"><a href="">Departure Time</a></th>
                        <th class="table-header-repeat line-left"><a href="">Arrival Time</a></th>
                    </tr>
                    <c:forEach var="flight" items="${listOfFlights}" varStatus="i">
                        <c:if test="${(i.index mod 2) == 0}">
                            <tr class="alternate-row">
                            </c:if>
                            <c:if test="${(i.index mod 2) != 0}">
                                <tr>
                                </c:if>
                                <td>${flight.getFlightNumber()}</td>
                                <td>${flight.getFlightName()}</td>
                                <td>${flight.getCompanyId().getCompanyName()}</td>
                                <td>${flight.getSourceId().getAerodrumName()}</td>
                                <td>${flight.getDestinationId().getAerodrumName()}</td>
                                <td>${flight.getDepartureTime().toString()}</td>
                                <td>${flight.getArrivalTime().toString()}</td>
                            </tr>
                        </c:forEach>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" id="paging-table">
                    <tr>
                        <td>
                            <c:if test="${pageNumber > 1}">
                                <a href="index.jsp?pageNumber=${pageNumber-1}" class="page-left"></a>
                            </c:if>
                            <div id="page-info">Page <strong>${pageNumber}</strong> / ${numberOfPages}</div>
                            <c:if test="${pageNumber < numberOfPages}">
                            <a href="index.jsp?pageNumber=${pageNumber+1}" class="page-right"></a>
                            </c:if>
                        </td>
                    </tr>
                </table>
                <div class="clear">&nbsp;</div>
            </div>
            <div class="clear">&nbsp;</div>
        </div>
        <div class="clear">&nbsp;</div>      
        <div id="footer">
            <div style="float:left; padding-left:20px;">Copyright &copy; 2015 - All Rights Reserved. </div>
            <div style="float:right; padding-right: 20px;">Designed and Developed by <a href="http://www.facebook.com/sakshimaskara07">Sakshi Maskara</a> & <a href="http://www.facebook.com/skyrohithigh">Rohit Sharma</a></div>
        </div>	 
    </body>
</html>