<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900'
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
<title>DetailCourse-study</title>
</head>
<body>
<%@include file="/resources/header2.jsp" %>

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
	<section class="blog2">

		<div class="mid-detail-course">
			<div class="container">
			 <h3>About Course</h3>
			<div class="coursedetail-bg">
				<div class="create-course-content2">

					<!-- PROMO VIDEO -->
					<div class="promo-video create-item">
						
							<div class="create-course-1">
								<h4>Title</h4>
							</div>
							<div class="create-course-4">
								<div class="form-item">
									<input type="text" placeholder="title" value="<s:property value="coursename" />">
								</div>
							</div>			
					</div>
					<!-- END / PROMO VIDEO -->
					
					

				</div>
				<br>
				<div class="create-course-content2">
				
							<!-- PROMO VIDEO -->
					<div class="promo-video create-item">
						
							<div class="create-course-1">
								<h4>Description</h4>
							</div>
							<div class="create-course-4">
								<div class="description-editor text-form-editor">
									<textarea placeholder="Discription"><s:property value="introdution" /></textarea>
								</div>							
								</div>
			
					</div>
					<!-- END / PROMO VIDEO -->
				
				</div>
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
							<s:iterator value="lectureList" status="counter">
							<tr>
								<td class="submissions"><s:property value="#counter.index + 1" />.&nbsp;&nbsp;&nbsp;<s:property value="lecturename" /></td>
								<td class="author"></td>
								<td class="score"></td>
					
					<s:url id ="download" action = "DownLoadFile">
						<s:param name ="uploadedfile">
							${uploadedfilename}
						</s:param>
						<s:param name = "lectureno">
							${lectureno}
						</s:param>
					</s:url>
								
					<td class="submit-date"></td>
								
					<td class="submit-date">
						<s:a href="%{download}" method="post">${uploadedfilename}</s:a>
					</td>
								
								<s:if test="studying != null">
									<td class="submit-date"><a href='../compiler/Compiler.action?lectureno=<s:property value="lectureno"/>'>Watch</a></td>
								</s:if>
								<s:else>
									<td class="submit-date"><a href='insertLectureForStudy.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno" />&coursename=<s:property value="coursename" />&teacherid=<s:property value="teacherid" />'>Apply</a></td>
								</s:else>
								
					
							</tr>
							</s:iterator>
							<!-- <tr>
								<td class="submissions"><a href="#">Title of Lecture</a></td>
								<td class="author"></td>
								<td class="score"></td>
								<td class="submit-date"></td>
								<td class="submit-date"><a href="">PlayView</a></td>
								<td class="submit-date"><a href="">Download SubNote</a></td>
							</tr> -->
							<s:if test="lectureList == null">
							<tr class="new">
								<td class="submissions"></td>
								<td class="author">&nbsp;&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;보&nbsp;&nbsp;없&nbsp;&nbsp;음</td>
								<td class="score"></td>
								<td class="submit-date"></td>
								<td class="submit-date"></td>
								<td class="submit-date"></td>
							</tr>
							</s:if>
						</tbody>
					</table>
				</div>

				<div class="paging" align="center">
					<ul class="pager">
					
			<s:if test="#session.currentPage == 1 & #session.endPageGroup == 1">
             <li> <a><s:property value="#session.currentPage"/></a> </li>
             </s:if>
            
            <s:elseif test="#session.currentPage == 1 & #session.endPageGroup != 1">
            <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/></a></li>
             <li><a href = 'plusCourseDetailForStudy.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>'>next &gt</a></li>
            </s:elseif>
			
			<s:elseif test='#session.currentPage == #session.endPageGroup & #session.endPageGroup != 1'>
             <li><a href = 'plusCourseDetailForStudy.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>'>&lt prev</a></li>
            <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/> </a> </li>
            </s:elseif>
            
			<s:elseif test="#session.currentPage == 0">
             <li><a> <s:property value="#session.currentPage"/> </a></li>
             </s:elseif>
             
			<s:else>
             <li><a href = 'plusCourseDetailForStudy.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>'>&lt prev</a></li>
             <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = 'plusCourseDetailForStudy.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>'>next &gt</a></li>
            </s:else>
					
						<!-- <li class="pager-current">1</li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">next ›</a></li>
						<li><a href="#">last »</a></li> -->
					</ul>
				</div>

			</div>
		</div>





	</section>




	<%@include file="/resources/footer.jsp" %>

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