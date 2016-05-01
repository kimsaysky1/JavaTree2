<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->

<style type="text/css">

.viewtitle {
	width: 100%;
	height: 70px;
	background: #14548E;
}
.popwrap h3 {
	margin-bottom: 25px;
	padding-top: 20px;
	color: #fff;
}

.playerpart{
width: 900px;
float: left;
}

.codingpart{
width: 900px;
float: right;
}

video {pointer-events: none;
	   margin:5px;
}

#vol-div{
	float: right;
	margin-right: 0px;
	margin-top: 15px;
	margin-left: 270px;
}

.slider-width100
{	
    /* transform: rotate(270deg); //수직 bar */
    width: 80px; !important;
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

#now{
	/* float: left; */
	margin: 12px;
	margin-top: -12px;
	vertical-align: middle;
}

#seek-bar {
/*required for proper track sizing in FF*/
	width: 770px; !important;
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
	margin-left:48px;
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
   /*  background: #fff; */
	background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%);
    /* background-color: #000; */
    overflow:hidden;
    position:relative;
    display:inline-block;
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
	display:inline-block;
	white-space: nowrap;
	margin-top: -25px;
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
	font-family:"Helvetica Neue",Helvetica,Arial,sans-serif,AppleGothic;
	font-size: 18px;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	height: 46px;
	padding: 0 1em;
	font-size: 18px;
	font-weight: 600;
	line-height: 46px;
	top: 0px;
	position: relative;
}

button { font-family: 돋움, dotum, 굴림, gulim, sans-serif; }
button { font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; }
.re { font-family: 돋움, dotum, 굴림, gulim, sans-serif; font-weight: bolder; }
/* 일반적인 버튼의 상황 */
button,
button:link,
button:visited {
	color: #666;
	border: 1px solid #ebebeb;
	border-bottom-color: #c6c6c6;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.04);
	background: #fff;
	background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%);
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6', GradientType=0 );/*IE*/
}
 
/* 마우스오버 */
button:focus,
button:hover {
	background: #f4f4f4;
	background: linear-gradient(to bottom, #fafafa 0%, #fff 100%);
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fafafa', endColorstr='#ffffff', GradientType=0 );/*IE*/
}
 
/* 눌려졌거나 선택 된 상황 */
button:active,
button.active {
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
	font-family:"Helvetica Neue",Helvetica,Arial,sans-serif,AppleGothic;
	font-size: 18px;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	height: 46px;
	padding: 0 1em;
	font-size: 18px;
	font-weight: 600;
	line-height: 46px;
	/* border:gray; border-right:0.5px; border-top:0.5px; boder-left:0.5px; boder-bottom:0.5px; */
}

@font-face{
    font-family:ng;
    src:url(NanumGothic.eot);
    src:local(※), url(NanumGothic.woff) format(‘woff’)
}

body {
    font-family: 나눔고딕, NanumGothic, ng;
  }

.pl{
	font-weight: bold;
	font-family:"Helvetica Neue",Helvetica,Arial,sans-serif,AppleGothic;
}
        #tabs { margin:0; padding:0; list-style:none; overflow:hidden; }
        #tabs li { float:left; display:block; padding:5px; background-color:#bbb; margin-right:5px;}
        #tabs li a { color:#fff; text-decoration:none; }
        #tabs li.current { background-color:#e1e1e1;}
        #tabs li.current a { color:#000; text-decoration:none; }
        #tabs li a.remove { color:#f00; margin-left:10px;}
        #wrapper {float:left; margin:0 20px 0 0;}
        #documents { margin:0; padding:0;}
        #wrapper { width:700px; margin-top:20px;}
        .editor {float:left; width: 600px; height: 300px; overflow:scroll;} 
        .line_number { 
			float:left;
			padding-right: 14px;
			margin-top: 37px;
			width:31px;
			font: 13px Arial;
			line-height: normal;
			text-align: right;
			height:300px;
			overflow:scroll;
			overflow-y:hidden;
			
		} 
        div.numberedtextarea-wrapper { position: relative; }

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
	<div class = "playerpart">
		<div id="player">
			
			<video width="900" height="500" id="video" autoplay="autoplay" src="../resources/upload/a.mp4">
			</video>
			
			<div id="seek">
				<input type="range" class="time-slider" id="seek-bar" value="0" step="any" max="100" min="0" step="any" /> <span id="now"></span>
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
					<option value='0' selected>B</option>
					<option value='10'>1Q</option>
					<option value='150'>2Q</option>
					<option value='300'>3Q</option>
					<option value='400'>4Q</option>
				</select>

				<div id="vol-div">
					<input id="vol-control" class="slider-width100" type="range" max="100" min="0" step="any" oninput="SetVolume(this.value)" onchange="SetVolume(this.value)"></input>
				</div>
			</div>
		</div> 
		<!-- video END  -->
		</div>
		
		
		
		<div class = "codingpart">
		<!-- editor 시작 -->


		<textarea rows="20" cols=60" id="question" placeholder="질문란" readonly="readonly"></textarea>
	<div id="wrapper">
	 	<div class="line_number"></div>
	    <ul id="tabs">
	    	<li class='current'><a class='tab' id="class1" href='#'>class1</a><a href='#' class='remove'>x</a></li>
	    </ul>
	    <div id="doccontent">
	   		<textarea id="class1_content" class="editor"></textarea>
	    </div>
	</div>
	
<textarea rows="20" cols="40" placeholder="결과" id = "result" readonly="readonly"></textarea>
	<br/>
	<s:if test="codingList != null">
	<select class = "codingList">
		<option>문제선택</option>
		<s:iterator value="codingList" status="incr">
			<option value = "<s:property value="codingno"/>">
			<s:property value="%{#incr.index+1}"/>번 문제
			</option>
		</s:iterator>
	</select>
	</s:if>
	<br/> 
	<button id = "insertClass">클래스 추가</button>
	<br/>
	<button id = "initialization">초기화</button>
	<br/>
	<button id = "run">실행</button>
	<br/>
	<button id = "qna">Q&A</button>
	
	
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
					<input type="button" style="display:none;" id = "insertQuestion" value="WRITE QUESTION" class="mc-btn btn-style-1" data-toggle="modal" data-target="#writeQuestionModal"/>
                  			<div class="container">
							<div class="modal fade" id="writeQuestionModal" role="dialog">
						    	<div class="modal-dialog modal-lg">
								      <!-- Modal content-->
							      <div class="modal-content">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							          <h4 class="modal-title">Modal Header</h4>
							        </div>
							        <div class="modal-body">
							            <table style='width: 800px;'>
										<tr>
											<td style='width: 100px; height: 70px; text-align:center;'><b>FIELD</b></td>
											<td><select id="questionTypeno" style="width: 100px;">
											 <option value="1">PUREJAVA</option>
											 <option value="2">WEB</option>
											 <option value="3">MOBILE</option>
											 <option value="4">IOT</option>
											 <option value="5">SWING</option>
											 <option value="6">JDBC</option>
											 <option value="7">API</option>
											 <option value="8">SPRING</option>
											 <option value="9">STRUTS</option>
											 <option value="10">etcFramework</option>
											 <option value="11">ETC</option>
											</select></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td style='width: 100px; text-align:center;'><b>QUESTION</b></td>
											<td><textarea id="questionTitle" style="height: 100px;"></textarea></td>
										</tr>
										<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										<tr>
											<td style='width: 100px; text-align:center;'><b>content</b></td>
											<td><textarea id="questionContent" style="height: 250px;"></textarea></td>
										</tr>
											<tr>
											<td style='height: 20px;'></td>
											<td></td>
										</tr>
										</table>
							        </div>
							        <div class="modal-footer">
							        	<button id = "insertQuestionBtn" class="mc-btn-5">등록</button>&nbsp;&nbsp;
										<button class="cancel">취소</button>
							          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
							        </div>
							      </div>
						  	   </div>
						  </div>
                  		</div>
				</div>
                   	
            <!-- 질문 버튼 끝 -->
            </div>
            
<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
<script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>


	</div> <!-- popwrap END -->

</body>
</html>