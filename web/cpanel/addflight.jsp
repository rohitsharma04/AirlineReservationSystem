<%-- Getting data from the Database to show Companies, Aerodrums(source and destinations) --%>
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

    //Getting Companies from Company Master
    Criteria c1 = s.createCriteria(CompanyMaster.class);
    List<CompanyMaster> listOfCompanies = c1.list();
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>ADMIN PANEL | Add Flight</title>
        <link rel="shortcut icon" href="../favicon.ico"/>
        <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
        <script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script> 
        <script src="js/jquery/custom_jquery.js" type="text/javascript"></script>
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
            <form method="post" action="addflighthandler">
                <table>
                    <%-- Printing Message from the addflighthandler --%>
                    <%
                        String message = (String) request.getAttribute("message");
                        if (message != null) {
                    %>
                    <tr>
                        <td colspan="2">
                            <h3 style="color: red;"><%=message%></h3>
                        </td>
                    </tr>
                    <%
                        }
                    %>


                    <tr>
                        <td colspan="2">
                            <h3> Flight Details </h3>
                        </td>
                    </tr>
                    <tr>
                        <td>Company Name:</td>
                        <td>
                            <select class="border" name="companyId" required oninvalid="setCustomValidity('Please Select a Company')" oninput="setCustomValidity('')">
                                <option selected value="">SELECT COMPANY</option>
                                <%                                    for (CompanyMaster company : listOfCompanies) {
                                %>
                                <option value="<%=company.getCompanyId()%>"><%=company.getCompanyName()%></option>
                                <% }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Flight Name:</td>
                        <td><input type="text" class="border" name="flightName" placeholder="Name of the Flight" pattern="[A-Za-z0-9]+" required oninvalid="setCustomValidity('Please Enter the name of the Flight')" oninput="setCustomValidity('')"/></td>
                    </tr>
                    <tr>
                        <td>Departure Airport:</td>
                        <td>
                            <select class="border" name="sourceId" required oninvalid="setCustomValidity('Please Choose Source City')" oninput="setCustomValidity('')">
                                <option value="" selected>SELECT CITY</option>
                                <%
                                    for (AerodrumMaster aerodrum : listOfAerodrums) {
                                %>
                                <option value="<%=aerodrum.getAerodrumId()%>"><%=aerodrum.getAerodrumName()%></option>
                                <% }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Destination Airport:</td>
                        <td>
                            <select class="border" name="destinationId" required oninvalid="setCustomValidity('Please Choose Destination City')" oninput="setCustomValidity('')">
                                <option value="" selected>SELECT CITY</option>
                                <%
                                    for (AerodrumMaster aerodrum : listOfAerodrums) {
                                %>
                                <option value="<%=aerodrum.getAerodrumId()%>"><%=aerodrum.getAerodrumName()%></option>
                                <% }
                                %>                            
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Day(Multiple):</td>
                        <td>
                            <select class="border" name="dayId" multiple required oninvalid="setCustomValidity('Please Choose Days Flight will fly')" oninput="setCustomValidity('')">
                                <option selected value="">SELECT DAY</option>
                                <%
                                    for (DayMaster day : listOfDays) {
                                %>
                                <option value="<%=day.getDayId()%>"><%=day.getDayName()%></option>
                                <% }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Departure Time:</td>
                        <td><input type="time" name="departureTime" class="border" required oninvalid="setCustomValidity('Please Enter Departure Time')" oninput="setCustomValidity('')"/></td>
                    </tr>
                    <tr>
                        <td>Arrival Time:</td>
                        <td><input type="time" name="arrivalTime" class="border" required oninvalid="setCustomValidity('Please Choose Arrival Time')" oninput="setCustomValidity('')" /></td>
                    </tr>

                    <!-- Adding Input Boxes for Flight Fares -->
                    <tr>
                        <td colspan="2">
                            <h3> Flight Fares Details </h3>
                        </td>
                    </tr>
                    <% for (ClassMaster c : listOfClasses) {
                    %>
                    <tr>
                        <td><%=c.getClassName()%> Class</td>
                        <td><input type="text" name="fare<%=c.getClassId()%>" class="border" placeholder="Fare Amount" required oninvalid="setCustomValidity('Please Enter Fare Price')" oninput="setCustomValidity('')"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="seats<%=c.getClassId()%>" class="border" placeholder="number of seats" required oninvalid="setCustomValidity('Please Enter Number of Seats')" oninput="setCustomValidity('')"/></td>
                    </tr>
                    <% }%>


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