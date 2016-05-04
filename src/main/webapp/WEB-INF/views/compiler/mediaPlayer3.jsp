<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../resources/jquery-ui.min.js"></script>

<style type="text/css">
.viewtitle {
	width: 100%;
	height: 70px;
	background: #14548E;
}

.viewpart{

	background-color: #eee;
}

.popwrap h3 {
	margin-bottom: 25px;
	padding-top: 20px;
}

.playerpart {
	width: 920px;
	float: left;
	padding: 20px;
	background-color: #eee;
}

.codingpart {
	width: 800px;
	float: right;
	padding: 20px;
	background-color: #eee;
}

.showresult {
	margin-top: 20px;
	border: 1px solid #EAEAEA;
}

video {
	pointer-events: none;
	margin: 5px;
}

.tab{
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif, AppleGothic;
font-size: 14px;
font-weight: 600;
margin-left: 6px; 
}

#vol-div {
	float: right;
	margin-left: 10px;
	margin-top: 15px;
	width: 100px;
}

.slider-width100 {
	/* transform: rotate(270deg); //수직 bar */
	width: 80px; ! important;
	float: right;
	display: inline-block;
	margin-right: 0px;
	padding: 0px;
	top: 0px;
	box-sizing: content-box;
	-moz-box-sizing: content-box;
	background: transparent;
	outline: 0;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	white-space: nowrap;
	/* background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%); */
}

#now {
	/* float: left; */
	margin: 12px;
	margin-top: -12px;
	vertical-align: middle;
}

#seek-bar {
	/*required for proper track sizing in FF*/
	width: 725px; ! important;
	display: inline-block;
	margin: 0px;
	padding: 0px;
	box-sizing: content-box;
	-moz-box-sizing: content-box;
	background: transparent;
	outline: 0;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	white-space: nowrap;
	position: relative;
	margin-left: 52px;
	border: 0;
	bottom: 0;
	float: left;
	/*removes default webkit styles*/
	-webkit-appearance: none;
	/*fix for FF unable to apply focus style bug */
	border: 2px solid white;
	/*  margin: 8px; */
}

#seek-bar::-webkit-slider-runnable-track {
	width: 800px;
	height: 11px;
	background: #ddd;
	border: none;
	border-radius: 8px;
}

#seek-bar::-webkit-slider-thumb {
	-webkit-appearance: none;
	border: none;
	height: 20px;
	width: 20px;
	border-radius: 50%;
	background-color: #f6f6f6;
	background: goldenrod;
	margin-top: -6px;
	cursor: pointer;
}

#player {
	/*  background: #fff;  linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%); */
	background: linear-gradient(to bottom, #EAEAEA 40%, #f6f6f6 100%);
	/* background-color: #000; */
	overflow: hidden;
	position: relative;
	display: inline-block;
	width: 900px;
	height: 620px;
	float: left;
	outline: 0;
}

#video-controls {
	position: relative;
	bottom: 0;
	left: 0;
	right: 0;
	top: 0;
	padding: 0px;
	margin: 0px;
	border: 0;
	/* background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%); */
	display: inline-block;
	white-space: nowrap;
	margin-top: -25px;
	margin-left: 52px;
}

#editor {
	margin: 5px;
	float: left;
}

button {
	display: inline-block;
	margin: 5px 0;
	border-radius: .25em;
	box-sizing: content-box;
	-moz-box-sizing: content-box;
	background: transparent;
	outline: 0;
	vertical-align: middle;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif, AppleGothic;
	font-size: 16px;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	height: 35px;
	padding: 0 1em;
	font-weight: 600;
	line-height: 20px;
	top: 0px;
	position: relative;
}

button {
	font-family: 돋움, dotum, 굴림, gulim, sans-serif;
}

button {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.re {
	font-family: 돋움, dotum, 굴림, gulim, sans-serif;
	font-weight: bolder;
}
/* 일반적인 버튼의 상황 */
button, button:link, button:visited {
	/* color: #666; */
	border: 1px solid #ebebeb;
/* 	border-bottom-color: #c6c6c6;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.04); */
	background: #fff;
	/* background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%); */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff',
		endColorstr='#f6f6f6', GradientType=0); /*IE*/
}

/* 마우스오버 */
button:focus, button:hover {
	background: #f4f4f4;
	background: linear-gradient(to bottom, #fafafa 0%, #fff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fafafa',
		endColorstr='#ffffff', GradientType=0); /*IE*/
}

/* 눌려졌거나 선택 된 상황 */
button:active, button.active {
	text-shadow: 0 1px 0px #fff;
	border-color: #ebebeb;
	border-top-color: #ddd;
	background: #f4f4f4;
	box-shadow: none
}

select {
	position: relative;
	display: inline-block;
	margin: 5px 0;
	border-radius: .25em;
	box-sizing: content-box;
	-moz-box-sizing: content-box;
	background: transparent;
	outline: 0;
	vertical-align: middle;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif, AppleGothic;
	font-size: 16px;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	height: 35px;
	padding: 0 1em;
	font-weight: 600;
	line-height: 20px;
	background: #fff;
	border: 1px solid #ebebeb;
	/* border:gray; border-right:0.5px; border-top:0.5px; boder-left:0.5px; boder-bottom:0.5px; */
}

@font-face {
	font-family: ng;
	src: url(NanumGothic.eot);
	src: local(※), url(NanumGothic.woff) format(‘woff’)
}

body {
	font-family: 나눔고딕, NanumGothic, ng;

}

.pl {
	font-weight: bold;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif, AppleGothic;
}

#tabs {
	margin: 0;
	padding: 0;
	list-style: none;
	overflow: hidden;
}

#tabs li {
	float: left;
	display: block;
	padding: 5px;
	background-color: #bbb;
	margin-right: 5px;
}

#tabs li a {
	color: #fff;
	text-decoration: none;
}

#tabs li.current {
	background-color: #14548E;
}

#tabs li.current a {
	color: #fff;
	text-decoration: none;
}

#tabs li a.remove {
	color: #f00;
	margin-left: 10px;
}

#codingwrapper {
	float: left;
	margin: 0 20px 0 0;
}

#documents {
	margin: 0;
	padding: 0;
}

#codingwrapper {
	width: 800px;
	height: 550px;
	margin-top: 5px;
}

.editor {
	float: left;
	width: 725px;
	overflow: scroll;
}

#question{
border: 1px solid #EAEAEA;
}

.line_number {
	float: left;
	padding-right: 14px;
	margin-top: 37px;
	width: 31px;
	font: 14px Arial;
	line-height: normal;
	text-align: right;
	height: 514px;
	overflow: scroll;
	overflow-y: hidden;
	font-weight: 600;
}

div.numberedtextarea-wrapper {
	position: relative;
}

div.numberedtextarea-wrapper textarea {
	display: block;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

div.numberedtextarea-line-numbers {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 50px;
	border-right: 1px solid rgba(0, 0, 0, 0.15);
	color: rgba(0, 0, 0, 0.15);
	overflow: hidden;
}

div.numberedtextarea-number {
	padding-right: 6px;
	text-align: right;
}
}
</style>

<title>플레이어</title>
</head>
<body>

	<div class="popwrap">
		<div class="viewtitle">
			<img src="../resources/javatree_view/html/images/logo.png" alt="" width="180px;" style="margin-left: 20px;" />
		</div>
		<div class="viewpart" >
		<div class="playerpart">
			<div id="player">

				<video width="900" height="500" id="video" autoplay="autoplay">
					<source src='../resources/upload/<s:property value="id"/>/<s:property value="uploadedfilename"/>' type="video/mp4" />
				</video>

				<div id="seek">
					<input type="range" class="time-slider" id="seek-bar" value="0"
						step="any" max="100" min="0" step="any" /> <span id="now"></span>
				</div>
				<br />
				<div id="video-controls">

					<br />
					<button title="Stop" class="pl">＝</button>
					<button title="Rewind button" class="rew">&lt;&lt;</button>
					<button title="Forward button" class="fwd">&gt;&gt;</button>
					<button title="restart" class="re">■</button>
					<button title="CodingMode" class="cod">코딩</button>
					<button title="WatchingMode" class="wat">강의</button>


					<select id='speed' name="sel" onchange="javascript:selectEvent(this)">
						<option value='1.0' selected>1.0</option>
						<option value='1.2'>1.2</option>
						<option value='1.4'>1.4</option>
						<option value='1.6'>1.6</option>
						<option value='1.8'>1.8</option>
						<option value='2.0'>2.0</option>
					</select> 
					<select class='chap' name="sel" onchange="javascript:selectChapter(this)">
						<option selected>B</option>
						<s:if test="chapterList.size != 0">
							<s:iterator value="chapterList">
							<option value='<s:property value="chaptertime"/>'><s:property value="chaptername"/></option>
							</s:iterator>
						</s:if>
					</select>

					<div id="vol-div">
						<input id="vol-control" class="slider-width100" type="range"
							max="100" min="0" step="any" oninput="SetVolume(this.value)"
							onchange="SetVolume(this.value)"></input>
					</div>
				</div>
			</div>
			<!-- video END  -->

			<div class="codingresult">
				<textarea placeholder="결과" id="result" class="showresult" readonly="readonly" style="width: 900px; height: 180px;"></textarea>
			</div>

		</div>
		<!-- playpart end -->


		<div class="codingpart">

			<div class = "codingboxList">
				<s:if test="codingList != null">
					<select class="codingList">
						<option>문제선택</option>
						<s:iterator value="codingList" status="incr">
							<option value="<s:property value="codingno"/>">
								<s:property value="%{#incr.index+1}" />번 문제
							</option>
						</s:iterator>
					</select>
				</s:if>
				
				<button id = "goCodingbox">문제 보관하기</button> 
			</div>
					
			<!-- editor 시작 -->
			<textarea id="question" class = "question" placeholder="질문란" readonly="readonly" style="height: 170px; width: 756px;"></textarea>
			
			<div class = "buttonpart" style="margin-left: 483px;">
				<button id="insertClass">클래스 추가</button>
				<button id="initialization">초기화</button>
				<button id="run">실행</button>
			</div>
			
			<div id="codingwrapper">
				<div class="line_number">
				</div>
				<ul id="tabs">
					<li class='current'><a class='tab' id="class1" href='#'>class1</a><a href='#' class='remove'>x</a>
					</li>
				</ul>
				<div id="doccontent">
					<textarea id="class1_content" class="editor" style="height: 514px;"></textarea>
				</div>
			</div>
			
			
		<!-- 지식인 연동 모달 -->
	<input style="display:none;" type="button" id="askToUser" class="mc-btn btn-style-1" data-toggle="modal" data-target="#askSelections"/>
           <div class="container">
				<div class="modal fade" id="askSelections" role="dialog">
			    	<div class="modal-dialog modal-lg">
					      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <h4 class="modal-title">지식인 연동 기능</h4>
				        </div>
				        <div class="modal-body">
				        		<button id = "watchRelatedQuestion">관련질문보기</button>
					        	<br/>
					        	<button id = "makeQuestion">질문하기</button>
					        	<br/>
					        	<button class ="cancel">취소</button>
				        </div>
				        <div class="modal-footer">
				        </div>
				      </div>
			  	   </div>
			  </div>
         </div>	
         <!-- 지식인 연동 모달 끝 -->

			<!-- 질문 버튼 -->
        <div class="form-submit-1">
			<input type="button" style="display:none;" id="insertQuestionModal" value="WRITE QUESTION" class="mc-btn btn-style-1" data-toggle="modal" data-target="#writeQuestion"/>
            <div class="container">
			<div class="modal fade" id="writeQuestion" role="dialog">
	  		</div>
            </div>
		</div>            
		</div>
	</div>
	</div>
	
	<!-- popwrap END -->
		<script type="text/javascript"
			src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
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

<script type="text/javascript">

$(function(){
	for (i = 1; i <= 40; i++) {
		$('<div>'+i+'</div>').appendTo(".line_number");
	}
	 
	$('#insertQuestionModal').on('click', function(){
		var str = '';
		str += '<div class="modal-dialog modal-lg">'
		str += '<div class="modal-content">';
		str += '<div class="modal-header">';
		str += '<button type="button" class="close" data-dismiss="modal">&times;</button>';
		str += '<h4 class="modal-title">Modal Header</h4>';
		str += '</div>';
		str += '<div class="modal-body">';
		str += '<table style=\'width: 800px;\'>';
		str += '<tr><td style=\'width: 100px; height: 70px; text-align:center;\'><b>FIELD</b></td>';
		str += '<td><select id="questionTypeno" style="width: 100px;">';
		str +='<option value="1">PUREJAVA</option>';
		str +='<option value="2">WEB</option>';
		str +='<option value="3">MOBILE</option>';
		str +='<option value="4">IOT</option>';
		str +='<option value="5">SWING</option>';
		str +='<option value="6">JDBC</option>';
		str +='<option value="7">API</option>';
		str +='<option value="8">SPRING</option>';
		str +='<option value="9">STRUTS</option>';
		str += '<option value="10">etcFramework</option>';
		str += '<option value="11">ETC</option>';
		str += '</select></td></tr>';
		str += '<tr><td style=\'height: 20px;\'></td></tr>';
		str += '<tr><td style=\'width: 100px; text-align:center;\'><b>QUESTION</b></td>';
		str += '<td><textarea id="questionTitle" style="height: 100px;"></textarea></td></tr>';
		str += '<tr><td style=\'height: 20px;\'></td></tr>';
		str += '<tr><td style=\'width: 100px; text-align:center;\'><b>content</b></td>';
		str += '<td><textarea id="questionContent" style="height: 250px;"></textarea></td></tr>';
		str += '<tr><td style=\'height: 20px;\'></td></tr></table></div>';
		str += '<div class="modal-footer">';
		str += '<input type="button" value="등록" id = "insertQuestionBtn" class="mc-btn-5">&nbsp;&nbsp;&nbsp;';
		str += '<input type="button" value="취소" class="cancel"></div></div></div>';
		
		$('#writeQuestion').html(str);
	});
	
	 $("#goCodingbox").on("click", function(){
	      var codingno =  $(".codingList option:selected").val();
	      var mycode = $('#doccontent > textarea:visible').val();
	      $.ajax({
	         url : '/javatree/course/insertcodinginbox.action',
	         data : {'codingno' : codingno , 'mycode':mycode},
	         success : function(response){
	         },
	         error:function(){
	         }
	      });
	   });
	 
		$('#watchRelatedQuestion').on('click', function(){
			var codingno =  $(".codingList option:selected").val();
			window.open('/javatree/qna/watchRelatedQuestion.action?codingno='+codingno);
		});
		
		$('#makeQuestion').on('click', function(){
			var codingtemplet = $('#doccontent textarea:visible').val();
			$('#askSelections').modal('hide');
			$('#insertQuestionModal').trigger('click');
			$('#questionContent').val(codingtemplet);
			//window.open('/javatree/qna/insertQuestionReady.action?codingtemplet='+codingtemplet);
		});
		
		$('body').on('click', '#insertQuestionBtn', function(){
			/* window.open('/javatree/qna/insertQuestionReady.action?question.content='+content
					+'&question.title='+title+'&question.typeno='+typeno); */
			var typeno = $("#questionTypeno option:selected").val();
			var title = $("#questionTitle").val();
			var content = $("#questionContent").val();
			var codingno =  $(".codingList option:selected").val();
			$.ajax({
				type: 'POST'
				, url: '/javatree/qna/insertQuestionByModal.action'
				, data: 'question.content=<pre>'+content+'</pre>&question.title='+title+'&question.typeno='+typeno
						+'&question.codingno='+codingno	
				, success : function(response){
					$('#writeQuestion').modal('hide');
				}
				, error : function(response){
					$('#writeQuestion').modal('hide');
				}
			})
		});
		
		$('body').on('click','.cancel',function(){
			$('#writeQuestion').modal('hide');
		});
		 
	
	$('body').on('input propertychange scroll change keyup paste','#doccontent > textarea:visible', function (key) {
        	var textarea = $(this);
        	var width = parseFloat(textarea.css('width'));
        	var height = parseFloat(textarea.css('height'));
        	var lineHeight = parseFloat(textarea.css('line-height'));
        	var textAreaValue = $('#doccontent textarea:visible').val();
        	var splitedArray = textAreaValue.split('\n');
        	var splitedArrayLength = splitedArray.length;
        	$('.line_number').html('');
        	if(splitedArrayLength <= 40){
	        	for(var i = 1; i <= splitedArrayLength; i++){
		        	$('<div>'+i+'</div>').appendTo('.line_number');
	        	}
        	}else{
        		for (i = 1; i <= 40; i++) {
        			$('<div>'+i+'</div>').appendTo(".line_number");
        		}
        	}
        	$(".line_number").scrollTop(textarea.scrollTop());
    });
	
	$('#doccontent > textarea:visible').scroll(function () {
		var lines = $(".line_number");
		lines.scrollTop($(this).scrollTop());
	});
	
	$("#initialization").on("click", function(){
		var codingno =  $(".codingList option:selected").val();
		$.ajax({
			type: 'GET'
			, url: 'callSpecificCoding'
			, data: 'codingno='+codingno
			, dataType : 'json'
			, success : function(response){
				$('#doccontent > textarea:visible').val(response.coding.codingtemplet);
			}
			, error : function(response){
			}
		})
	}); 
	
	$(".codingList").change(function(){
		var codingno =  $(".codingList option:selected").val();
		$.ajax({
			type: 'GET'
			, url: 'callSpecificCoding'
			, data: 'codingno='+codingno
			, dataType : 'json'
			, success : function(response){
				$('#doccontent > textarea:visible').val(response.coding.codingtemplet);
				$("#question").val(response.coding.codingquestion);
			}
			, error : function(response){
			}
		})
	});	
	
	/* $(document).on('keyUp', function ( e ) {
	if(e.ctrlKey && ( String.fromCharCode(e.which).toLowerCase() === 'd')){
		e.preventDefault();
		alert(1);
    }
	}); */
	
	$(document).on('keydown', function ( e ) {
	    if ( e.ctrlKey && e.keyCode === 32 ) {
	    	var textAreaValue = $('#doccontent textarea:visible').val();
	    	var splitedValue = textAreaValue.split(/\t/);
	    	var temp = splitedValue[splitedValue.length];
	    	if(temp == 'sysout'){
	    		splitedValue[splitedValue.length] = 'sysout.result'; 
	    	}
	    }
	    
	    
	    if ( e.ctrlKey && ( String.fromCharCode(e.which).toLowerCase() === 'd') ) {
	    	//var val = $(".editor").val();
	    	//var a= $("#doccontent textarea").val();
	    	
	    	var textAreaValue = $('#doccontent textarea:visible').val();
	    	var splitedValue = textAreaValue.split('\n');
	    	var a = $('#doccontent textarea:visible').caret(position)
	    	
	    	
	    	//alert($("#doccontent #class1_content").selectionEnd);
	    	/*alert(val);
	    	var number = val.substr(0, $(".editor").selectionStart).split("\n").length;
	    	alert(number); */
	    }
	});
	
	/* function setSelectionRange(input, selectionStart, selectionEnd) {
		  if (input.setSelectionRange) {
		    input.focus();
		    input.setSelectionRange(selectionStart, selectionEnd);
		  }
		  else if (input.createTextRange) {
		    var range = input.createTextRange();
		    range.collapse(true);
		    range.moveEnd('character', selectionEnd);
		    range.moveStart('character', selectionStart);
		    range.select();
		  }
		}

		function setCaretToPos (input, pos) {
		  setSelectionRange(input, pos, pos);
		} */
	
	$("#doccontent").on('keydown', '.editor', function(e) {
	    if(e.keyCode === 9) { 
	        var start = this.selectionStart;
	        var end = this.selectionEnd;
	        var $this = $(this);
	        var value = $this.val();
	        $this.val(value.substring(0, start)
	                    + "\t"
	                    + value.substring(end));
	        this.selectionStart = this.selectionEnd = start + 1;
	        e.preventDefault();
	    }
	});
	
	$("#run").on("click", function(){
		$('pre').each(function(){
		    $(this.firstChild).unwrap();
		});
		var classnum =  $('body a.tab').length;
		var code1 = $("#doccontent .editor").eq(0).val();
		var code2 = $("#doccontent .editor").eq(1).val();
		var code3 = $("#doccontent .editor").eq(2).val();
		var code4 = $("#doccontent .editor").eq(3).val();
		var code5 = $("#doccontent .editor").eq(4).val();
		
		if(code1.trim().length == 0){
			alert('코드가 써있지 않습니다.');
			return;
		};
		
		$("#result").val('처리중입니다.');
		$.ajax({
				 type: 'POST'
				, url: 'runCode'
				, data :
				{
					'code1' : code1
					,'code2' : code2
					,'code3' : code3
					,'code4' : code4
					,'code5' : code5
				}
				, dataType : 'json'
				, success : function(response){
					var type = response.resultType;
					var error = response.error;
					console.log(error);
					if(type == 'jsp'){
						window.open(response.result);
						$("#result").val('');
					}else{
						if(error){
							$("#askToUser").trigger('click');
						}else{
							$("#result").val(response.result);
						}
					}
				}
				, error : function(response){
					alert('실패');
				}
		});
	});	
	
    $('body').on('click','#tabs a.tab',function() {
        var contentname = $(this).attr("id") + "_content";
        $("#doccontent textarea").hide();
        $("#tabs li").removeClass("current");
        $("#" + contentname).show();
        $(this).parent().addClass("current"); 
        
        for (i = 1; i <= 40; i++) {
        	$(".line_number").html('');
    		$('<div>'+i+'</div>').appendTo(".line_number");
    	}
        var textarea = $('#doccontent textarea:visible');
    	var width = parseFloat(textarea.css('width'));
    	var height = parseFloat(textarea.css('height'));
    	var lineHeight = parseFloat(textarea.css('line-height'));
    	var textAreaValue = $('#doccontent textarea:visible').val();
    	var splitedArray = textAreaValue.split('\n');
    	var splitedArrayLength = splitedArray.length;
    	$('.line_number').html('');
    	if(splitedArrayLength <= 40){
        	for(var i = 1; i <= splitedArrayLength; i++){
	        	$('<div>'+i+'</div>').appendTo('.line_number');
        	}
    	}else{
    		for (i = 1; i <= 40; i++) {
    			$('<div>'+i+'</div>').appendTo(".line_number");
    		}
    	}
    	$(".line_number").scrollTop(textarea.scrollTop());
        
    });

   $('body').on('click', '#insertClass', function(){
	   var classnum =  $('body a.tab').length;
	   if(classnum < 5){
		   classnum = classnum + 1;
		   addTab(classnum);
	   }else{
		   return;
	   }
   });
   
   $('body').on('click', '#tabs a.remove', function() {
        var tabid = $(this).parent().find(".tab").attr("id");
        if(tabid == 'class1'){
        	alert('기본 클래스는 삭제할 수 없습니다.');
        	return;
        }
        var contentname = tabid + "_content";
        $("#" + contentname).remove();
        $(this).parent().remove();
        if ($("#tabs li.current").length == 0 && $("#tabs li").length > 0) {
            var firsttab = $("#tabs li:first-child");
            firsttab.addClass("current");
            var firsttabid = $(firsttab).find("a.tab").attr("id");
            $("#" + firsttabid + "_content").show();
        }
    }); 
});

function addTab(classnum) {
    $("#tabs li").removeClass("current");
    $("#doccontent textarea").hide();
    $("#tabs").append("<li class='current'><a class='tab' id='class" +
    		classnum + "' href='#'>" + ('class'+classnum) + 
        "</a><a href='#' class='remove'>x</a></li>");
    $("#doccontent").append("<textarea id=class"+classnum+"_content"+" class="+"editor style=\"height: 514px;\"></textarea>");t
    $("#" + $(link).attr("rel") + "_content").show();
}
</script>



<!-- editor 마침 -->
<script type="text/javascript">

//time slider click 버전 시작
//and load 시작
window.onload = function() {
	
	(function localFileVideoPlayer() {
		'use strict'
	  var URL = window.URL || window.webkitURL
	 /*  var displayMessage = function (message, isError) {
	    var element = document.querySelector('#message')
	    element.innerHTML = message
	    element.className = isError ? 'error' : 'info'
	  } */
	  
	  
	  var playSelectedFile = function (event) {
		
		var file = this.files[0]
	    var type = file.type
	    var videoNode = document.querySelector('#player video');
	    var canPlay = videoNode.canPlayType(type);
	  /*   if (canPlay === '') canPlay = 'no'
	    var message = 'Can play type "' + type + '": ' + canPlay
	    var isError = canPlay === 'no'
	    displayMessage(message, isError) */

	    /* if (isError) {
	      return
	    }
 */		
	    var fileURL = URL.createObjectURL(file)
	    videoNode.src = fileURL
	  }
	  var inputNode = document.querySelector('input')
	  inputNode.addEventListener('change', playSelectedFile, false)
	})()
	
	var video = document.querySelector('#player video');
	var seekBar = $("#seek-bar");
	var seekBarWrapper = $("#seek");
	var pl = $(".pl");
	seekBar.on('input', function() {
		var time = video.duration * (seekBar.val() / 100);
		video.currentTime = time;
		
		
		
	});
	seekBarWrapper.mousedown(function() {
		video.pause();
		
	});
	seekBarWrapper.mouseup(function() {
		video.play();
		var pl = document.querySelector('#video-controls button.pl');
		if(video.paused == true){
			//표기를 변경
			pl.innerHTML = "▶";
			pl.title = "재생";
			
		} else {
			// 표기를 변경
			pl.innerHTML = "＝";
			 pl.title = "정지";
		}	
		
	});
}

// time slider click 버전 마침

//time-slider 시작
// Video
   var video = document.getElementById("video");
  

  // Sliders
  var seekBar = document.getElementById("seek-bar");
  var volumeBar = document.getElementById("volume-bar");
  

  
//현재 시간 표시하기 시작
  window.addEventListener("load", function() {
  	var span = document.querySelector('#now');
  	var video = document.getElementById("video");
  	video.addEventListener("timeupdate", function() {
		var duration = video.duration.toFixed(0);
		var dhour0 = duration / 3600;
		var dhour1 = parseInt(dhour0);
		var dmin0 = duration - dhour1*3600;
		var dmin1 = parseInt(dmin0/60);
		var dsec = duration - dhour1*3600 - dmin1*60;
		if(dhour1 < 10){
			dhour1 = "0"+dhour1;
		}
		if(dmin1 < 10){
			dmin1 = "0"+dmin1;
		}
		if(dsec < 10){
			dsec = "0"+dsec;
		}
		var dur = dhour1 + ":"+ dmin1  + ":"+ dsec;
  		var curTime = video.currentTime.toFixed(0);
  		var chour0 = curTime / 3600;
		var chour1 = parseInt(chour0);
		var cmin0 = curTime - chour1*3600;
		var cmin1 = parseInt(cmin0/60);
		var csec = curTime - chour1*3600 - cmin1*60;
		if(chour1 < 10){
			chour1 = "0"+chour1;
		}
		if(cmin1 < 10){
			cmin1 = "0"+cmin1;
		}
		if(csec < 10){
			csec = "0"+csec;
		}
		var cur = chour1 + ":"+ cmin1  + ":"+ csec;
  		span.textContent = cur + " / "+ dur; 
	}, false);
  }, false);

  // 현재 시간 표시하기 마침

  
//Event listener for the seek bar
	seekBar.addEventListener("change", function() {
		// Calculate the new time
		var time = video.duration * (seekBar.value / 100);
		var pl = document.querySelector('#video-controls button.pl');
		if(video.paused == true){
			//표기를 변경
			pl.innerHTML = "▶";
			pl.title = "재생";
			
		} else {
			// 표기를 변경
			pl.innerHTML = "＝";
			 pl.title = "정지";
		}
		// Update the video time
		video.currentTime = time;
	});

	
	// Update the seek bar as the video plays
	video.addEventListener("timeupdate", function() {
		// Calculate the slider value
		var value = (100 / video.duration) * video.currentTime;
		
	  	// Update the slider value
		seekBar.value = value;
	});

	// Pause the video when the seek handle is being dragged
	seekBar.addEventListener("mousedown", function() {
		video.pause();
		
	});

	// Play the video when the seek handle is dropped
	seekBar.addEventListener("mouseup", function() {
		video.play();
		var pl = document.querySelector('#video-controls button.pl');
		if(video.paused == true){
				//표기를 변경
				pl.innerHTML = "▶";
				pl.title = "재생";
				
			} else {
				// 표기를 변경
				pl.innerHTML = "＝";
				 pl.title = "정지";
			}
	});
// time-slier 마침

//우클릭방지
/* document.onmousedown=disableclick;
status="Right Click Disabled";
function disableclick(event)
{
  if(event.button==2)
   {
     alert(status);
     return false;    
   }
} */

//volume
 // change volume based on incoming value 
window.SetVolume = function(val)
{
    var player = document.querySelector('#player video');
    player.volume = val / 100;
}

		//wathching mode
          function watchingSize() {
        	 
  			$("#player").each(function() {
                  
                  $(this).css({
                      'max-width':'960px',
                      'max-height':'660px',
                      'width':'960px',
                      'height':'660px'
                  });
              }); 
        
	  			$("#player video").each(function() {
                 $(this).css({
                     'max-width':'960px',
                     'max-height':'540px',
                     'width':'960px',
                     'height':'540px'
                 });
              
             }); 
	  		
	  			$("#seek").each(function() {
	                  
	                  $(this).css({
	                      'max-width':seekWidth+'px',
	                      'max-height':seekHeight +'px',
	                      'width':seekWidth+'px',
	                      'height':seekHeight +'px'
	                  });
	               
	              }); 
	  			
	  			$("#seek-bar").each(function() {
	                  
	                  $(this).css({
	                      'max-width':seekbarWidth+'px',
	                      'max-height':seekbarHeight +'px',
	                      'width':seekbarWidth+'px',
	                      'height':seekbarHeight +'px',
	                      'margin-top':'0px'
	                  });
	               
	              }); 
	  		
	  			$("#video-controls").each(function() {
	                  
	                  $(this).css({
	                      'max-width':contrWidth + 'px',
	                      'max-height':contrHeight +'px',
	                      'width':contrWidth + 'px',
	                      'height':contrHeight +'px'
	                  });
	               
	              }); 
	  			
	  			var obj = document.getElementsByTagName('button'); 
	  		    for(var i=0; i<obj.length; i++) 
	  		    { 	
	  		    	$(obj[i]).css({
	                      'max-width':btnsW[i] + 'px',
	                      'max-height':btnsH[i] +'px',
	                      'font-size': '18px',
	                      'margin-top':'0px',
	                      'line-height': '46px'
	                      
	                  });
	  		    	
	  		    } 
	  		    
	  		  var comb = document.getElementsByName('sel'); 
	  		    for(var i=0; i<comb.length; i++) 
	  		    { 	
	  		    	$(comb[i]).css({
	                      'max-width':comboW[i] + 'px',
	                      'max-height':comboH[i] +'px',
	                      'font-size': '18px',
	                      'margin-top':'0px',
	                      'line-height': '46px'
	                  });
	  		    	
	  		    } 
	  			
	  		  $("#now").each(function() {
                 
                 $(this).css({
               	  'margin-top':'-12px'
                 });
              
             });  
           
			 $("#vol-div").each(function() {
                 
                 $(this).css({
               	  'margin-top':'15px'
                 });
              
             }); 
          }
          
          //coding mode
          function codingSize() {
        	
        	  $("#player").each(function() {
                  
                  $(this).css({
                      'max-width':codplyWidth+'px',
                      'max-height':codplyHeight +'px',
                      'width':'100%',
                      'height':codplyHeight +'px'
                  });
               
              }); 
        	  
	  			$("#player video").each(function() {
                  
                  $(this).css({
                      'max-width':codWidth+'px',
                      'max-height':codHeight +'px',
                      'width':'100%',
                      'height':'100%'
                  });
               
              }); 
	  		
	  			$("#seek").each(function() {
	                  
	                  $(this).css({
	                      'max-width':codseekWidth+'px',
	                      'max-height':codseekHeight +'px',
	                      'width':'100%',
	                      'height':'100%'
	                  });
	               
	              }); 
	  			
	  			$("#seek-bar").each(function() {
	                  
	                  $(this).css({
	                      'max-width':codseekbarWidth+'px',
	                      'max-height':codseekbarHeight +'px',
	                      'width':'100%',
	                      'height':'100%',
	                      'margin-top':'7px'
	                  });
	               
	              }); 
	  		
	  			$("#video-controls").each(function() {
	                  
	                  $(this).css({
	                      'max-width':codcontrWidth + 'px',
	                      'max-height':codcontrHeight +'px',
	                      'width':'100%',
	                      'height':'100%'
	                  });
	               
	              }); 
	  			
	  			var obj = document.getElementsByTagName('button'); 
	  		    for(var i=0; i<obj.length; i++) 
	  		    { 	
	  		    	$(obj[i]).css({
	                      'max-width':codbtnsW[i] + 'px',
	                      'max-height':codbtnsH[i] +'px',
	                      'font-size': '12px',
	                      'margin-top':'-4px',
	                      'line-height': '20px'
	                      
	                  });
	  		    	
	  		    } 
	  		    
	  		  var comb = document.getElementsByName('sel'); 
	  		    for(var i=0; i<comb.length; i++) 
	  		    { 	
	  		    	$(comb[i]).css({
	                      'max-width':codcomboW[i] + 'px',
	                      'max-height':codcomboH[i] +'px',
	                      'font-size': '15px',
	                      'margin-top':'-4px',
	                      'line-height': '40px'
	                  });
	  		    	
	  		    } 
	  			
	  		  $("#now").each(function() {
                  
                  $(this).css({
                	  'margin-top':'-10px'
                  });
               
              });  
            
 			 $("#vol-div").each(function() {
                  
                  $(this).css({
                	  'margin-top':'-35px'
                  });
               
              }); 
	  		  
      	}



var originalWidth;
var originalHeight;
var codWidth;
var codHeight;
var plyWidth;
var plyHeight;
var codplyWidth;
var codplyHeight;
var seekWidth;
var seekHeight;
var codseekWidth;
var codseekHeight;
var seekbarWidth;
var seekbarHeight;
var codseekbarWidth;
var codseekbarHeight;
var contrWidth;
var contrHeight;
var codcontrWidth;
var codcontrHeight;
var btnsW = new Array(10);
var btnsH = new Array(10);
var codbtnsW = new Array(10);
var codbtnsH = new Array(10);
var comboW = new Array(10);
var comboH = new Array(10);
var codcomboW = new Array(10);
var codcomboH = new Array(10);

//썸네일 시작
var video;
var src = "";
document.addEventListener("DOMContentLoaded", function() {
	  var player = document.querySelector('#player');
	  video = document.querySelector('#player video');
	  var seek = document.getElementById("seek");
	  var seekbar = document.getElementById("seek-bar");
	  var contr = document.getElementById("video-controls");
	 
	  var obj = document.getElementsByTagName('button'); 
	    for(var i=0; i<obj.length; i++) 
	    { 
	    	btnsW[i] = obj[i].offsetWidth;
	    	btnsH[i] = obj[i].offsetHeight;
	    	codbtnsW[i] = obj[i].offsetWidth * 0.6;
	    	codbtnsH[i] = obj[i].offsetHeight * 0.72;
	    } 
	    
	    var comb = document.getElementsByName('sel'); 
	    for(var i=0; i<comb.length; i++) 
	    { 
	    	comboW[i] = comb[i].offsetWidth;
	    	comboH[i] = comb[i].offsetHeight;
	    	codcomboW[i] = comb[i].offsetWidth * 0.6;
	    	codcomboH[i] = comb[i].offsetHeight * 0.6;
	    }   
	  
	  originalWidth = video.width;
	  originalHeight = video.height;
	  codWidth = originalWidth*0.65;
	  codHeight = originalHeight*0.65;
	  
	  plyWidth = player.offsetWidth;
	  plyHeight = player.offsetHeight;
	  codplyWidth = plyWidth*0.65;
	  codplyHeight = plyHeight*0.66;
	  
	  seekWidth = seek.offsetWidth;
	  seekHeight = seek.offsetHeight;
	  codseekWidth = seekWidth * 0.65;
	  codseekHeight = seekHeight * 0.65;
	  
	  seekbarWidth = seekbar.offsetWidth;
	  seekbarHeight = seekbar.offsetHeight;
	  codseekbarWidth = seekbarWidth * 0.57;
	  codseekbarHeight = seekbarHeight * 0.55;
	  
	  contrWidth = contr.offsetWidth;
	  contrHeight = contr.offsetHeight;
	  codcontrWidth = contrWidth * 0.65;
	  codcontrHeight = contrHeight * 0.65;
	  
	  
	  //선택된 파일 미디어 리소스의 src 속성값
	  window.addEventListener("load", function() {
		var url = video.currentSrc;
		var list = document.querySelectorAll('video,source');
		for(var i=0 ; i<list.length ; i++){
			var el = list.item(i);
			if (el.src == url) {
				src = el.getAttribute("src");
				break;		
			}
		}
		
	}, false)
	

	  
	  
	  //재생 버튼에 click 이벤트 리스너를 지정
	  var pl = document.querySelector('#video-controls button.pl');
	  pl.addEventListener("click", function(event) {
		//재생 버튼 눌렀을 때의 처리
		click_play_button(event, video);
	}, false);
	  
	  //restart
	    var re = document.querySelector('#video-controls button.re');
	  re.addEventListener("click", function(event) {
		//restart 버튼 눌렀을 때의 처리
		click_restart_button(event, video);
	}, false);
	  
	  //rew
	    var rew = document.querySelector('#video-controls button.rew');
	  rew.addEventListener("click", function(event) {
		//뒤로가기 버튼 눌렀을 때의 처리
		click_rew_button(event, video);
	}, false);
	  
	  //fwd
	  var fwd = document.querySelector('#video-controls button.fwd');
	  fwd.addEventListener("click", function(event) {
		//앞으로가기 버튼 눌렀을 때의 처리
		click_fwd_button(event, video);
	}, false);
	  
	  //cod
	  var cod = document.querySelector('#video-controls button.cod');
	  cod.addEventListener("click", function(event) {
		//codingmode 버튼 눌렀을 때의 처리
		codingSize();
	}, false);
	  
	  //wat
	  var wat = document.querySelector('#video-controls button.wat');
	  wat.addEventListener("click", function(event) {
		//wawtchingmode 버튼 눌렀을 때의 처리
		watchingSize();
	}, false);
	  
}, false); //domcontentloaded	!!!!!





//재생 버튼을 눌렀을 때의 처리
function click_play_button(event, video) {
	//눌린 button 요소
	var pl = event.currentTarget;
	if(video.paused == true){
		//재생 시작
		video.play();
		//표기를 변경
		pl.innerHTML = "＝";
		 pl.title = "정지";
	} else {
		//재생중지
		video.pause();
		// 표기를 변경
		pl.innerHTML = "▶";
		pl.title = "재생";
	}
}


//skip forward, backward, or restart
function setTime(tValue, video) {
  //  if no video is loaded, this throws an exception 
  var pl = event.currentTarget;
 
try {
    if (tValue == 0) {
    	 
    	video.currentTime = tValue;
        video.pause(); 
        var pl = document.querySelector('#video-controls button.pl');
    	pl.innerHTML = "▶";
    	pl.title = "재생";
    }
    else {
      video.currentTime += tValue;
      var pl = document.querySelector('#video-controls button.pl');
      pl.innerHTML = "＝";
 	 pl.title = "정지";
    }

  } catch (err) {
    // errMessage(err) // show exception
    errMessage("Video content might not be loaded");
  }
}

//restart
function click_restart_button(event, video) {
	//눌린 button 요소
	//var re = event.currentTarget;
	// 표기를 변경
	var pl = document.querySelector('#video-controls button.pl');
	
	pl.innerHTML = "＝";
	 pl.title = "정지";
	setTime(0, video);
}


//rew
function click_rew_button(event, video) {
	//눌린 button 요소
	var rew = event.currentTarget;
	
	setTime(-5, video);
}

//fwd
function click_fwd_button(event, video) {
	//눌린 button 요소
	var fwd = event.currentTarget;
	
	setTime(5, video);
}

// 썸네일 coding완료

			
 //속도 조절 combobox 클릭시 이벤트 지정
				
 function selectEvent(selectObj)
 {	
     //alert(selectObj.value + "가 선택 되었습니다.");
     video.playbackRate = selectObj.value;
 	
 }  

//북마크 기능
//media fragment
function selectChapter(selectObj)
 {	
     //alert(selectObj.value + "가 선택 되었습니다.");
     var fileURL;
	 fileURL = document.querySelector('#player source').getAttribute('src'); 
	 video.setAttribute('src', fileURL + '#t=' + selectObj.value);
     
	 video.load();
	 var pl = document.querySelector('#video-controls button.pl');
	 pl.innerHTML = "＝";
	 pl.title = "정지";
	 video.play();
 	
 }  

</script>


</body>
</html>