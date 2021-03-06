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
    
<style type="text/css">
	.noneList{
		background: white;
	}
</style>
<title>DetailCourse-teach</title>
<script type="text/javascript">
/* function deleteLecture(){
	alert("정말 삭제하시겠습니까?");
	var lectureno = document.getElementById("deletelecture1"); 
	alert(lectureno);
	location.href="/javatree/course/deleteLecture.action?lectureno="+lectureno;
}
 */
 
 function updateLecture(lectureno, courseno){
		
		window.open('/javatree/course/updateLectureForm.action?lectureno='+lectureno+'&courseno='+courseno,'pop','resizable=no scrollbars=no top=300 left=500 width=500 height=400'); 
		/*  window.open('updateLecture.action?custid='+custid.value,'pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180'); */
		 /* locatrion.href="/javatree/course/updateLecture.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno"/>"; */
	 }
	 
	 function  updateSubnote(lectureno, courseno){
			/* var lectureno=$('#lectureno').val(); */
			window.open('/javatree/course/updateSubnoteForm.action?lectureno='+lectureno+'&courseno='+courseno,'pop','resizable=no scrollbars=no top=300 left=500 width=500 height=400'); 
		 }
	 
	 function updateCoding(lectureno,courseno,from){
		    window.open('/javatree/course/codingMainInsertLectureView.action?lectureno='+lectureno+'&courseno='+courseno+'&from='+from,'pop','resizable=no scrollbars=yes top=50 left=200 width=1200 height=870');
		 }
		 
	function checkVideo(lectureno){
		      window.open('/javatree/course/mediaPlayerForm.action?lectureno='+lectureno,'pop','resizable=no scrollbars=yes top=300 left=500 width=1000 height=800'); 
		 }

 
</script>



</head>
<body>
<%@include file="/resources/header2.jsp" %>

	<!-- PROFILE FEATURE 프로필!!!!-->
	<section class="profile-feature">
			<div class="awe-parallax bg-profile-feature"></div> <!-- 좀 늘리기 -->
			<!-- <div class="awe-overlay overlay-color-3"></div> -->
			<div class="container">
					<div class="sub-banner-content">
						<h4 class="md" style="color: #E3E3E3; text-align: center;">
							<s:if test="%{#session.loginId != null}">
								${session.loginId} &nbsp; , Welcome to the JavaTree!
							</s:if>
						</h4>
					</div>	
			</div>
		</section>
	
	
	
	
	
	
	
	<%-- <section class="profile-feature">
		<div class="awe-parallax bg-profile-feature"></div> <!-- 좀 늘리기 -->
		<div class="awe-overlay overlay-color-3"></div>
		<div class="container">
			<!-- <div class="info-author">
				<div class="name-author"> -->
				<div class="sub-banner-content">
					<h4 class="md" style="color: #E3E3E3;">
						<s:if test="%{#session.loginId != null}">
							${session.loginId} &nbsp; , Welcome to the JavaTree!
						</s:if>
					</h4>
				</div>	
				<!-- </div>
			</div> -->
			<div class="info-follow">
				<div class="trophies">
					<span>JAVA KONG</span>
					<p>5000P</p>
				</div>
			</div>
		</div>
	</section> --%>
	<!-- END / PROFILE FEATURE -->

	<!-- 가운데 영역 -->
 	
	
	<section class="blog">

		<div class="mid-detail-course">
			<div class="container">
				<div class="create-course-content2"> <!-- zz -->

<table dir="ltr" style="width: 100%">
	<tr >
		<td style="width: 20%">
			<div class="create-course-1">
				<h4>Title</h4>
			</div>
		</td>
		<td style="width: 60%">
			<s:iterator value="course" status="st">							
				<div class="create-course-5"><!-- <div class="create-course-2"> --><!-- <div class="create-course-3"> --><!-- 잘보기 -->
					<div class="form-item" style="border: 1px solid #E3E3E3; ">
						<input type="text" placeholder="title" value='<s:property value="coursename"/>' name="coursename">
					</div>
				</div>
			</s:iterator>	
		
		</td>
		<td style="width: 20%">
			<div class="form-action"><!-- <div class="form-action2"> -->
					<input type="submit" value="Edit" class="submit mc-btn-3 btn-style-1" />
			</div>
		</td>
	</tr>
	<tr>
		<td style="width: 20%">
			<div class="create-course-1">
				<h4>Description</h4>
			</div>				
		</td>
	
		<td style="width: 60%">
			<s:iterator value="course" status="st">								
				<div class="create-course-5"><!-- <div class="create-course-2"> -->
					<div class="description-editor text-form-editor">
						<textarea name="introdution" placeholder="Discription"><s:property value="introdution" /></textarea>
					</div>
				</div>
			</s:iterator>	
		</td>
		<td style="width: 20%">
			<div class="form-action">
				<input type="submit" value="Edit" class="submit mc-btn-3 btn-style-1" />
			</div>
		</td>
	</tr>
</table>




<%-- 
					<!-- PROMO VIDEO -->
					<div class="promo-video create-item">
						
							<div class="create-course-1">
								<h4>Title</h4>
							</div>
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
					</div>
					<!-- END / PROMO VIDEO -->

					<!-- DESCRIPTION -->
					<div class="description create-item">
						<div class="row">
							<div class="create-course-1">
								<h4>Description</h4>
							</div>
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

						</div>
					</div>
					<!-- END / DESCRIPTION -->

				</div> <!-- 처리 -->
				
				
				
				 --%>
				
				
				
				
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
								<td class="author"><a href="javascript:updateLecture(<s:property value="lectureno"/>, <s:property value="courseno"/>)">Edit<%-- <s:property value="lectureno"/> --%></a></td>
								<td class="score"><a href="/javatree/course/deleteLecture.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno"/>">Delete</a></td><!-- javascript:deleteLecture(); -->
								<td class="submit-date"><a href="javascript:updateSubnote(<s:property value="lectureno"/>, <s:property value="courseno"/>)">Paper</a></td>
								<td class="submit-date"><a href="javascript:updateCoding(<s:property value="lectureno"/>, <s:property value="courseno"/>,'courseDetail')">Question</a></td>
								<td class="submit-date"><a href="javascript:checkVideo(<s:property value="lectureno"/>, <s:property value="courseno"/>)">PlayView</a></td>
							</tr>

</s:iterator>

						</tbody>
	
		
					</table>
				
	
		<s:if test="lectureList.size == 0">
			
		<div class="noneList">
			<div class="container">
				<h5 class="sm" style="text-align: center;">Lecture Does not exist</h5>
			</div>
		</div>
	</s:if>
					

				
	</div>
<div class="paging" align="center">
					<ul class="pager">
						
						<s:if test="#session.currentPage == 1 & #session.endPageGroup == 1">
             <li> <a><s:property value="#session.currentPage"/></a> </li>
             </s:if>
            
            <s:elseif test="#session.currentPage == 1 & #session.endPageGroup != 1">
            <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/></a></li>
             <li><a href = 'plusCourseDetailForTeach.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>'>next &gt</a></li>
            </s:elseif>
			
			<s:elseif test='#session.currentPage == #session.endPageGroup & #session.endPageGroup != 1'>
             <li><a href = 'plusCourseDetailForTeach.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>'>&lt prev</a></li>
            <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/> </a> </li>
            </s:elseif>
            
			<s:elseif test="#session.currentPage == 0">
             <li></li>
             </s:elseif>
             
			<s:else>
             <li><a href = 'plusCourseDetailForTeach.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>'>&lt prev</a></li>
             <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = 'plusCourseDetailTeach.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>'>next &gt</a></li>
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
	<script src="../resources/checkMessage.js"></script>
</body>
</html>