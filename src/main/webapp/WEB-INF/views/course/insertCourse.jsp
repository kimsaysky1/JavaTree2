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
<title>강좌 등록</title>
<script type="text/javascript">

 function insertCourForm(){
	 

	var form = document.getElementById("insertCourseForm");
	var coursename= document.getElementById("coursename").value;
	var introdution= document.getElementById("introdution").value;
	var check = false;	
	var chk = document.getElementsByName("courseTypeList"); // 체크박스객체를 담는다
	//var categoriesUnit= document.getElementsByName("categoriesUnit");

	//alert(chk);
	
	if(coursename==""){
		alert("강의명을 입력해 주세요.");
		return false;
	}
	if(introdution==""){
		alert("강의설명을 입력해 주세요.");
		return false;
	}
	/* if(chk.value==""){
		alert("선택해주세요.");
		return false;
	} */
	
	
	var count='';
	for(var i=0; i<chk.length; i++){
		if(chk[i].checked){
			count++;
			if(count>3){
				alert("3개까지만 선택하세요^^");
				return;
			}
			
		}
		
	}
	
	
	
	/* var len = categoriesUnit.length;    //체크박스의 전체 개수
	var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
	var checkCnt = 0;        //체크된 체크박스의 개수
	var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
	var cnt = 0;                 

	for(var i=0; i<len; i++){
		if(chk[i].checked == true){
		checkCnt++;        //체크된 체크박스의 개수
		checkLast = i;     //체크된 체크박스의 인덱스
		}
	} 

	for(var i=0; i<len; i++){
		if(chk[i].checked == true){  //체크가 되어있는 값 구분
			checkRow = chk[i].value;
			            	
			if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
			rowid += "'"+checkRow+"'";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
			if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
			rowid += "'"+checkRow+"'";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{
			rowid += "'"+checkRow+"',";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
			}
								
			}
			cnt++;
			checkRow = '';    //checkRow초기화.
		}
		alert(rowid);    //'value1', 'value2', 'value3' 의 형태로 출력된다.  */
	/* location.href="/SEBank/admin/answerlist.action?currentPage="+currentPage+"&searchField="+field.value+"&searchText="+text.value; */
	form.submit();
}
 
<%-- <form name="checkTest">
<table>
<tr>
<td><input type="checkbox" name="checkall" onclick="javascript:CheckAll()"></th>    //이 체크박스를 통해서 전체 선택 해제가 된다
<td>카테고리  </td>
<td>카테고리  </td>
<td>카테고리  </td>
<td>카테고리  </td>
<td>등록 날짜 </td>
</tr>
<%
		for(int i=0; i< test.length; i++){
%>
<tr>
<td><input type="checkbox" id="del_id" name="del_unit[]" value="<%=value>"></td> //이 체크박스가 for문에 의해서 여러개 생성
<td><%= value%> </td>
<td><%= value%> </td>
<td><%= value%> </td>
<td><%= value%> </td>
<td><%= value%> </td>
</tr>	
<%
}
%>
</table>
</form> --%>

/* function CheckAll(){
	var check = false;
	var chk = document.getElementsByName("categoriesUnits[]");
	if(check == false){
		check = true;
		for(var i=0; i<chk.length;i++){                                                                    
			chk[i].checked = true;     //모두 체크
		}
	}else{
		check = false;
		for(var i=0; i<chk.length;i++){                                                                    
			chk[i].checked = false;     //모두 해제
	}
	}
}
 */

</script>

</head>
<body>
<!-- HEADER -->
		<header id="header" class="header">
			<div class="container">

				<!-- LOGO -->
				<div class="logo">
					<a href="index.html"><img
						src="resources/javatree_view/html/images/logo.png" alt=""></a>
				</div>
				<!-- END / LOGO -->

				<!-- NAVIGATION -->
				<nav class="navigation">

					<div class="open-menu">
						<span class="item item-1"></span> <span class="item item-2"></span>
						<span class="item item-3"></span>
					</div>

					<!-- MENU -->
					<ul class="menu">
						<li class="current-menu-item"><a href="index.html">HOME</a></li>
						<li class="menu-item-has-children megamenu col-4"><a href="#">COURSE</a>
							<ul class="sub-menu">
								<li class="menu-item-has-children"><a href="#">Account
										1</a>
									<ul class="sub-menu">
										<li><a href="account-assignment.html">Account
												Assignment</a></li>
										<li><a href="account-inbox.html">Account Inbox</a></li>
										<li><a href="account-learning.html">Account Learning</a></li>
										<li><a href="account-profile-owner-view.html">Account
												Profile Owner</a></li>
										<li><a href="account-profile-guest-view.html">Account
												Profile Guest</a></li>
										<li><a href="account-teaching.html">Account Teaching</a></li>
										<li><a href="setting.html">Setting</a></li>
									</ul></li>

								<li class="menu-item-has-children"><a href="#">Asignment
										2</a>
									<ul class="sub-menu">
										<li><a href="asignment-after-submit.html">Asignment
												After Submit</a></li>
										<li><a href="asignment-list.html">Asignment List</a></li>
										<li><a href="asignment-marking.html">Asignment
												Marking</a></li>
										<li><a href="asignment-received.html">Asignment
												Received</a></li>
										<li><a href="asignment-submit.html">Asignment Submit</a></li>
										<li><a href="become-teacher.html">Become Teacher</a></li>
										<li><a href="categories.html">Categories</a></li>
									</ul></li>
								<li class="menu-item-has-children"><a href="#">Course 3</a>
									<ul class="sub-menu">
										<li><a href="course-intro.html">Course Intro</a></li>
										<li><a href="course-learn.html">Course Learn</a></li>
										<li><a href="create-basic-information.html">Create
												Basic Information</a></li>
										<li><a href="create-design-course.html">Create Design
												Course</a></li>
										<li><a href="create-publish-course.html">Create
												Publish Course</a></li>
										<li><a href="request-teacher.html">Request Teacher</a></li>
										<li><a href="search-result-found.html">Search Result
												Found</a></li>
										<li><a href="search-result-not-found.html">Search
												Result Found</a></li>
									</ul></li>
								<li class="menu-item-has-children"><a href="#">Learn 3</a>
									<ul class="sub-menu">
										<li><a href="learning.html">Learning</a></li>
										<li><a href="quizz-1.html">Quizz 1</a></li>
										<li><a href="quizz-2.html">Quizz 2</a></li>
										<li><a href="quizz-3.html">Quizz 3</a></li>
										<li><a href="quizz-5.html">Quizz 5</a></li>
										<li><a href="quizz-20.html">Quizz 20</a></li>
										<li><a href="quizz-finish.html">Quizz Finish</a></li>
										<li><a href="quizz-intro.html">Quizz Intro</a></li>
									</ul></li>
							</ul></li>
						<li class="menu-item-has-children"><a href="blog-list.html"
							id="jt">JAVATree</a>
							<ul class="sub-menu">
								<li><a href="blog-list.html">Blog list</a></li>
								<li><a href="blog-single.html">Blog single</a></li>
							</ul></li>
						<li class="menu-item-has-children"><a href="WEB-INF/views/login.jsp">LOGIN</a>
						</li>
						<li><a href="register.html">JOIN IN</a></li>
					</ul>
					<!-- END / MENU -->

					<!-- SEARCH BOX -->
					<div class="search-box">
						<i class="icon md-search"></i>
						<div class="search-inner">
							<form>
								<input type="text" placeholder="key words">
							</form>
						</div>
					</div>
					<!-- END / SEARCH BOX -->

					<!-- LIST ACCOUNT INFO -->
					<ul class="list-account-info">
					
					<!-- accout 사진 및 로그아웃 -->
					<li class="list-item account">
							<div class="account-info item-click">
								<img src="../resources/javatree_view/html/images/team-13.jpg"
									alt="">
							</div>
							<div class="toggle-account toggle-list">
								<ul class="list-account">
									<li><a href="login.html"><i
											class="icon md-arrow-right"></i>Log Out</a></li>
								</ul>
							</div>
						</li>

						<!-- NOTIFICATION -->
						<li class="list-item notification">
							<div class="notification-info item-click">
								<i class="icon md-bell"></i> <span class="itemnew"></span>
							</div>
							<div class="toggle-notification toggle-list">
								<div class="list-profile-title">
									<h4>Notification</h4>
									<span class="count-value">2</span>
								</div>

								<ul class="list-notification">

									<!-- LIST ITEM -->
									<li class="ac-new"><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
											
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li class="ac-new"><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
											
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

								</ul>
							</div>
						</li>
						<!-- END / NOTIFICATION -->
					</ul>
					<!-- END / LIST ACCOUNT INFO -->
					<ul class="menu">
						<li class="menu-item-has-children"><a href="blog-list.html" id="jt">MY PAGE</a>
							<ul class="sub-menu">
								<li><a href="/javatree/course/teachMainView.action">Course MYPAGE</a></li>
								<li><a href="/javatree/course/studyMainView.action">Course MYPAGE2</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<!-- END / NAVIGATION -->
			</div>
		</header>
		<!-- END / HEADER -->
		
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
        
      <section id="create-course-section" class="create-course-section">
        <div class="container">
    
		 <div class="mid-insert-course">
		 
		    <h2>insert COURSE</h2>
		    
<form action="insertCourse" method="post" id="insertCourseForm"> 
    
                    <div class="create-course-content">

                        <!-- PROMO VIDEO -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Title</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="form-item" >
                                        <input type="text" placeholder="title" name="course.coursename" id="coursename" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->

                        <!-- DESCRIPTION -->
                        <div class="description create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Description</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="description-editor text-form-editor">
                                        <textarea placeholder="Discription" name="course.introdution" id="introdution" ></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / DESCRIPTION -->

                        <!-- CATEGORIES -->
                        <div class="categories-item create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4 class="err">Categories</h4>
                                    <span class="text-err">choose at least one</span>
                                </div>
                                <div class="create-course-2">
                                    <table class="table-categories">
                                        <tr>
                                        <!-- 	<td><input type="checkbox" name="checkall" onclick="javascript:CheckAll()"></td> -->
                                        	
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="purejava" value="1" name="courseTypeList">
                                                    <label for="purejava">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        PUREJAVA
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="web" value="2" name="courseTypeList">
                                                    <label for="web">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        WEB
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="mobile" value="3" name="courseTypeList">
                                                    <label for="mobile">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        MOBILE
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="iot" value="4" name="courseTypeList">
                                                    <label for="iot">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        IOT
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="swing" value="5" name="courseTypeList">
                                                    <label for="swing">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                       SWING
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style"> 
                                                    <input type="checkbox" id="jdbc" value="6" name="courseTypeList">
                                                    <label for="jdbc">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        JDBC
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="api" value="7" name="courseTypeList">
                                                    <label for="api">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        API
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="spring" value="8" name="courseTypeList">
                                                    <label for="spring">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        SPRING
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="struts" value="9" name="courseTypeList">
                                                    <label for="struts">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        STRUTS
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="etcframework" value="10" name="courseTypeList">
                                                    <label for="etcframework">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        etcFramework
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="etc" value="11" name="courseTypeList">
                                                    <label for="etc">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                       ETC
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>                            
                        </div>
                        <!-- END / CATEGORIES -->

                        <div class="form-action">
                            <input type="submit" value="Save" onclick="javascript:insertCourForm()" class="submit mc-btn-3 btn-style-1">
                        </div>
                        
                    </div>
                    
</form> 
                </div>
            </div>
    </section>
    <!-- END / CREATE COURSE CONTENT -->
		
		
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