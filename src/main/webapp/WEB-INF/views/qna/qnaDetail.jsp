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
	<%@include file="/resources/header2.jsp"%>

	<!-- 중간 슬라이더 부분 -->
	<section class="profile-feature"><%-- <section class="sub-banner sub-banner-course"> --%>
		 <div class="awe-overlay overlay-color-3"></div>
        <div class="awe-static bg-sub-banner-course2"></div><!-- <div class="awe-static bg-sub-banner-course"></div> -->

        <div class="container">
            <div class="sub-banner-content">
                <h4 class="md" style="color: #E3E3E3; text-align: center;">
                <!-- JAVATree &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                			<s:if test="%{#session.loginId != null}">
								${session.loginId} &nbsp; , Welcome to the JavaTree!
							</s:if>
							<s:else>
								Welcome to the JavaTree!
							</s:else>
                
                </h4><!-- <h2 class="text-center">JAVATree</h2> -->
            </div>
        </div>
    </section>
	<%-- <section class="sub-banner sub-banner-course">
		<div class="awe-static bg-sub-banner-course"></div>
		<div class="container">
			<div class="sub-banner-content">
				<h2 class="text-center">JAVATree</h2>
			</div>
		</div>
	</section> --%>

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
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-acount2">
										<div class="info-acount">
										<p id = "typeName">${typeName}</p>
										</div>
										</div>
									</div>
								</div>

								<h3 class="md black">Question-title</h3>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-acount2">
											<div class="info-acount">
												<p id ="questionTitle">${question.title}</p>
											</div>
										</div>
									</div>
								</div>

			
								<h3 class="md black">Question</h3>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-acount">
											<div id = "questionContent" class="info-acount">
												<p>${question.content}</p>
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
													<div id = "curiousDiv" class="profile-address">
														<h5>GUNGGUMDO</h5>
														<p>${question.curious}</p>
													</div>
													&nbsp; &nbsp;

													<div class="profile-address">
														<input type="button" value="궁금해요" id="addCurious"
															class="mc-btn-10">
													</div>
													&nbsp;&nbsp;
													<div class="profile-address" align="right" style="float: right;">
														<form action=""></form>
														<input type="button" id = "insertReplyModal" value="답변달기" data-toggle="modal"
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
								<!-- 답변 영역 -->
								<s:iterator value="replyList">
									<!-- LIST ITEM -->
									<li>
										<div class="list-body">
											<div class="answer_bg">
												<div class="avatar-acount">
													<cite class="xsm black bold">ID&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="id"/></cite>
													<h4 class="md black"><s:property value="content"/> </h4>
													<div class="comment-meta">
														<a href="#"><s:property value="regdate"/></a> 
														<a href="#" class="addRecommend" recommendValue ="<s:property value="replyno"/>"><i class="icon md-arrow-up"></i>추천&nbsp;
														<span><s:property value="recommend"/></span></a> 
														<a href="#" linkvalue = "<s:property value="replyno"/>" class="showRereply"><i class="icon md-back"></i>REPLY</a>
													</div>
												</div>
											</div>
											<!-- 대댓글 영역 -->
											<div class ="rereplyArea">
												<div id="<s:property value="replyno"/>" style="display:none; background-color: white;" class = "innerrereplyArea">
												<div class ="ininnerrereplyArea">
													<s:iterator value="rereplyList">
														<p>
														<span>
														<s:property value="id"/></span>
														&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
														<s:property value="content"/>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
														<a href ="#">x</a></p>
														<br/>
													</s:iterator>
													<input type="text" style="width: 700px;" class="insertRereplyText">
													&nbsp;&nbsp;
													<input type="button" value="덧글작성" class="mc-btn-9">
											<!-- 		<input type = "button" value="덧글작성" class="mc-btn-9"/> -->
												</div>
												</div>
											</div>
											<!-- 대댓글 영역 끝 -->
										</div>
									</li>
									<!-- END / LIST ITEM -->
								</s:iterator>
								<!-- 답변 영역 끝 -->
							</ul>
								</section>
					</div>

	<!-- END / DISCUSSION -->
	</div>
	</div>
	</div>
	</section>

	<!-- insertReply 모달 -->
		<div class="container">
			<div class="modal fade" id="insertReply" role="dialog">
			</div>
		</div>
	<!-- insertReply 모달 끝-->

	<%@include file="/resources/footer.jsp" %>
	
	   <div class="container">
  <button type="button" style="display:none;" id = "modalNotification" data-toggle="modal" data-target="#myModal2"></button>
  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="margin-top:100%;">
        <div class="modal-body" id = "temporaryModal">
          <p>내용이 저장되었습니다.</p>
        </div>
         <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
    </div>
  </div>
</div>
	
	
	<script type="text/javascript">
	
	$(function(){
		
		$('#insertReplyModal').on('click', function(){
			var tempType = $("#typeName").text();
			var	tempTitle = $("#questionTitle").text();
			var tempContent = $("#questionContent pre").text();
			
			var str = '';
			str += '<div class="modal-dialog modal-lg">';
			str += '<div class="modal-content">';
			str += '<div class="modal-header">';
			str += '<button type="button" class="close" data-dismiss="modal">&times;</button>';
			str += '<h4 class="modal-title">Reply</h4></div>';
			str += '<div class="modal-body">';
			str += '<table style=\'width: 840px;\'><tr>';
			str += '<td style=\'width: 100px; text-align: center;\'><b>FIELD</b></td>';
			str += '<td>'+tempType+'</td></tr>';
			str += '<tr><td style=\'height: 20px;\'></td></tr>';
			str += '<tr><td style=\'width: 100px; text-align: center;\'><b>QUESTION TITLE</b></td>';
			str += '<td><textarea style="height: 60px;" readonly="readonly">'+tempTitle+'</textarea></td></tr>';
			str += '<tr><td style=\'height: 20px;\'></td></tr>';
			str += '<tr><td style=\'width: 100px; text-align: center;\'><b>QUESTION CONTENT</b></td>';
			str += '<td><textarea style="height: 180px;" readonly="readonly">'+tempContent+'</textarea></td></tr>';
			str += '<tr><td style=\'height: 20px;\'></td></tr>';
			str += '<tr><td style=\'width: 100px; text-align: center;\'><b>ANSWER CONTENT</b></td>';
			str += '<td><textarea id = "replyContent" name="reply.content" style="height: 280px;"></textarea></td></tr>';
			str += '<tr><td style=\'height: 20px;\'></td></tr>';
			str += '</table></div>';
			str += '<div class="modal-footer"><div class="buttonpart"><input type="button" id="executeModal" value="등록" class="mc-btn-5">&nbsp;&nbsp;&nbsp;';
			str += '<input type="button" id="removeModal" value="취소" class="mc-btn-5"></div></div></div></div>';
			$("#insertReply").html(str);
		});
		
		$('body').on('click', '#executeModal', function(){
			
			var replyContent = $("#replyContent").val();
			var questionId = "${question.id}";
			var questionNo = "${question.questionno}";
			
			$.ajax({
				type: 'POST'
					, url: 'insertReply'
					, data : 'notification.receiverid='+questionId+'&notification.questionno='
							+questionNo+'&reply.questionno='+questionNo+'&reply.content='+replyContent
					, dataType : 'json'
					, success : function(response){
						$('#insertReply').modal('hide');
						$('#insertReply').html('');
						console.log('성공');
						$('#temporaryModal > p').text('답변을 작성하였습니다.');
		  			    $('#modalNotification').trigger('click');
						
						var list = response.replyList;
						$('.list-discussion').html('');
						list.forEach(function(reply){
							
							var divTag = $('<li><div class="list-body"></div></li>');
						 	divTag.html('<div class="answer_bg"><div class="avatar-acount"><cite class="xsm black bold">ID&nbsp;&nbsp;&nbsp;&nbsp;'+reply.id
						 	+'</cite><h4 class="md black">'+reply.content+'</h4><div class="comment-meta">'
						 	+'<a href="#">'+reply.regdate+'</a>'
						 	+'<a href="#" class="addRecommend" recommendValue ="'+reply.recommend+'"><i class="icon md-arrow-up"></i>추천&nbsp;'
						 	+'<span>'+reply.recommend+'</span></a>'
						 	+'<a href="#" linkvalue = "'+reply.replyno+'" class="showRereply"><i class="icon md-back"></i>REPLY</a>'
						 	+'</div></div></div>'
						 	+'<div class ="rereplyArea">'
						 	+'<div id="'+reply.replyno+'" style="display:none; background-color: white;" class = "innerrereplyArea">'
						 	+'<div class ="ininnerrereplyArea">'
						 	+'<s:iterator value="rereplyList">'
						 	+'<p><span><s:property value="id"/></span>'
						 	+'&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;'
						 	+'<s:property value="content"/>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;'
						 	+'<a href ="#">x</a></p><br/></s:iterator>'
						 	+'<input type="text" style="width: 700px;" class="insertRereplyText">'
						 	+'&nbsp;&nbsp;<input type="button" value="덧글작성" class="mc-btn-9">'
						 	+'</div></div></div>'
						 	).appendTo(".list-discussion");
						});
					}
					, error : function(response){
						console.log('실패');
					}
			});
			
		});
		
		$('body').on('click', '#removeModal', function(){
			$('#insertReply').modal('hide');
		});
		
		$("body").on('click', '.showRereply', function(){ // 대댓글 보기
			var temp = $(this).attr('linkvalue');
			//$("#"+temp).css('display', 'block');
			$("#"+temp).slideToggle(300);
			$("#"+temp).focus();
		});
		
		$("body").on('click', '.mc-btn-9', function(){ // 대댓글 달기
			var replyno = $(this).parent().parent().first().attr('id');
			var content = $(this).prev().val();
			var questionno = "${question.questionno}";
			var receiverid = "${question.id}";
			
			$.ajax({
				type: 'GET'
				, url: 'insertRereply'
				, data : 'replyno='+replyno+'&rereply.replyno='+replyno+'&rereply.content='+content+
				'&notification.questionno='+questionno+'&notification.receiverid='+receiverid
				, dataType : 'json'
				, success : function(response){
					var list = response.rereplyList;
					$("#"+replyno).html('');
					list.forEach(function(rereply){
						$('<p>'+rereply.id+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+rereply.content+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+'<a href ="#">x</a>'+'</p><br/>').appendTo("#"+replyno);
					});
					
					$('<input type="text" style="width: 700px;" class="insertRereplyText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="덧글작성" class="mc-btn-9">').appendTo("#"+replyno);
				}
			});
		});
		
		
		$(".mc-btn-10").on('click', function(){
			var curious = "${question.curious}";
			var questionno = "${question.questionno}";
			$.ajax({
				type: 'GET'
				, url: 'addCurious'
				, data : 'question.curious='+curious+'&question.questionno='+questionno
				, dataType : 'json'
				, success : function(response){
					$('#temporaryModal > p').text('궁금도를 올렸습니다.');
	  			    $('#modalNotification').trigger('click');
					$("#curiousDiv p").text(response.curious);
				}
				, error : function(response){
					var url = '../member/loginFrom.action';    
					$(location).attr('href',url);
				}
			});
		});
		
		$('body').on('click', '.addRecommend', function(){
			var replyno = $(this).attr('recommendValue');
			var recommend = $(this).parent().find('span');
			var recommendValue = recommend.text();
			var questionno = "${question.questionno}";
			var tempScrollTop = $(window).scrollTop();
			$.ajax({
				type: 'GET'
				, url: 'addRecommend'
				, data : 'reply.replyno='+replyno+'&reply.recommend='+recommendValue+'&questionno='+questionno
				, dataType : 'json'
				, success : function(response){
						$('#temporaryModal > p').text('추천도를 올렸습니다.');
	  			    	$('#modalNotification').trigger('click');
						console.log('성공');
						$(window).scrollTop(tempScrollTop);
						var list = response.replyList;
						$('.list-discussion').html('');
						list.forEach(function(reply){
							
						var divTag = $('<li><div class="list-body"></div></li>');
					 	divTag.html('<div class="answer_bg"><div class="avatar-acount"><cite class="xsm black bold">ID&nbsp;&nbsp;&nbsp;&nbsp;'+reply.id
					 	+'</cite><h4 class="md black">'+reply.content+'</h4><div class="comment-meta">'
					 	+'<a href="#">'+reply.regdate+'</a>'
					 	+'<a href="#" class="addRecommend" recommendValue ="'+reply.replyno+'"><i class="icon md-arrow-up"></i>추천&nbsp;'
					 	+'<span>'+reply.recommend+'</span></a>'
					 	+'<a href="#" linkvalue = "'+reply.replyno+'" class="showRereply"><i class="icon md-back"></i>REPLY</a>'
					 	+'</div></div></div>'
					 	+'<div class ="rereplyArea">'
					 	+'<div id="'+reply.replyno+'" style="display:none; background-color: white;" class = "innerrereplyArea">'
					 	+'<div class ="ininnerrereplyArea">'
					 	+'<s:iterator value="rereplyList">'
					 	+'<p><span><s:property value="id"/></span>'
					 	+'&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;'
					 	+'<s:property value="content"/>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;'
					 	+'<a href ="#">x</a></p><br/></s:iterator>'
					 	+'<input type="text" style="width: 700px;" class="insertRereplyText">'
					 	+'&nbsp;&nbsp;<input type="button" value="덧글작성" class="mc-btn-9">'
					 	+'</div></div></div>'
					 	).appendTo(".list-discussion");
					});
				}
				, error : function(response){
					var url = '../member/loginFrom.action';    
					$(location).attr('href',url);
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
	<script src="../resources/checkMessage.js"></script>
</body>
</html>