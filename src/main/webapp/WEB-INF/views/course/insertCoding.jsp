<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<title>코딩문제 등록</title>
</head>
<body id="page-top">

	<!-- PAGE WRAP -->
	<div id="page-wrap">

		<div class="top-nav">

			<h4 class="sm black bold">QUESTION BOX</h4>

			<ul class="top-nav-list">
				<li class="outline-learn"><a href="#"><i
						class="icon md-list"></i></a>
					<div class="list-item-body outline-learn-body">
						<div class="section-learn-outline">
							<h5 class="section-title">MENU</h5>
							<ul class="section-list">
								<li>
									<div class="o-view">
										<a href="/javatree/course/codingFormfromMain.action">
											<h6>MAIN</h6>
										</a>
									</div>


								</li>

								<li>
									<div class="list-body">
										<a href="/javatree/course/insertCodingfromMainView.action">
											<h6>INSERT</h6>
										</a>
									</div>


								</li>

								<li>
									<div class="list-body">
										<a href="/javatree/course/updateCodingfromMainView.action">
											<h6>UPDATE</h6>
										</a>
									</div>

								</li>

							</ul>
						</div>
						
					</div>
				</li>
				<!-- 페이지 종료 -->
				<li class="backpage"><a href="index.html"><i
						class="icon md-close-1"></i></a></li>
			</ul>

		</div>
		<section id="quizz-intro-section"
			class="quizz-intro-section learn-section">
			<div class="container">

				<div class="title-ct">
					<h3>
						<strong></strong>
					</h3>
					<div class="tt-right">
						<a href="#" class="skip"><i class="icon md-arrow-right"></i></a>
					</div>
				</div>
				<div class="question-content-wrap">
					<div class="question-content">
						<h4 class="sm">QUESTION BOX</h4>

						<table style='width: 1000px;'>
							<tr>
								<td style='width: 400px;'><b>ALL QUESTION</b><br /> 
								<select multiple="multiple" id='lstBox1'style='width: 400px; height: 600px;'>
										<s:iterator value="codingList" status="st">   
											<option value="<s:property value="codingquestion"/>"><s:property value="codingquestion"/></option>
										 </s:iterator>
								</select>
								</td>
								<td style='width: 30px;'></td>
								<td>
								<form id = "form1" action="insertCodingfromMain">
									<table style='width: 550px;'>
										<tr>
											<td style='width: 100px; text-align: center;'><b>QUESTION</b></td>
											<td><textarea style="height: 60px;" id="q_title"name = "coding.codingquestion"></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td style='width: 100px; text-align: center;'><b>CODE</b></td>
											<td><textarea style="height: 220px;" id = "codebox" name = "coding.codingtemplet"></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td style='width: 100px; text-align: center;'><b>ANSWER</b></td>
											<td><textarea style="height: 220px;" id = "answerbox" name ="coding.codinganswer"></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td><input type="submit" id = "submit_btn"  value="등록" style="float: right;"></td>
										</tr>
									</table>
									</form>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</section>



	</div>
	<!-- END / PAGE WRAP -->

	<!-- Load jQuery -->
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/scripts.js"></script>
		
	<script type="text/javascript">
	
	$(function(){
		
		
		$('#submit_btn').click(function(){
			
		var q_title = document.getElementById("q_title").value;
		var codebox = document.getElementById("codebox").value;
		var answerbox = document.getElementById("answerbox").value;
		
		
		if(q_title == ""){
			alert("질문을 입력해주세요");
		}else if(codebox == ""){
			alert("코드를 입력해주세요");
		}else if(answerbox = ""){
			alert("정답을 입력해주세요");
		}else{
			 document.getElementById('form1').submit();
		}
		
		});
		
	});
	
	</script>

</body>
</html>