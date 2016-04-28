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
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/style.css">
<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
		src="../resources/javatree_view/html/js/scripts.js"></script>
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>회원가입</title>

<style type="text/css">
#join_self_css{
	display: none; 
}
#join_interest_css{
	display: none;
}
</style> 


		
<script type="text/javascript">
var idck=0;
function idCheck() { 
	
	var id = document.getElementById("id");

	if(id.value == "") {
		id.setAttribute("placeholder", "아이디를 입력해주세요!");
		return false;
	} else if(id.value.length < 3 || id.value.length > 15) {
		alert("아이디는 3~15자리 입니다.");
		return false;
	} else {
		idck=1;
		window.open('idCheck.action?id='+id.value,'pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180');	
	}	
}


$(function(){
	
	$('#join_nextstep').click(function(){
		var cssid = $(this).attr("id");
		if(cssid == 'join_nextstep'){
			$('#join_self_css').css('display','block');
		}
		
	});
	
	$('#join_nextstep2').click(function(){
		
		var cssid = $(this).attr("id");
		
		if(cssid == 'join_nextstep2'){
			$('#join_interest_css').css('display','block');
		}
		
	});
	
	$('#submit_btn').click(function(){
		
		alert("조인 폼 시작 ! ");
		
		var form = document.getElementById("join");
		var id= document.getElementById("id");
		var password= document.getElementById("password");
		var username= document.getElementById("username");
		var email= document.getElementById("email");
		
		alert(id+password+username+email);
		
		if(idck == 0){
				custid.value="";
				//custid.setAttribute("placeholder", "아이디 중복확인 필수!");
				alert("아이디 중복확인 필수!");
				return false;
			
		}
		
		if(password.value =="") {
			password.setAttribute('placeholder', '비밀번호를 입력하세요!');
			return false;
		} else if(password.value.length <3 || password.value.length > 15) {
			alert("비밀번호는 3~15자리 입니다.");
			return false;
		} else if (username.value == ""){
			username.setAttribute('placeholder', '이름을 입력하세요!');
			return false;
		} else if (email.value == ""){
			email.setAttribute('placeholder', '이메일을 입력하세요!');
			return false;
		} 
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		  
		if(regex.test(email.value) === false) {  
		    alert("잘못된 이메일 형식입니다.");  
		    return false;  
		} 
		 
		 document.getElementById('joinForm').submit();
		
	});
		
});

</script>

<script type="text/javascript">
function idCheck() { 
	
	var id = document.getElementById("id");

	if(id.value == "") {
		id.setAttribute("placeholder", "아이디를 입력해주세요!");
		return false;
	} else if(id.value.length < 3 || id.value.length > 15) {
		alert("아이디는 3~15자리 입니다.");
		return false;
	} else {
		idck=1;
		window.open('idCheck.action?id='+id.value,'pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180');	
	}	
}

</script>
>>>>>>> aa748f1e11e133ac6f1761f2f270fc7fa73e4270
</head>
<body>
	<%@include file="/resources/header.jsp" %>


	<section id="login-content" class="login-content">

	<div class="awe-parallax bg-login-content"></div>
	<div class="awe-overlay"></div>
	<div class="container">
	<div id="mid-join" class="mid-join">

	<form method="post" id="joinForm" name="joinForm" action="join">

		<!-- 로그인(1) -->
		<div class="form-login2" id = "join_login_css">
				<h2 class="text-uppercase">JOIN</h2>

				<div id="id-part">
					<div class="form-ID">
						<input type="text" placeholder="ID" id="id" name="id">
					</div>

					<div class="form-btn" align="right">
						<input type="button" value="Check" onclick="javascript:idCheck();">
					</div>
				</div>

				<div class="form-datebirth">
					<input type="text" placeholder="NAME" id="username" name="username">
				</div>
				<div class="form-password">
					<input type="password" placeholder="Password" id="password" name="password">
				</div>
				<div class="form-email">
					<input type="text" placeholder="Email" id="email" name="email">
				</div>

				<div class="form-submit-1" >
					<input type="button" id = "join_nextstep" value="Next Step" class="mc-btn btn-style-1">
				</div> 
			<!-- </form> -->
		</div>
		<!-- 로그인 (1) 끝 -->

		<!-- 흥미도(2) -->
		<div class="form-login3" id="join_self_css">
			<!--  <form method="post" id="join_self" name="join_self">  --><!-- action="join" -->
				<h2 class="text-uppercase">INTEREST</h2>

				<table height="500px" width="300px">
					<tr>
						<td align="center"><label>PURE JAVA</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_purejava.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_purejava.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_purejava.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>WEB</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_web.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_web.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_web.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>MOBILE</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_mobile.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_mobile.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_mobile.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>IOT</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_iot.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_iot.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_iot.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SWING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_swing.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_swing.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_swing.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>JDBC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_jdbc.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_jdbc.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_jdbc.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>API</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_api.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_api.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_api.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SPRING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_spring.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_spring.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"name="interest_spring.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>STRUTS</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_struts.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_struts.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_struts.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>etcFramework</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etcframework.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etcframework.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etcframework.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>ETC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etc.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etc.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etc.value" value="1"> <label>하</label>
						</td>
					</tr>
				</table>

				 <div class="form-submit-1" >
					<input type="button" id = "join_nextstep2" value="Next Step" class="mc-btn btn-style-1">
				</div> 

			<!-- </form> -->
		</div>
		<!-- 흥미도 (2) 끝 -->
		
		<!-- 자가진단(3) -->
		<div class="form-login3" id="join_interest_css">
	
				<h2 class="text-uppercase">SELF CHECK</h2>

				<table height="500px" width="300px">
					<tr>
						<td align="center"><label>PURE JAVA</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_purejava.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_purejava.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_purejava.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>WEB</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_web.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_web.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_web.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>MOBILE</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_mobile.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_mobile.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_mobile.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>IOT</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_iot.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_iot.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_iot.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SWING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_swing.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_swing.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_swing.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>JDBC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_jdbc.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_jdbc.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_jdbc.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>API</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_api.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_api.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_api.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SPRING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_spring.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_spring.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_spring.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>STRUTS</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_struts.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_struts.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_struts.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>etcFramework</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etcframework.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etcframework.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etcframework.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>ETC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etc.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etc.value" value="2" checked="checked"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_etc.value" value="3"> <label>하</label>
						</td>
					</tr>
				</table>

				<div class="form-submit-1">
					<input type="button" value="JOIN IN" class="mc-btn btn-style-1" id = "submit_btn">
				</div>
	
		</div>
		<!-- 자가진단 (3) 끝 -->
		</form>
		</div><!-- mid-join -->

	</div> <!-- container -->

	</section>

<%@include file="/resources/footer.jsp" %>
	
	<!-- Load jQuery -->
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
	
	
	

</body>
</html>