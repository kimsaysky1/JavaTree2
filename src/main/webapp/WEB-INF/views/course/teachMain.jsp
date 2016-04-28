<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>teachMain</title>

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
        
         <!-- CONTEN BAR -->
    <section class="content-bar">
        <div class="container">
            <ul>
                <li>
                    <a href="/javatree/course/selectAllCourseListForStudy.action">
                        <i class="icon md-book-1"></i>
                        Learning
                    </a>
                </li>
                <li class="current">
                    <a href="/javatree/course/selectAllCourseListForTeach.action">
                        <i class="icon md-people"></i>
                        Teaching
                    </a>
                </li>
            </ul>
        </div>
    </section>
   <!-- END / CONTENT BAR -->
   
   
      <!-- 가운데 영역 -->
		<section class="blog">
			<div id="mid-course" class="mid-course">
				<div class="container">				
				 <h2>MY COURSE - teach </h2>
				<br>
				<div class = "form-study">
				
<!-- 				<div class = "form-study-course">
				         <div class="study-course-bg mc-item3">
		         
                        <div class="meta-categories"><a href="#">Field</a></div>
                        <div class="content-item">
                            <h3><a href="course-intro.html">CourseTitle</a></h3>
                        </div>
                            <div class="edit-view">
	                            <a href="#" class="edit">Edit</a>
	                            <a href="/javatree/course/insertLectureView.action" class="view">ADD LECTURE</a>
                        	</div>
                    </div>
                </div> -->
<s:iterator value="courseList" status="st"> 
<!-- <input type="hidden" name="courseno" value="courseList.courseno">  -->
                <div class = "form-study-course">
				         <div class="study-course-bg mc-item3">

                        <div class="meta-categories"><a href="#">Field</a></div> <!-- edit -->
                        <div class="content-item">
                            <h3><a href="/javatree/course/CourseDetailForTeachForm.action?courseno=<s:property value="courseno"/>"><s:property value="coursename" /><!-- CourseTitle --></a></h3>

                        </div>
                              <div class="edit-view">
	                            <a href="#" class="edit">Edit</a>
	                            <a href="/javatree/course/insertLectureForm.action?courseno=<s:property value="courseno"/>" class="view">ADD LECTURE</a> <!-- 여기서 courseno를 가지고들어옴 -->
                        	
                        	</div>
                    </div>
                </div>
</s:iterator>              
 			<div class = "paging" align="center">
                		<a href="javascript:search(${pagenavi.currentPage-1});">&lt;</a>
<s:iterator begin="pagenavi.startPageGroup" end="pagenavi.endPageGroup" var="total">
                       
	
				<s:if test="pagenavi.currentPage == #total">
					<a href="javascript:search('<s:property value="#total"/>');"><s:property value="#total"/></a>
				</s:if>
				<s:else>
					<a href="javascript:search('<s:property value="#total"/>');"><s:property value="#total"/></a>
				</s:else>
</s:iterator>
			<a href="javascript:search(${pagenavi.currentPage+1});">&gt;</a>
                
                
                
                
               		<!--    <ul class="pager">
                            <li class="pager-current">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">next ›</a></li>
                            <li><a href="#">last »</a></li>
                        </ul> -->


         
                 </div>       
                </div>
                  
				
				
				<!-- SIDEBAR -->
                <div class = "course-side">
                    <aside class="blog-sidebar">
                    
                    <!-- 강좌 등록하기 -->
                    	
                    	<div class="form-submit-1">
							<a href="/javatree/course/insertCourseView.action"><input type="button" value="ADD COURSE" class="mc-btn btn-style-1" ></a> 
						</div>
                    	
                   <!-- 강좌 등록 끝-->
                        <br>
                  <!-- 질문 보관함 -->
                    	
                    	<div class="form-submit-1">
                    	<input type="hidden" id = "courseno" value = "<s:property value="courseno"/>">
							<a href="javascript:popup();"><input type="button" value="QUESTION BOX" class="mc-btn btn-style-1" ></a>
						</div>
                    	
                   <!-- 보관함 끝-->
  
                    </aside>    
				</div>
				  <!-- END / SIDEBAR -->
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
						<i class="fa fa-map-marker"></i> <span>Maecenas sodales,nisl eget</span>
					</div>
				</div>
				<p class="copyright">Copyright © 2014 Megadrupal. All rights reserved.</p>
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

<script type="text/javascript">
	
function popup(){
	
	
	window.open('codingFormfromMain.action','pop','resizable=no scrollbars=yes top=50 left=200 width=1200 height=870'); 
	
}
</script>
</body>
</html>