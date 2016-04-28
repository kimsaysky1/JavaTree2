<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <!-- Google font -->
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- Css -->
    <link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/md-font.css">
    <link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/style.css">
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
    <title>로그인</title>
    
<script type="text/javascript">

function loginForm(){
	var form = document.getElementById("loginForm");
	var id= document.getElementById("id");
	var password= document.getElementById("password");
	form.submit();
}

function joinForm() {
	location.href = "joinForm.action";
}
</script>
    
    
</head>
<body>
<%@include file="/resources/header.jsp" %>
		
		<section id="login-content" class="login-content">
        <div class="awe-parallax bg-login-content"></div>
        <div class="awe-overlay"></div>
        <div class="container">
        
        <div id="mid-login" class="mid-login">
        <div class="form-login">
                        <form action="login.action" theme="simple" method="post" id="loginForm">
                            <h2 class="text-uppercase">LOG IN</h2>
                            <div class="form-email">
                                <input type="text" placeholder="Id" name="id" id="id">
                            </div>
                            <div class="form-password">
                                <input type="password" placeholder="Password" name="password" id="password">
                            </div>
                            <div></div>
                            <div class="form-check">
                                <a href="#">Forget ID / PASSWORD?</a>
                            </div>
                            <div class="form-submit-1">
                                <input type="submit" value="Log In" class="mc-btn btn-style-1">
                            </div>
                            <div class="link">
                                <!-- <a href="/javatree/joinFrom.action"> -->
                                 <a href="joinForm.action">
                                    <i class="icon md-arrow-right"></i>JOIN US
                                </a>
                            </div>
                        </form>
        </div>
        </div>
        </div>
        </section>
		
		 <!-- FOOTER -->
    <footer id="footer" class="footer">    

        <div class="second-footer">
            <div class="container">
                <div class="contact">
                    <div class="email">
                        <i class="icon md-email"></i>
                        <a href="#">course@megadrupal.com</a>
                    </div>
                    <div class="phone">
                        <i class="fa fa-mobile"></i>
                        <span>+84 989 999 888</span>
                    </div>
                    <div class="address">
                        <i class="fa fa-map-marker"></i>
                        <span>Maecenas sodales, nisl eget</span>
                    </div>
                </div>
                <p class="copyright">Copyright © 2014 Megadrupal. All rights reserved.</p>
            </div>
        </div>
    </footer>
    <!-- END / FOOTER -->
    
	<!-- Load jQuery -->
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/scripts.js"></script>

</body>
</html>