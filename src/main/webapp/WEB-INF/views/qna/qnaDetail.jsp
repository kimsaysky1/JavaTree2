<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>JavaTree Detail</title>
<script type="text/javascript" src="../resources/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../resources/jquery-ui.min.js"></script>
</head>
<body>
	<%@include file="/resources/header.jsp"%>

	<!-- 중간 슬라이더 부분 -->
	<section class="sub-banner sub-banner-course">
		<div class="awe-static bg-sub-banner-course"></div>
		<div class="container">
			<div class="sub-banner-content">
				<h2 class="text-center">JAVATree</h2>
			</div>
		</div>
	</section>

	<!-- COURSE -->
	<section class="course-top">
		<div class="container">
			<div class="row">
				<div class="qna-detail">

					<div class="tab-pane fade in active" id="discussion">
						<h3 style="color: green;">About JAVATree</h3>
						<div class="form-discussion">
							<form></form>
						</div>

						<!-- PROFILE -->

						<section class="profile2">
							<div class="container">

								<h3 class="md black">Field</h3>
								<div>${question.typeno}</div>

								<h3 class="md black">Question-title</h3>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-acount2">
											<div class="info-acount">
												<p>ad ma commodo consequat.</p>
											</div>
										</div>
									</div>
								</div>

								<h3 class="md black">Question</h3>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-acount">
											<div class="info-acount">
												<p> ${question.content}</p>
												<div class="profile-email-address">
													<div class="profile-email">
														<h5>ID</h5>
														<p>${question.id}</p>
													</div>
													<div class="profile-address">
														<h5>DATE</h5>
														<p>${question.regdate}</p>
													</div>
													&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													<div class="profile-address">
														<h5>GUNGGUMDO</h5>
														<p>${question.curious}</p>
													</div>
													&nbsp; &nbsp;

													<div class="profile-address">
														<input type="button" value="궁금해요" id="addCurious"
															class="mc-btn-8">
													</div>
													&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
													<div class="profile-address">
														<form action=""></form>
														<input type="button" value="답변달기" data-toggle="modal"
															data-target="#insertReply" class="mc-btn-8">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- END / PROFILE -->
						<hr class="hr2">
						<section class="profil2">
							<ul class="list-discussion">
							
								<s:iterator value="replyList">
									<!-- LIST ITEM -->
									<li>
										<div class="list-body">
											<div class="answer_bg">
												<div class="avatar-acount">
													<cite class="xsm black bold"><s:property value="id"/></cite>
													<h4 class="md black"><s:property value="content"/>
													<div class="comment-meta">
														<a href="#"><s:property value="regdate"/></a> 
														<a href="#"><i class="icon md-arrow-up"></i>추천&nbsp;<s:property value="recommend"/></a> 
														<a href="#" linkvalue = "<s:property value="replyno"/>" class="showRereply"><i class="icon md-back"></i>REPLY</a>
													</div>
												</div>
											</div>
											<div class ="rereplyArea">
												<div id="<s:property value="replyno"/>" style="display:none; background-color: lightblue;">
													<s:iterator value="rereplyList">
														<p><s:property value="id"/> <s:property value="content"/></p>
														<br/>
													</s:iterator>
													<input type = "text" class="insertRereplyText"/>
													<input type = "button" value="덧글작성" class="insertRereplyButton"/>
												</div>
											</div>
										</div>
									</li>
									<!-- END / LIST ITEM -->
								</s:iterator>
							</ul>
					</div>
	</section>
	<!-- END / DISCUSSION -->
	</div>
	</div>
	</div>
	</section>

	<!-- insertReply 모달 -->
	<form action="insertReply" name="insertReply" method="get">
		<div class="container">
			<div class="modal fade" id="insertReply" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Reply</h4>
						</div>
						<div class="modal-body">
							<table style='width: 800px;'>
								<tr>
									<td style='width: 100px; text-align: center;'><b>FIELD</b></td>
									<td>${question.typeno}</td>
								</tr>
								<tr>
									<td style='height: 20px;'></td>
									<td></td>
								</tr>
								<tr>
									<td style='width: 100px; text-align: center;'><b>QUESTION
											TITLE</b></td>
									<td><textarea style="height: 60px;" readonly="readonly">${question.title}</textarea></td>
								</tr>
								<tr>
									<td style='height: 20px;'></td>
									<td></td>
								</tr>
								<tr>
									<td style='width: 100px; text-align: center;'><b>QUESTION
											CONTENT</b></td>
									<td><textarea style="height: 180px;" readonly="readonly">${question.content}</textarea></td>
								</tr>
								<tr>
									<td style='height: 20px;'></td>
									<td></td>
								</tr>
								<tr>
									<td style='width: 100px; text-align: center;'><b>ANSWER
											CONTENT</b></td>
									<td><textarea name="reply.content" style="height: 280px;"></textarea></td>
								</tr>
								<tr>
									<td style='height: 20px;'></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<input type="hidden" value="${question.questionno}" name="reply.questionno" />
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<input type="submit" value="등록" class="mc-btn-5">&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" class="mc-btn-5">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- insertReply 모달 끝-->

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
						<i class="fa fa-map-marker"></i> <span>Maecenas
							sodales,nisl eget</span>
					</div>
				</div>
				<p class="copyright">Copyright © 2014 Megadrupal. All rights
					reserved.</p>
			</div>
		</div>
	</footer>
	<!-- END / FOOTER -->
	
	<script type="text/javascript">
	$(function(){
		$("body").on('click', '.showRereply', function(){
			var temp = $(this).attr('linkvalue');
			//$("#"+temp).css('display', 'block');
			$("#"+temp).toggle(1500);
			$("#"+temp).focus();
		});
		
		$("body").on('click', '.insertRereplyButton', function(){
			var replyno = $(this).parent().attr('id');
			var content = $(this).prev().val();
			$.ajax({
				type: 'GET'
				, url: 'insertRereply'
				, data : 'replyno='+replyno+'&rereply.replyno='+replyno+'&rereply.content='+content
				, dataType : 'json'
				, success : function(response){
					var list = response.rereplyList;
					$("#"+replyno).html('');
					list.forEach(function(rereply){
						$('<p>'+rereply.id+' '+rereply.content+'</p><br/>').appendTo("#"+replyno);
					});
					$('<input type = "text" class="insertRereplyText"/><input type = "button" value="덧글작성" class="insertRereplyButton"/>').appendTo("#"+replyno);
				}
			});
		});
	});
	</script>
	
			<!-- Load jQuery -->
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/scripts.js"></script>
</body>
</html>