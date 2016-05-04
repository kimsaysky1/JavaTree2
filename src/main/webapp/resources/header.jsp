<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<body>
	<!-- HEADER -->
		<header id="header" class="header">
			<div class="container">

				<!-- LOGO -->
				<div class="logo">
					<a href="callIndex.action">   
					<img src="resources/javatree_view/html/images/logo.png" alt="" width="210px;"></a>
				</div>
				<!-- END / LOGO -->

				<!-- NAVIGATION -->
				<nav class="navigation">

					<div class="open-menu">
						<span class="item item-1"></span> 
						<span class="item item-2"></span>
						<span class="item item-3"></span>
					</div>

					<!-- MENU -->
					<ul class="menu">
						<li class="current-menu-item"><a href="../javatree/index.action">HOME</a></li>
						<li class="menu-item-has-children megamenu col-4"><a href="/javatree/course/selectAllCourseList.action">COURSE</a></li>
						<li class="menu-item-has-children"><a href="/javatree/qna/qnaDefaultMain.action" id="jt">JAVATree</a></li>					
					<s:if test="%{#session.loginId != null}">
						<li><a href="/javatree/member/logout.action">LOGOUT</a></li>
					</s:if>
					<s:else>	
						<li class="menu-item-has-children"><a href="/javatree/member/loginFrom.action">LOGIN</a></li>
						<li><a href="/javatree/member/joinForm.action">JOIN IN</a></li>
					</s:else>
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
										
					<s:if test="%{#session.loginId != null}">
					<ul class="list-account-info">
					
					<!-- account 사진 및 로그아웃 -->
					<li class="list-item account">
							<div class="account-info item-click">
								<img src="resources/javatree_view/html/images/account_kong.png"
									alt="">
							</div>
							<div class="toggle-account toggle-list">
								<ul class="list-account">
									<li><a href="login.html"><i class="icon md-arrow-right"></i>Check Point</a></li>
									<li><a href="login.html"><i class="icon md-arrow-right"></i>Edit Member</a></li>
									<li><a href="login.html"><i class="icon md-arrow-right"></i>Log Out</a></li>
									
								</ul>
							</div>
						</li>

						<!-- NOTIFICATION -->
						<li class="list-item notification">
							<div class="notification-info item-click">
								<i class="icon md-bell"></i>
								<span class="itemnew" style="display:none;"></span> <!-- 벨체크 -->
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
													<div class="author">&nbsp;
														<span></span>
														<div class="div-x"></div>
													</div>
													<p></p>
													<div class="time">
														<span></span>
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
						<li class="menu-item-has-children"><a href="/javatree/course/selectAllCourseList.action" id="jt">MY PAGE</a>
							
								<ul class="sub-menu">
									<li><a href="/javatree/course/selectAllCourseListForTeach.action">Teach MYPAGE</a></li>
									<li><a href="/javatree/course/studyMainView2.action">Study MYPAGE</a></li>
								</ul>
							
						</li>
					</ul>
					</s:if>
				</nav>
				<!-- END / NAVIGATION -->
			</div>
		</header>
		<!-- END / HEADER -->
</body>
</html>