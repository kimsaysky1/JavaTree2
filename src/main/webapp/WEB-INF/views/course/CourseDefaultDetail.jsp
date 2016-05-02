<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- <link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/style.css"> -->

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
    
<title>CourseDefaultDetail</title>
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
		                 <h3 class="big2">About Course</h3>
		                 <table>
		                 <tr>
		                 <td style="width:170px;">  <h4>  Title  </h4> </td>
		                 <td> <h3 class="big"><s:property value="coursename" /></h3> </td>
		                 </tr>
		                 <tr>
		                 <td style="width:170px;"> <h4>  Introduction  </h4> </td>
		                 <td> <h5><s:property value="introdution" /></h5></td>
		                 </tr>
		                 </table>

		                </div>     
		            </div>
		       <%--      <div class="info-follow">
		                <div class="trophies">
		                    <span>JAVA KONG</span>
		                    <p>POINT</p>
		                </div>
		            </div> --%>
		        </div>
		    </section>
        <!-- END / PROFILE FEATURE -->
	
		<!-- 가운데 영역 -->
	<section class="blog2">

		<div class="mid-detail-course">
			<div class="container">
			 <h3>Lecture List</h3>
			</div>
		</div>
		<div id="courseDetail" class="courseDetail learn-section">
			<div class="container">

				<div class="table-student-submission" >
					<table class="mc-table" >
						<tbody>
						
						<s:iterator value="lectureList" status="counter">
							<tr class="new">
								<td class="submissions"><s:property value="#counter.index + 1" />.&nbsp;&nbsp;&nbsp;<s:property value="lecturename" /></td>
								<td class="author"></td>
								<td class="score"><s:property value="regdate" /></td>
								
								
								
					<s:if test="studying != null">
									<s:url id ="download" action = "DownLoadFile">
						<s:param name ="uploadedfilename">
							${subnoteName}
						</s:param>
						<s:param name = "lectureno">
							${lectureno}
						</s:param>
						</s:url>
							<td class="submit-date"></td>
							<td class="submit-date">
								<s:a href="%{download}" method="post">${subnoteName}</s:a>
							</td>
							<td class="submit-date"><a href='../compiler/Compiler.action?lectureno=<s:property value="lectureno"/>' target="_blank">Watch</a></td>
					</s:if>
								
					<s:else>
								<td class="submit-date"></td>
								<td class="submit-date"></td>
								<td class="submit-date"><a href='insertLectureForStudy.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno" />&coursename=<s:property value="coursename" />&teacherid=<s:property value="teacherid" />'>Apply</a></td>
					</s:else>
							</tr>
						</s:iterator>
							
				<s:if test="lectureList == null">
						<div class="noneList">
							<div class="container">
								<h3>정 보 없 음 </h3>
							</div>
						</div>
						<!-- 	<tr class="new">
								<td class="submissions"></td>
								<td class="author">정</td>
								<td class="score">보</td>
								<td class="submit-date">&nbsp;&nbsp;없</td>
								<td class="submit-date">&nbsp;&nbsp;음</td>
								<td class="submit-date"></td>
							</tr> -->
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
             <li><a href = 'plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>'>next &gt</a></li>
            </s:elseif>
			
			<s:elseif test='#session.currentPage == #session.endPageGroup & #session.endPageGroup != 1'>
             <li><a href = 'plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>'>&lt prev</a></li>
            <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/> </a> </li>
            </s:elseif>
			
			<s:elseif test="#session.currentPage == 0">
             </s:elseif>
			
			<s:else>
             <li><a href = 'plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>'>&lt prev</a></li>
             <li><a><s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = 'plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>'>next &gt</a></li>
            </s:else>
						
				<!-- 		<li class="pager-current">1</li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">next ›</a></li>
						<li><a href="#">last »</a></li> -->
					</ul>
				</div>

			</div>
		</div>


	<form method="get" id="frm" name="frm">
	
	</form>


	</section>
	
<%@include file="/resources/footer.jsp" %>

</body>
	<!-- Load jQuery -->
	<script src="../resources/jquery-2.2.3.min.js"></script>
	<script src="../resources/jquery-ui.min.js"></script>
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
	
	<s:if test="message != null">
  		<script type="text/javascript">
   		var result = "${message}";
   		alert(result);
	</script>
 </s:if>
	
	<script>
	
	$(document).ready(function() { 
		
		//backspace 제어
		 try{
             /*
             * [페이지 자동 이벤트 처리기]
             * 기능 : 검색어 입력 후 BackSpace를 눌렀을때, 404에러나는 것 방지 처리
             * 처리 : Backspace Code 입력시 '목록' 버튼을 누르게 하고, 실제 backSapce Code를 막는다
             */
             <%-- var $HOME_PATH ='<%=request.getContextPath()%>'; --%>
             function backSpaceKey() {
                 if(event.keyCode==8){                    
                       var f1 = document.frm;
                      
                       /* f1.action=$HOME_PATH+"/board/dispatch_document.jsp?cur_page=1"; */
                       f1.action = "backAction.action"
                       f1.target="_self";
                       f1.submit();
                       event.preventDefault(); 
                        }
              		if(event.keyCode == 8){
                        return event.keyCode = 17;
                       }
              }
              document.onkeydown = backSpaceKey;
              
   }catch(err){
              //alert('An error has occurred ');
   }
		
		// BackSpace 키 방지 이벤트
	   /*  $(document).keydown(function(e){   
	        if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){       
	            if(e.keyCode === 8){   
	            	
	            	return false;
	            }
	        }
	    }); */
	 
	    //window.history.forward(0);
	    
	    //뒤로가기 버튼 방지
	     //history.replaceState(null, null, "backAction.action");
	   /*  $(window).bind("hashchange", function(){
	   		history.pushState(null, null, "backAction.action");
	    }); */
	
	    //브라우저 뒤로가기 제어!
	history.pushState(null, null, location.href);
  	window.onpopstate = function(event) {
	    	
	    	location.replace("backAction.action");
   };
	    
	});
	
	</script>
	
	</body>
</html>