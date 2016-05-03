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
	
	<!-- <section class="profile-feature">
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
	</section> -->
	<!-- END / PROFILE FEATURE -->

	<!-- 가운데 영역 -->
	<section class="blog2">
<div class="mid-detail-course">
			<div class="container">
			 <h3>Lecture List</h3><!-- <h3>About Course</h3> -->
			 </div>
			 </div>
	
		<%-- <div class="mid-detail-course">
			<div class="container">
			 <h3>About Lecture</h3><!-- <h3>About Course</h3> -->
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
		</div> --%>
		<div id="courseDetail" class="courseDetail learn-section">
			<div class="container">

				<div class="table-student-submission">
					<table class="mc-table">
						<thead>
							<!-- <tr>
								<th class="submissions2">Lecture List</th>
								<th class="author"></th>
								<th class="score"></th>
								<th class="submit-date"></th>
								<th class=""></th>
							</tr> -->
						</thead>

						<tbody>
							<s:iterator value="lectureList" status="counter">
							<tr>
								<td class="submissions"><s:property value="#counter.index + 1" />.&nbsp;&nbsp;&nbsp;<s:property value="lecturename" /></td>
								<td class="author"></td>
								<td class="score"></td>
					
								
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
									<td class="submit-date"><a href='../compiler/Compiler.action?lectureno=<s:property value="lectureno"/>' target="popup" onclick="window.open('../compiler/Compiler.action?lectureno=<s:property value="lectureno"/>','kongPlayer','width=1800,height=1000')">Watch</a></td>
								</s:if>
								
								<s:else>
								<td class="submit-date"></td>
								<td class="submit-date"></td>
									<td class="submit-date"><a href='insertLectureForStudy1.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno" />&coursename=<s:property value="coursename" />&teacherid=<s:property value="teacherid" />'>Apply</a></td>
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
						<!-- 	<tr class="new">
								<td class="submissions"></td>
								<td class="author">&nbsp;&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;보&nbsp;&nbsp;없&nbsp;&nbsp;음</td>
								<td class="score"></td>
								<td class="submit-date"></td>
								<td class="submit-date"></td>
								<td class="submit-date"></td>
							</tr> -->
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