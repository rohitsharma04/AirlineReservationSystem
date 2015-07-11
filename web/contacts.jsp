<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Contacts</title>
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
    <body id="page5"
          <c:if test="${param.email != null}"> onload="swal({
            title: 'Thank You ${param.name} Your Message Has Been Received',
            text: 'We\'ll Contact You Soon',
            type: 'success'
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
                                    <li><a href="#"><img src="images/img2.gif" alt=""></a></li>
                                    <li class="bg_none"><a href="#"><img src="images/img3.gif" alt=""></a></li>
                                </ul>
                            </nav>
                            <nav>
                                <ul id="menu">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li ><a href="bookings.jsp">Bookings</a></li>
                                    <li><a href="checkstatus.jsp">Check status</a></li>
                                    <li ><a href="getfare.jsp">Get fare</a></li>
                                    <li id="menu_active"><a href="contacts.jsp">contacts</a></li>
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
                <article class="col1">
                    <div class="pad_1">
                        <h2>Contact Us</h2>
                        <span class="cols"> Country:<br>
                            City: <br>
                            Name:<br>
                            Telephone:<br>
                            Email: </span> India<br>
                        Kolkata<br>
                        Sakshi Maskara<br>
                        +91 9163310919<br>
                        <a href="#">sakshimaskara@gmail.com</a>
                        <br><br>
                        <span class="cols"> Country:<br>
                            City<br>
                            Name:<br>
                            Telephone:<br>
                            Email: </span> India<br>
                        Kolkata<br>
                        Rohit Sharma<br>
                        +91 8282813192<br>
                        <a href="#">skyhighrohit@gmail.com</a>
                    </div>
                </article>
                <article class="col2 pad_left1">
                    <h2>Contact Form</h2>
                    <form id="ContactForm" action="#">
                        <div>
                            <div class="wrapper">
                                <div class="bg">
                                    <input type="text" name="name" class="input" pattern="[A-Za-z\s]+" required oninvalid="setCustomValidity('Please Enter Your Name')" oninput="setCustomValidity('')"/>
                                </div>
                                Your Name:<br />
                            </div>
                            <div class="wrapper">
                                <div class="bg">
                                    <input type="email" name="email" class="input" required oninvalid="setCustomValidity('Please Enter Your Email')" oninput="setCustomValidity('')"/>
                                </div>
                                Your E-mail:<br />
                            </div>
                            <div class="wrapper">
                                <div class="bg">
                                    <textarea name="textarea" message="message" cols="1" rows="1" required oninvalid="setCustomValidity('Please Enter Your Message')" oninput="setCustomValidity('')"></textarea>
                                </div>
                                Your Message:<br />
                            </div>
                            <input type="submit" class="button2"/> <input type="reset" class="button2"/>
                        </div>
                    </form>
                </article>
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