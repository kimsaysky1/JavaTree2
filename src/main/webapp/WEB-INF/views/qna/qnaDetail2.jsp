<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<title>JavaTree Detail</title>
<script type="text/javascript" src="../resources/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../resources/jquery-ui.min.js"></script>
</head>
<body>
	<%@include file="/resources/header2.jsp"%>

	<!-- 중간 슬라이더 부분 -->
	<section class="sub-banner sub-banner-course">
		<div class="awe-static bg-sub-banner-course"></div>
		<div class="container">
			<div class="sub-banner-content">
				<h2 class="text-center">JAVATree</h2>
			</div>
		</div>
	</section>

	<!-- COURSE -->
	<section class="course-top">
		<div class="container">
			<div class="row">
				<div class="qna-detail">

					<div class="tab-pane fade in active" id="discussion">
						<h3 style="color: green;">About JAVATree</h3>
						<div class="form-discussion">
							<form></form>
						</div>

						<!-- PROFILE -->

						<section class="profile2">
							<div class="container">

								<h3 class="md black">Field</h3>
								<div>${typeName}</div>

								<h3 class="md black">Question-title</h3>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-acount2">
											<div class="info-acount">
												<p>${question.title}</p>
											</div>
										</div>
									</div>
								</div>

								<h3 class="md black">Question</h3>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-acount">
											<div class="info-acount">
												<p> ${question.content}</p>
												<div class="profile-email-address">
													<div class="profile-email">
														<h5>ID</h5>
														<p>${question.id}</p>
													</div>
													<div class="profile-address">
														<h5>DATE</h5>
														<p>${question.regdate}</p>
													</div>
													&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													<div class="profile-address">
														<h5>GUNGGUMDO</h5>
														<p id = "curious">${question.curious}</p>
													</div>
													&nbsp; &nbsp;

													<div class="profile-address">
														<input type="button" value="궁금해요" id="addCurious"
															class="mc-btn-8">
													</div>
													&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
													<div class="profile-address">
														<form action=""></form>
														<input type="button" value="답변달기" data-toggle="modal"
															data-target="#insertReply" class="mc-btn-8">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- END / PROFILE -->
</body>
</html>