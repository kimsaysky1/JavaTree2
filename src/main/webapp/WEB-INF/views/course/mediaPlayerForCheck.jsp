<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/vol-bar.css"> -->
<style type="text/css">
	   
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
	border: 0;
	bottom: 0;
	float: left;
	/*removes default webkit styles*/
    -webkit-appearance: none;
    
    /*fix for FF unable to apply focus style bug */
    border: 2px solid white;
    margin: 8px;
    
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
    width: 960px;
    height: 660px;
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
</style>
<script src="script/jquery-2.2.3.min.js"></script>
<script src="script/jquery-ui.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="player">
<s:iterator value="lecture" status="st">
	<video width="960" height="540" preload="auto" id="video" autoplay="autoplay">
		<%-- <source src="C:/coding/Wildlife.wmv" type="video/wmv" /> --%>
		<source src='<s:property value="uploadedfilename"/>' type="video/wmv" />
	</video>
</s:iterator>	
<div id="seek">
<input type="range" class="time-slider" id="seek-bar" value="0" step="any" max="100" min="0" step="any" />
<span id="now"></span>
</div>

<br />
	<div id="video-controls">	

<br />
<button title="Stop" class="pl" >＝</button>
<button title="Rewind button" class="rew" >&lt;&lt;</button>
<button title="Forward button" class="fwd" >&gt;&gt;</button>
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



<!-- editor 시작 -->

<!-- editor 마침 -->
<script type="text/javascript">

//time slider click 버전 시작

window.onload = function() {
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
document.onmousedown=disableclick;
status="Right Click Disabled";
function disableclick(event)
{
  if(event.button==2)
   {
     alert(status);
     return false;    
   }
}

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