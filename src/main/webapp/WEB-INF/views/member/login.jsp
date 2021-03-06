<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
    <title>로그인</title>
    
<script type="text/javascript">

function loginForm(){
	var form = document.getElementById("loginForm");
	var id= document.getElementById("id").value;
	var password= document.getElementById("password").value;
	
	var reid = id.replace(/^[\s\u00a0]+|[\s\u00a0]+$/g, '');
	var repassword = password.replace(/^[\s\u00a0]+|[\s\u00a0]+$/g, '');
	
	if((reid.length == 0) || (reid == null)){
		document.getElementById("modalNotification").click();
		document.getElementById("modalText").innerHTML = "아이디를 입력하세요";
		return;
	}else{
		if((repassword.length == 0) || (repassword == null)){
			document.getElementById("modalNotification").click();
			document.getElementById("modalText").innerHTML = "비밀번호를 입력하세요";
			return;
		}else{
			form.submit();		
		}
	}
	
}

function joinForm() {
	location.href = "joinForm.action";
}
</script>
    
    
</head>
<body>
<%@include file="/resources/header2.jsp" %>
		
		<section id="login-content" class="login-content">
        <div class="awe-parallax bg-login-content"></div>
        <div class="awe-overlay"></div>
        <div class="container">
        
        <div id="mid-login" class="mid-login">
        <div class="form-login">
                        <form action="login.action" theme="simple" method="post" id="loginForm">
                            <h2 class="text-uppercase">LOG IN</h2>
                            <div class="form-email">
                                <input type="text" placeholder="Id" name="id" id="id">
                            </div>
                            <div class="form-password">
                                <input type="password" placeholder="Password" name="password" id="password">
                            </div>
                            <div></div>
                            <div class="form-check">
                                <a href="#">Forget ID / PASSWORD?</a>
                            </div>
                            <div class="form-submit-1">
                                <input type="button" value="Log In" class="mc-btn btn-style-1" onclick="javascript:loginForm()">
                            </div>
                            <div class="link">
                                <!-- <a href="/javatree/joinFrom.action"> -->
                                 <a href="joinForm.action">
                                    <i class="icon md-arrow-right"></i>JOIN US
                                </a>
                            </div>
                        </form>
        </div>
        </div>
        </div>
        </section>

<div class="container">
  <button type="button" style="display:none;" id = "modalNotification" data-toggle="modal" data-target="#myModal"></button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="margin-top:100%;">
        <div class="modal-body">
          <p id="modalText"></p>
        </div>
         <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
    </div>
  </div>
</div>
	
<%@include file="/resources/footer.jsp" %>
    
	<!-- Load jQuery -->
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/scripts.js"></script>

<s:if test="message != null">
  		<script type="text/javascript">
   		var result = "${message}";
   		$("#modalNotification").trigger('click');
		$('.modal-body > p').html(result);
	</script>
 </s:if>

</body>
</html>