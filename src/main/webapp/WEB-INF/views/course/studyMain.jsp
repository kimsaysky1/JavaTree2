<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>studyMain</title>
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
		                    <p>POINT</p>
		                </div>
		            </div>
		        </div>
		    </section>
        <!-- END / PROFILE FEATURE -->
        
        <!-- CONTEN BAR -->
    <section class="content-bar">
        <div class="container">
            <ul>
                <li class="current">
                    <a href="account-learning.html">
                        <i class="icon md-book-1"></i>
                        Learning
                    </a>
                </li>
                <li>
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
				 <h2>MY COURSE</h2>
				<br>
				<div class = "form-study">

		<s:iterator value="courseList" status="incr">		
				<div class = "form-study-course" id ="<s:property value="%{#incr.index+1}"/>">
				    <div class="study-course-bg mc-item3">
                        
                        <div class="meta-categories"><s:iterator value="courseTypeList" ><s:property/>&nbsp;&nbsp;&nbsp;&nbsp;</s:iterator>
                        </div>
                        
                        <div class="content-item">
                            <h3><a href="selectCourseDetailForStudy.action?courseno=<s:property value="courseno" />"><s:property value="coursename" /></a></h3>
                            <div class="name-author">
                                By &nbsp;<s:property value="teacherid" />
                            </div>
                        </div>
                    </div>
                </div>
               </s:iterator>
               
               <s:if test="courseList == null">
               		<div class = "form-study-course" >
				    <div class="study-course-bg mc-item3">
                        
                        <div class="meta-categories">
                        	
                        </div>
                        
                        <div class="content-item">
                            <h3>- 정보 없음 -</h3>
                            <div class="name-author">
                            </div>
                        </div>
                    </div>
                </div> 
               </s:if>
  
                <div class = "paging" align="center">
               		   <ul class="pager">
               		   
			<s:if test="#session.currentPage == 1 & #session.endPageGroup == 1">
             <li><a> <s:property value="#session.currentPage"/> </a></li>
             </s:if>
            
            <s:elseif test="#session.currentPage == 1 & #session.endPageGroup != 1">
             <li><a> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = "plusStudyMain.action?currentPage=<s:property value="#session.currentPage + 1"/>">next &gt</a></li>
            </s:elseif>
			
			<s:elseif test="#session.currentPage == #session.endPageGroup & #session.endPageGroup != 1">
             <li><a href = "plusStudyMain.action?currentPage=<s:property value="#session.currentPage - 1"/>">&lt prev</a></li>
            <li><a> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/></a></li>
            </s:elseif>
			
			<s:elseif test="#session.currentPage == 0">
             <li><a> <s:property value="#session.currentPage"/> </a></li>
             </s:elseif>
			
			<s:else>
             <li><a href = "plusStudyMain.action?currentPage=<s:property value="#session.currentPage - 1"/>">&lt prev</a></li>
             <li><a href = "#"> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = "plusStudyMain.action?currentPage=<s:property value="#session.currentPage + 1"/>">next &gt</a></li>
            </s:else>
				
                        </ul>
                 </div>       
                
             </div>         
				
				<!-- SIDEBAR -->
                <div class = "course-side">
                    <aside class="blog-sidebar">
                    
                    <!-- 질문 보관함 -->
                    	
                    	<div class="form-submit-1">
							<input type="button" value="QUESTION BOX" class="mc-btn btn-style-1">
						</div>
                    	
                        <!-- 보관함 끝-->
                        <br><br>
                        <!-- 베스트 랭킹 탭 1 -->
						
						<h4 class="sm">COURSE INFO</h4>
						<!-- 탭ㅂㅂㅂㅂㅂ -->
						<div class="tab-content">
                            <ul class="design-course-tabs" role="tablist">
                            <li>
                                <a href="#design-question" role="tab" data-toggle="tab">Recently Completed</a>
                            </li>
                            <li>
                                <a href="#design-assignment" role="tab" data-toggle="tab">Lately Purchased</a>
                            </li>
                        </ul>
                        <!-- 탭 끝 -->
                        <!--  탭 내용  -->
                        
                        <!-- 완료 강의 -->
                            <div class="tab-pane fade in active" id="design-question">                               
                                <table class="table-quest">
                                    <tbody>
                                      
                                      <s:iterator value="recentlyCompletedLectureList" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><s:property value="lecturename" /> &nbsp;[ &nbsp;강좌명: &nbsp; <s:property value="coursename" /> &nbsp; ]</td>                                          
                                        </tr>
										</s:iterator>
                                       
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <!-- 구입강의 -->
                            <div class="tab-pane fade" id="design-assignment">
                                
                                <table class="table-assignment">
                                    <tbody>
                                     <s:iterator value="latelyPurchasedLectureList" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><s:property value="lecturename" /> &nbsp;[ &nbsp;강좌명: &nbsp; <s:property value="coursename" /> &nbsp; ]</td>                                          
                                        </tr>
										</s:iterator>
                                       
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN ASSIGNMENT -->
    
                        </div>
                        <!-- 내용 끝 -->
                        <!-- 베스트 랭킹 탭 끝 -->
  
                    </aside>    
				</div>
				  <!-- END / SIDEBAR -->
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
		
<script>
$(function(){
	 
$("body").on('click', '#watchMore', function(){
	
	var start = $(".form-study > div:first").attr('id');
	start = parseInt(start) + 2;
	var end = start + 1;
	var stringForTokenizer = '';
	//var test = $("[name=interest]");
/* 	for(var i = 0; i < test.length; i++){
		if(test[i].checked){
			stringForTokenizer += test[i].value + ',';
		}
	} */
	
	$.ajax({
		type: 'GET'
		, url: 'plusStudyMain'
		, data : 'start='+start+'&end='+end
		, success : function(response){
			var indexNum = start;
			var list = response.courseList;
			
			$('.form-study').html('');
			
			list.forEach(function(course){
				
				var divTag = $('<div class="form-study-course" id='+(indexNum++)+'><div class="study-course-bg mc-item3"></div></div>');
				
				divTag.html('<div class="meta-categories">'+ course.courseTypeList +'</div><div class="content-item"><h3><a href="selectCourseDetailForStudy.action?courseno='+course.courseno
						+'">'+course.coursename+'</a></h3><div class="name-author"> By '+course.teacherid+'</div></div>').prependTo(".form-study");
			
			});
		}
	});
	//event.preventDefault(); 
});
});	
</script>
</body>
</html>