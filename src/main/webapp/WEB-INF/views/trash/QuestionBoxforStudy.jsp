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
<title>Mega Course - Learning and Courses HTML5 Template</title>
</head>
<body id="page-top">
	<!-- PAGE WRAP -->
	<div id="page-wrap">
		<div class="top-nav">
			<h4 class="sm black bold">QUESTION BOX</h4>
			<ul class="top-nav-list">
				<li class="outline-learn">
					<div class="list-item-body outline-learn-body">
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
								<td style='width: 400px;'><b>내가 저장한 문제</b><br /> 
									<select multiple="multiple" id='lstBox1'style='width: 400px; height: 600px;'>
											<s:iterator value="codingList" status="st">   
												<option value="<s:property value="codingno"/>"><s:property value="codingquestion"/></option>
											 </s:iterator>
									</select>
								</td>
								<td style='width: 30px;'></td>
								<td>
								<form id = "form1" action="insertCodingfromMain">
									<table style='width: 550px;'>
										<tr>
											<td style='width: 100px; text-align: center;'><b>QUESTION</b></td>
											<td><textarea style="height: 60px;" id="q_title"name = "coding.codingquestion" READONLY></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td style='width: 100px; text-align: center;'><b>CODE</b></td>
											<td><textarea style="height: 220px;" id = "codebox" name = "coding.codingtemplet" READONLY></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td style='width: 100px; text-align: center;'><b>MY CODE</b></td>
											<td ><textarea id = "mycodebox" style="height: 220px;" ></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td><input type="button" id = "delete_btn"  value="삭제" style="float: right;"></td>
											<td><input type="button" id = "submit_btn"  value="정답보기" style="float: right;"></td>
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
		
		$("#lstBox1").change(function(){
			var codingno= parseInt($(this).val());		
			$.ajax({
				url : 'showcodinglistinstudy.action',
				data : {'codingno' : codingno},
				success : function(response){
					alert('성공');
					alert(response);
					alert(response.mycode);
					var codingn =  parseInt(response.coding.codingno);
					$('#q_title').attr('placeholder',response.coding.codingquestion);	
					$('#codebox').attr('placeholder',response.coding.codingtemplet);	
					$('#mycodebox').html(response.mycode);	
					$('#codeno').attr('value',codingn);	
				
				},
				error:function(){
					alert('에러');
				}
			});
			
			$('#delete_btn').click(function(){
				$.ajax({
					url : 'deletefromcodingbox.action',
					data : {'codingno' : codingno},
					success : function(response){
						console.log('성공');
					},
					error:function(){
						console.log('에러');
					}
				});
			});
			
			$('#submit_btn').click(function(){				
				window.open('showcodinganswer.action?codingno='+codingno,'pop','resizable=no scrollbars=yes top=50 left=200 width=500 height=400'); 
				
			});
		});
	});
	
	</script>

</body>
</html>