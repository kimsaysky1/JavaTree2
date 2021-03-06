<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>Java Tree Main</title>
</head>
<body>

<%@include file="/resources/header.jsp" %>

		<!-- HOME SLIDER -->

		<section class="slide" style="background-image: url(resources/javatree_view/html/images/homeslider/mainimg_3.jpg)">
		<div class="awe-overlay overlay-color-3"></div>
			<div class="container">
				<div class="slide-cn" id="slide-home">
					<!-- SLIDE ITEM -->
					<div class="slide-item">
						<div class="item-inner">
							<div class="text">
							<%-- <s:if test="%{#session.loginId != null}">
								<p class="indexh1">${session.loginId} &nbsp; 님 환영합니다.</p>
							</s:if> --%>
								<h2>WELCOME TO JAVATREE</h2>
								<p>
									JAVATree will help your Study!<br> Join us PlZ!<br>
									press Join button
								</p>
								<div class="group">
									<a href="/javatree/course/selectAllCourseList.action" class="mc-btn53 btn-style-1">Course</a> &nbsp; &nbsp;
									<a href="/javatree/qna/qnaDefaultMain.action" class="mc-btn53 btn-style-1">JAVATree</a>
								</div>
							</div>

							<div class="img">
								<img src="resources/javatree_view/html/images/homeslider/mainimg_1.jpg" alt="">
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
		<!-- 가운데 영역 끝 -->
		
<%@include file="/resources/footer.jsp" %>
		
	<!-- Load jQuery -->
	<script type="text/javascript" src="resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript" src="resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript" src="resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript" src="resources/javatree_view/html/js/scripts.js"></script>
	<script type="text/javascript" src="resources/jquery-ui.min.js"></script>
	<script src="resources/checkMessage.js"></script>
		
</body>
</html>
