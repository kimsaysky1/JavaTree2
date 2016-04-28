<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
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
</head>
<body>
<div class="popwrap">

<h2>ID중복확인</h2>
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
</body>
</html>