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
<title>updateCoding</title>
</head>
<body id="page-top">

	<!-- PAGE WRAP -->
	<div id="page-wrap">

		<div class="top-nav" style="z-index: 1;">

			<h4 class="sm black bold">QUESTION BOX</h4>

			<ul class="top-nav-list">
				<li class="outline-learn"><a href="#"><i
						class="icon md-list"></i></a>
					<div class="list-item-body outline-learn-body">
					<div class="section-learn-outline">
							<h5 class="section-title">MENU</h5>
							<ul class="section-list">
								<li>
									<%if(request.getAttribute("checkMain").equals("main")){%>
									<div class="o-view">
										<a href="/javatree/course/codingFormfromMain.action">
											<h6>MAIN</h6>
										</a>
									</div>
									<%}else{ %>
									<div class="o-view">
										<a href="/javatree/course/codingMainInsertLectureView.action">
											<h6>MAIN</h6>
										</a>
									</div>
									<%}%>
								</li>
								<li>
									<div class="list-body">
										<a href="/javatree/course/insertCodingfromMainView.action?from=${from}">
											<h6>INSERT</h6>
										</a>
									</div>
								</li>
								<li>
									<div class="list-body">
										<a href="/javatree/course/updateCodingfromMainView.action?from=${from}"">
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
								<select multiple="multiple" id='codinglistbox'style='width: 400px; height: 600px;'>
										<s:iterator value="codingList" status="st">   
											<option value="<s:property value="codingno"/>"><s:property value="codingquestion"/></option>
										 </s:iterator>
								</select>
								</td>
								<td style='width: 30px;'></td>
								<td>
									<table style='width: 550px;'>
										<tr>
											<td style='width: 100px; text-align: center;'><b>QUESTION</b></td>
											<td><textarea style="height: 60px;" id="q_title" name = "coding.codingquestion" placeholder=""></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr> 
										<tr>
											<td style='width: 100px; text-align: center;'><b>CODE</b></td>
											<td><textarea style="height: 220px;" id = "codebox" name = "coding.codingtemplet"  placeholder=""></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td style='width: 100px; text-align: center;'><b>ANSWER</b></td>
											<td><textarea style="height: 220px;" id = "answerbox" name ="coding.codinganswer" placeholder=""></textarea></td>
										
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td><input type="hidden" id = "codeno" name ="coding.codingno" value ="" ></td>
											<td><input type="button" id = "submit_btn"  value="수정" style="float: right;"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- END / PAGE WRAP -->
	
<div class="container">
  <button type="button" style="display:none;" id = "modalNotification" data-toggle="modal" data-target="#myModal"></button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="margin-top:100%;">
        <div class="modal-body">
          <p>내용이 저장되었습니다.</p>
        </div>
         <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
    </div>
  </div>
</div>
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
		
		$("#codinglistbox").change(function(){
			var codingno= parseInt($(this).val());		
			
			$.ajax({
				url : 'showcodingcontent.action',
				data : {'codingno' : codingno},
				dataType: 'json',
				success : function(response){
					var codingno =  parseInt(response.coding.codingno);
					$('#q_title').val(response.coding.codingquestion);	
					$('#codebox').val(response.coding.codingtemplet);	
					$('#answerbox').val(response.coding.codinganswer);	
					$('#codeno').attr('value',codingno);	
				
				},
				error:function(){
					alert('에러');
				}
			});
			
		});

		
		$('#submit_btn').on('click', function(){
		var q_title = $("#q_title").val();
		var codebox = $("#codebox").val();
		var answerbox = $("#answerbox").val();
		var codingno = $('#codeno').attr('value');
		var from = "${requestScope.checkMain}";
		if(q_title.trim() == ""){
			alert("질문을 입력해주세요");
			return false;
		}else if(codebox.trim() == ""){
			alert("코드를 입력해주세요");
			return false;
		}else if(answerbox.trim() == ""){
			alert("정답을 입력해주세요");
			return false;
		}
			$.ajax({
				url : 'updateCodingfromMain'
				,data : 'coding.codingquestion='+q_title+'&coding.codingtemplet='+
				codebox+'&coding.codinganswer='+answerbox+'&coding.codingno='+codingno+
				'&from='+from
				,dataType : 'json'
				,success : function(response){
					$("#submit_btn").blur();
					$("#modalNotification").trigger('click');
					$('#q_title').val('');	
					$('#codebox').val('');	
					$('#answerbox').val('');
				},
				error:function(){
					console.log('에러');
				}
			});
		}); 
		
	});
	
	</script>

</body>
</html>