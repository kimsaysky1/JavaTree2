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
                    <a href="/javatree/course/teachMainView.action">
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
				<div class="tab-content">
                    <!-- MY SUBMISSIONS -->
                    <div class="tab-pane fade in active" id="mysubmissions">
                        <div class="table-wrap">
                            <!-- TABLE HEAD -->
                            <div class="table-head">
                                <div class="submissions"></div>
                                <div class="total-subm">Submissions</div>
                                <div class="replied">Replied</div>
                                <div class="latest-reply">Latest Reply</div>
                                <div class="tb-icon"></div>
                            </div>
                            <!-- END / TABLE HEAD -->

                            <!-- TABLE BODY -->
                            <div class="table-body">
                                <!-- TABLE ITEM -->
                                <div class="table-item">
                                    <div class="thead">
                                        <div class="submissions"><a href="#">Learning for dummies</a></div>
                                        <div class="total-subm">0/4</div>
                                        <div class="replied">0/2</div>
                                        <div class="latest-reply">11. Jul , 2014</div>
                                        <div class="toggle tb-icon">
                                            <a href="#"><i class="fa fa-angle-down"></i></a>
                                        </div>
                                    </div>

                                    <div class="tbody">
                                        <!-- ITEM -->
                                        <div class="item">
                                            <div class="submissions"><a href="#">Title of Assignment 1 in course</a></div>
                                            <div class="total-subm">Submited</div>
                                            <div class="replied">Replied</div>
                                            <div class="latest-reply">11. Jul , 2014</div>
                                            <div class="link tb-icon">
                                                <a href="#"><i class="fa fa-play-circle-o"></i></a>
                                            </div>
                                        </div>
                                        <!-- END / ITEM -->

                                        <!-- ITEM -->
                                        <div class="item">
                                            <div class="submissions"><a href="#">Title of Assignment 2 in course</a></div>
                                            <div class="total-subm">Submited</div>
                                            <div class="replied">Replied</div>
                                            <div class="latest-reply">11. Jul , 2014</div>
                                            <div class="link tb-icon">
                                                <a href="#"><i class="fa fa-play-circle-o"></i></a>
                                            </div>
                                        </div>
                                        <!-- END / ITEM -->

                                        <!-- ITEM -->
                                        <div class="item">
                                            <div class="submissions"><a href="#">Title of Assignment 3 in course</a></div>
                                            <div class="total-subm">Submited</div>
                                            <div class="replied">Replied</div>
                                            <div class="latest-reply">11. Jul , 2014</div>
                                            <div class="link tb-icon">
                                                <a href="#"><i class="fa fa-play-circle-o"></i></a>
                                            </div>
                                        </div>
                                        <!-- END / ITEM -->

                                        <!-- ITEM -->
                                        <div class="item">
                                            <div class="submissions"><a href="#">Title of Assignment 4 in course</a></div>
                                            <div class="total-subm">Submited</div>
                                            <div class="replied">Replied</div>
                                            <div class="latest-reply">11. Jul , 2014</div>
                                            <div class="link tb-icon">
                                                <a href="#"><i class="fa fa-play-circle-o"></i></a>
                                            </div>
                                        </div>
                                        <!-- END / ITEM -->

                                    </div>
                                </div>
                                <!-- END / TABLE ITEM -->
                                </div>
                                </div>
                                </div>
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
		
	<script type="text/javascript">

    $.each($('.table-wrap'), function() {
        $(this)
            .find('.table-item')
            .children('.thead:not(.active)')
            .next('.tbody').hide();
        $(this)
            .find('.table-item')
            .delegate('.thead', 'click', function(evt) {
                evt.preventDefault();
                if ($(this).hasClass('active')==false) {
                    $('.table-item')
                        .find('.thead')
                        .removeClass('active')
                        .siblings('.tbody')
                            .slideUp(200);
                }
                $(this)
                    .toggleClass('active')
                    .siblings('.tbody')
                        .slideToggle(200);
        });
    });

</script>

</body>
</html>