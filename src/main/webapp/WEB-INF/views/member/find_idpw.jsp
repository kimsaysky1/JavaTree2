<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript">

	window.onload = function search() {
		var searchResult = document.getElementById("searchResult").value;
		document.getElementById("idname").value = "";
		document.getElementById("idemail").value = "";
		document.getElementById("custid").value = "";
		document.getElementById("pwdname").value = "";
		document.getElementById("pwdemail").value = "";
		
		if(searchResult != "")
			alert(searchResult);
	}
	
	function findIdClick(){
		var pwdul = document.getElementById("findPwd");
		var idul = document.getElementById("findId");
		pwdul.setAttribute('style', 'display:none;');
		idul.setAttribute('style', 'display:;');
	}
	
	function findPwdClick() {
		var pwdul = document.getElementById("findPwd");
		var idul = document.getElementById("findId");
		
		idul.setAttribute('style', 'display:none;');
		pwdul.setAttribute('style', 'display:;');
	}

	
	function findId() {
		var form = document.getElementById("findidForm");
		var idname = document.getElementById("idname");
		var idemail = document.getElementById("idemail");
		
		if(idname.value == "") {
			idname.setAttribute('placeholder', '이름을 입력해주세요.');
			return false;
		} else if (idemail.value == "") {
			idemail.setAttribute('placeholder', '이메일을 입력해주세요.');
			return false;
		} else {
			form.submit();
		}
	}
	
	function findPwd() {
		var form = document.getElementById("findpwForm");
		var custid = document.getElementById("custid");
		var pwdname = document.getElementById("pwdname");
		var pwdemail = document.getElementById("pwdemail");
		
		if(custid.value=="") {
			custid.setAttribute('placeholder', '아이디을 입력해주세요.');
			return false;
		} else if(pwdname.value == "") {
			pwdname.setAttribute('placeholder', '이름을 입력해주세요.');
			return false;
		} else if (pwdemail.value == "") {
			pwdemail.setAttribute('placeholder', '이메일을 입력해주세요.');
			return false;
		} else {
			form.submit();
		}
	}
</script>
</head>
<body>
<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
			<s:if test="%{#session.userId != null}">
				<a href="/SEBank/customer/updateForm.action">회원정보수정</a><a href="/SEBank/customer/logout.action">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</s:if>
			<s:else>
				<a href="/SEBank/customer/loginFrom.action">로그인</a><a href="/SEBank/customer/joinForm.action">회원가입</a>&nbsp;&nbsp;&nbsp;
			</s:else>
			</div>
			<div id="navi">
			<a href="main.action"><img src="../images/logo.png" width="150" /></a>
			 <div class="gnb"><!-- 네비게이션 -->
     
				 <ul>
					<li><a href="/SEBank/account/accountList.action">보유계좌현황</a>
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
					</li>

					<li><a href="/SEBank/account/addaccount1Form.action">신규계좌개설</a>
						<ul>
						   <li><a href="/SEBank/account/addaccount1Form.action">예금계좌</a></li>
						   <li><a href="/SEBank/account/addaccount2Form.action">적금계좌</a></li>
						   <li><a href="/SEBank/account/addaccount3Form.action">대출계좌</a></li>
						</ul>
					</li>
					<li><a href="/SEBank/board/board_listForm.action?currentPage=1">고객문의게시판</a>
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
					</li>
				</ul>
			</div>
			</div>
			
		</div>



		<div id="contents"><!--내용-->
			<h1>고객센터<span>아이디, 패스워드 찾기</span></h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="../images/login_icon.png" class="login_icon" />
				<s:form theme="simple" method="post" id="findidForm" action="searchCustomer">

					<ul style="display:;" id="findId"><!-- 아이디찾기 -->
						<li class=""><img src="../images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li><a href="javascript:findIdClick();" class="findtitle_btn tab">아이디 찾기</a>&nbsp;<a href="javascript:findPwdClick();" class="findtitle_btn">패스워드 찾기</a></li>
						<li><s:textfield placeholder="이름" class="login_write" name="customer.name" id="idname"/></li>
						<li><s:textfield placeholder="이메일주소@도메인" class="login_write" name="customer.email" id="idemail"/></li>
						<li><a href="javascript:findId();" class="btn_idfind">아이디 확인</a></li>
					</ul>
				</s:form>
				<s:form theme="simple" method="post" id="findpwForm" action="searchCustomer">
					<ul style="display:none;" id="findPwd"><!-- 비밀번호찾기 -->
						<li class=""><img src="../images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li><a href="javascript:findIdClick();" class="findtitle_btn">아이디 찾기</a>&nbsp;<a href="javascript:findPwdClick();" class="findtitle_btn tab"> 패스워드 찾기</a></li>
						<li><s:textfield placeholder="아이디" class="login_write" name="customer.custid" id="custid"/></li>
						<li><s:textfield placeholder="이름" class="login_write" name="customer.name" id="pwdname"/></li>
						<li><s:textfield placeholder="이메일주소@도메인" class="login_write" name="customer.email" id="pwdemail"/></li>
						<li><a href="javascript:findPwd();" class="btn_idfind">비밀번호 찾기</a></li>
					</ul>
				</s:form>
				<s:hidden name="searchResult" value="%{searchResult}" id="searchResult"/>
			</div>


		</div>



		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



	</div>

</body>
</html>