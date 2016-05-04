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
<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../resources/javatree_view/html/js/scripts.js"></script>
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>ID/PWD Check</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript">
function idCheck() {
	var id = document.getElementById("id");
	
	if(id.value.length < 3 || id.value.length > 15) {
		alert("아이디는 3~15자리 입니다.");
		return false;
	} else {
		location.href = 'idCheck.action?id='+id.value;	
	} 
	
	
}
function selectId(id) {
	opener.document.getElementById("id").value = id;
	this.close();
}
</script>
<style type="text/css">

.popwrap h3 {  width:100%; height:70px; background:#14548E;  text-align:center;  margin-bottom:25px; padding-top:20px; color:#fff;}
.popwrap span {font-weight:700; font-size:15px; color:#14548E;}
.popwrap p.list_btn {margin-top:30px; padding-left: 76px;}
.popwrap p.list_btn a {padding:10px 20px; margin:0 3px; border:2px solid #eee; border-radius:20px;}
.popwrap p.list_btn a:hover, .popwrap p.list_btn a.select {border:2px solid #14548E; background:#14548E; color:#fff; font-weight:700;}
.innerpopwrap{padding-left: 85px;}
.wr_idcheck {border:2px solid #eee; height:30px; width:120px; border-radius:20px; padding-left:10px;}

</style>
</head>
<body>
<div class="popwrap">

<h3>ID중복확인</h3>
<div class="innerpopwrap"> 
<s:if test="duplicated != null">
	<s:if test="%{duplicated}">
		<div style="display:;">
			[<span><s:property value="id" /></span>] 아이디는 사용가능합니다.
			<p class="list_btn">
			<a href="javascript:selectId('<s:property value="id" />');">적용</a>
			</p>
		</div>
	</s:if>
	
	<s:else>
	
	<div style="display:;">
		[<span><s:property value="id" /></span>] 아이디는 이미 사용중입니다.
		<p class="list_btn">
		<s:textfield class="wr_idcheck" id="id" name="id"/><a href="javascript:idCheck();">중복확인</a>
		</p>
	</div>
	</s:else>
</s:if>	
</div>
</div>


	<!-- Load jQuery -->
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	
</body>
</html>