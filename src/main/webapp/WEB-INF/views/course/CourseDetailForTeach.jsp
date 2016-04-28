<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='/http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css'>
<link
	href='/http://fonts.googleapis.com/css?family=Raleway:300,400,700,900'
	rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>DetailCourse-teach</title>
<script type="text/javascript">
/* function deleteLecture(){
	alert("정말 삭제하시겠습니까?");
	var lectureno = document.getElementById("deletelecture1"); 
	alert(lectureno);
	location.href="/javatree/course/deleteLecture.action?lectureno="+lectureno;
}
 */
 
 
 function updateLecture(){
	var lectureno=$('#lectureno').val();
	window.open('/javatree/course/updateLectureForm.action?lectureno='+lectureno,'pop','resizable=no scrollbars=yes top=300 left=500 width=600 height=500'); 
	/*  window.open('updateLecture.action?custid='+custid.value,'pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180'); */
	 /* locatrion.href="/javatree/course/updateLecture.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno"/>"; */
 }
 
 function  updateSubnote(){
		var lectureno=$('#lectureno').val();
		window.open('/javatree/course/updateSubnoteForm.action?lectureno='+lectureno,'pop','resizable=no scrollbars=yes top=300 left=500 width=600 height=500'); 
	 }

</script>



</head>
<body>
<%@include file="/resources/header.jsp" %>
	

	<!-- PROFILE FEATURE 프로필!!!!-->
	<section class="profile-feature">
		<div class="awe-parallax bg-profile-feature"></div>
		<div class="awe-overlay overlay-color-3"></div>
		<div class="container">
			<div class="info-author">
				<div class="name-author">
					<h2 class="big">USER NAME</h2>
				</div>
			</div>
			<div class="info-follow">
				<div class="trophies">
					<span>JAVA KONG</span>
					<p>5000P</p>
				</div>
			</div>
		</div>
	</section>
	<!-- END / PROFILE FEATURE -->

	<!-- 가운데 영역 -->
 	
	
	<section class="blog">

		<div class="mid-detail-course">
			<div class="container">
				<div class="create-course-content2">

					<!-- PROMO VIDEO -->
					<div class="promo-video create-item">
						
							<div class="create-course-1">
								<h4>Title</h4>
							</div>
<!-- <form action="updateCourseName" method="post" id="updateCourseName"> 	 -->						
<s:iterator value="course" status="st">							
							<div class="create-course-3">
								<div class="form-item">
									<input type="text" placeholder="title" value='<s:property value="coursename"/>' name="coursename">
								</div>
							</div>
</s:iterator>							

							<div class="form-action2">
								<input type="submit" value="Edit" class="submit mc-btn-3 btn-style-1" />
							</div>
<!-- </form>		 -->				
					</div>
					<!-- END / PROMO VIDEO -->

					<!-- DESCRIPTION -->
					<div class="description create-item">
						<div class="row">
							<div class="create-course-1">
								<h4>Description</h4>
							</div>
<!-- <form action="updateCourseIntrodution" method="post" id="updateCourseIntrodution"> --> 							
<s:iterator value="course" status="st">								
							<div class="create-course-2">
								<div class="description-editor text-form-editor">
									<textarea name="introdution" placeholder="Discription"><s:property value="introdution" /></textarea>
								</div>
							</div>
</s:iterator>	
					
							<div class="form-action">
								<input type="submit" value="Edit" class="submit mc-btn-3 btn-style-1" />
							</div>
<!-- </form>	 -->							

						</div>
					</div>
					<!-- END / DESCRIPTION -->

				</div>
			</div>
		</div>
		<div id="courseDetail" class="courseDetail learn-section">
			<div class="container">

				<div class="table-student-submission">
					<table class="mc-table">
						<thead>
							<tr>
								<th class="submissions2">Lecture List</th>
								<th class="author"></th>
								<th class="score"></th>
								<th class="submit-date"></th>
								<th class=""></th>
							</tr>
						</thead>


						<tbody>
<s:iterator value="lectureList" status="st">	
					
							<tr class="new">
								<td class="submissions"><a href="#"><s:property value="lecturename"/></a></td>
								<input type="hidden" id="lectureno" value='<s:property value="lectureno"/>' >
								<td class="author"><a href="javascript:updateLecture()">Edit<%-- <s:property value="lectureno"/> --%></a></td>
								<td class="score"><a href="/javatree/course/deleteLecture.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno"/>">Delete</a></td><!-- javascript:deleteLecture(); -->
								<td class="submit-date"><a href="javascript:updateSubnote()">Paper</a></td>
								<td class="submit-date"><a href="">Question</a></td>
								<td class="submit-date"><a href="/javatree/course/mediaPlayerForm.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno"/>">PlayView</a></td>
							</tr>


</s:iterator>
						</tbody>
					</table>
				</div>

				<div class="paging" align="center">
					<ul class="pager">
						<li class="pager-current">1</li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">next ›</a></li>
						<li><a href="#">last »</a></li>
					</ul>
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
						<i class="icon md-email"></i> <a href="#">course@megadrupal.com</a>
					</div>
					<div class="phone">
						<i class="fa fa-mobile"></i> <span>+84 989 999 888</span>
					</div>
					<div class="address">
						<i class="fa fa-map-marker"></i> <span>Maecenas
							sodales,nisl eget</span>
					</div>
				</div>
				<p class="copyright">Copyright © 2014 Megadrupal. All rights
					reserved.</p>
			</div>
		</div>
	</footer>
	<!-- END / FOOTER -->

	<!-- Load jQuery -->
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/scripts.js"></script>

</body>
</html>