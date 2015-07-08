<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin Login</title>
        <link rel="stylesheet" href="admin/css/screen.css" type="text/css" media="screen" title="default" />
        <!--  jquery core -->
        <script src="admin/js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

        <!-- Custom jquery scripts -->
        <script src="admin/js/jquery/custom_jquery.js" type="text/javascript"></script>

        <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
        <script src="admin/js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
        <script type="admin/text/javascript">
            $(document).ready(function () {
            $(document).pngFix( );
            });
        </script>
    </head>
    <body id="login-bg"> 

        <!-- Start: login-holder -->
        <div id="login-holder">


            <!--  start loginbox ................................................................................. -->
            <div id="loginbox">

                <!--  start login-inner -->
                <div id="login-inner">
                    <form method="POST" action="login">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <th>Username</th>
                                <td><input type="text"  class="login-inp" name="username" required oninvalid="setCustomValidity('Please Enter Your Username')" oninput="setCustomValidity('')"/></td>
                            </tr>
                            <tr>
                                <th>Password</th>
                                <td>
                                    <input type="password" onfocus="this.value = ''" class="login-inp" name="password" required oninvalid="setCustomValidity('Please Enter Your Password')" oninput="setCustomValidity('')" />
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td valign="top"><input type="checkbox" class="checkbox-size" id="login-check" name="rememberme"/>
                                    <label for="login-check">Remember me</label>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><input type="submit" class="submit-login"  /></td>
                            </tr>
                        </table>
                    </form>

                    <%-- Adding Error message or logout message --%>
                    <%
                        String message = (String) request.getAttribute("message");
                        if (message != null) {
                    %>
                    <h2 style="color: red;" align="center"><%=message%></h2>
                    <%
                        }
                    %>

                </div>
                <!--  end login-inner -->
                <div class="clear"></div>
                <a href="" class="forgot-pwd">Forgot Password?</a>
            </div>
            <!--  end loginbox -->

            <!--  start forgotbox ................................................................................... -->
            <div id="forgotbox">
                <div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
                <!--  start forgot-inner -->
                <div id="forgot-inner">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <th>Email address:</th>
                            <td><input type="text" value=""   class="login-inp" /></td>
                        </tr>
                        <tr>
                            <th> </th>
                            <td><input type="button" class="submit-login"  /></td>
                        </tr>
                    </table>
                </div>
                <!--  end forgot-inner -->
                <div class="clear"></div>
                <a href="" class="back-login">Back to login</a>
            </div>
            <!--  end forgotbox -->

        </div>
        <!-- End: login-holder -->
    </body>
</html>