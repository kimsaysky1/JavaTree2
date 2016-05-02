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
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>강의 등록</title>
<script>


	

function insertLectureForm(){
	alert("강의등록폼옴>>");
	var form = document.getElementById("insertLectureForm");
	var upload= document.getElementsByName("upload");
	alert(upload);
/* 	var lecturename= document.getElementById("lecturename").value;
	var regdate= document.getElementById("regdate").value;
	
	if(lecturename==""){
		alert("강의명을 입력해 주세요.");
		return false;
	}
	if(regdate=""){
		alert("강의시작 날짜를 입력해 주세요.");
		return false;
	} */
	 
	 
	/*  var video= document.getElementById(video);
	 var note= document.getElementById(note);

	 if(video.value=""){
		 alert("파일 선택");
		 return;
	 }   */
	form.submit();
}

/* function questionBox(){
	window.open('codingForm.action','pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180');	
} */

function stgoback(){
	alert("등록을 그만하시겠습니까");
	location.href="/javatree/course/selectAllCourseListForTeach.action";
}

/*  function sub(){
	 var video= document.getElementById(video);
	 var note= document.getElementById(note);

	 if(video.value=""){
		 alert("파일 선택");
		 return;
	 }
	 
	  */
	 /* if(f1.upload.value==""){
	 
	   alert("업로드 할 파일을 지정해 주세요");
	   return;
	  
	 }
	 
	 
	 var f2=f1.upload.value;
	 //확장자 확인 
	 
	 if(uploadfile_check(f2)){
	 
	  f1.submit();
	  //업로드 파일이 파일 형식에 맞으면 전송
	 }else{
	  return;
	 }
	 
	}

	function uploadfile_check(f2) {
	    var  str_dotlocation,str_ext,str_low;
	    str_value  = f2;
	   
	    str_low   = str_value.toLowerCase(str_value);
	    str_dotlocation = str_low.lastIndexOf(".");
	    str_ext   = str_low.substring(str_dotlocation+1);
	    
	    switch (str_ext) {
	     case "gif" :
	     case "jpg" :
	     case "png" :
	     case "bmp" :
	     case "tif" :
	     case "jpe" :
	    
	         return true;
	         break;
	     default:
	         alert("파일 입력 양식에 맞지 않는 파일입니다.")
	         return false;
	    }
	    
	} 
	 */
	
	/* function sub(frm) {   

		  var file = frm.upfile.value;
		  var fileExt = file.substring(file.lastIndexOf('.')+1); //파일의 확장자를 구합니다.
		  var bSubmitCheck = true;
		  
		  if( !file ){ 
		    alert( "파일을 선택하여 주세요!");
		    return;
		   }
		   
		   if(fileExt.toUpperCase() == "ASP" || fileExt.toUpperCase() == "PHP" || fileExt.toUpperCase() == "JSP" )
		   {
		                alert("ASP,PHP,JSP 파일은 업로드 하실 수 없습니다!");
		                return;
		   }
		   
		   alert("파일 업로드를 시작합니다.");
		   frm.submit();   

		}
 */
 
 /* $("#click").click( function() {
	 $.ajax({
	   // 요청할 URL
	   url: "insertLecture.action",

	   // 데이터를 전송한다. Query 문자열로 변환된다.
	   data:{
	     id: 123
	   },

	   // GET 메서드로 호출한다.
	   type: "POST",
	   // 응답 데이터가 json일 것으로 기대한다.
	   dataType: "json",

	   // 요청이 성공했을 경우 처리 코드
	   success: function(json) {
	     $("<h1 />").text(json.Name).appendTo("body");
	     $("<div class=\"content\"/>").html(json.email).appendTo("body");
	   }, 

	   // 요청이 실패하면 경고창을 띄운다.
	   error: function(xhr, status) {
	     alert("Sorry, ther was a problem!");
	   },
	 })
	 }); */
	
	 
</script>

</head>
<body>
<%@include file="/resources/header2.jsp" %>
		<!-- PROFILE FEATURE 프로필!!!!-->
		    <section class="profile-feature">
		        <div class="awe-parallax bg-profile-feature"></div>
		        <div class="awe-overlay overlay-color-3"></div>
		        <div class="container">
		            <div class="info-author">  
		                <div class="name-author">
		                    <h2 class="big">USER NAME</h2>
		                </div>     
		            </div>
		            <div class="info-follow">
		                <div class="trophies">
		                    <span>JAVA KONG</span>
		                    <p>5000P</p>
		                </div>
		            </div>
		        </div>
		    </section>
        <!-- END / PROFILE FEATURE -->
        
       <section id="create-course-section" class="create-course-section">
        <div class="container">
    
		 <div class="mid-insert-lecture">
		 
		    <h2>insert LECTURE</h2>
<form action="insertLecture" method="post" id="insertLectureForm" enctype="multipart/form-data"> 	
<input type="hidden" name="courseno" value='<s:property value="courseno"/>'>	
                    <div class="create-course-content">

                        <!-- PROMO VIDEO -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Title</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="form-item" >
                                        <input type="text" placeholder="title" name="lecture.lecturename" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->

                        <!-- DESCRIPTION -->
                        <!-- <div class="description create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Description</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="description-editor text-form-editor">
                                        <textarea placeholder="Discription"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- END / DESCRIPTION -->
                 
                        <!-- PROMO VIDEO -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Upload Video</h4><%-- <s:property value="courseno"/> --%>
                                </div>
                                <div class="create-course-2">
                                    <div class="upload-video up-file">                                      
                                        <a href="#"><i class="icon md-upload"></i>Upload video</a>
                                        <input type="file" name ="upload" />
                                        
                                        <s:iterator value="uploadFileName" status="stat">   
                                        	<s:property value="{uploadFileName[#stat.index]}"/>
                                        </s:iterator>
                                        <%-- <s:property value="uploadedfilename"/> --%>
                                                                                
                                        <%-- <s:file name="uploads" /> --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->
                        
                         <!-- PROMO PAPER -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Upload Paper</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="upload-video up-file">                                      
                                        <a href="#"><i class="icon md-upload"></i>Upload paper</a>
                                        <input type="file" name ="upload" />
                                        <%-- <s:file name="uploads" /> --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->

                       
                        <!-- OPEN DATE -->
                        <div class="open-date create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Open date</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class='input-group date' id='datetimepicker'>
                                        <div class="form-item">
                                            <input type="date" placeholder="Select date" name="lecture.regdate" />
                                        </div>
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <!-- END / OPEN DATE -->
                        
                           <!-- OPEN DATE -->
                        <div class="open-date create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Upload Question</h4>
                                </div>
                                <div class="create-course-2">
                                <input type="hidden" id = "courseno" value = "<s:property value="courseno"/>">
                                <input type="hidden" id = "lectureno" value = "<s:property value="lectureno"/>">
                                <input type="button" value="Qesstion BOX" class="submit mc-btn-4 btn-style-1" id="popup_test">
                                   <!-- <a href="javascript:popup();"><input type="button" value="Qesstion BOX" class="submit mc-btn-4 btn-style-1"></a> -->
                                	<!-- <a href="javascript:questionBox();"><input type="button" value="Qesstion BOX" class="submit mc-btn-4 btn-style-1"></a> -->
                                </div>
                            </div>
                            
                        </div>
                        <!-- END / OPEN DATE -->
                        
                       
  						<div class="form-action">
                            <input type="submit" value="Save and Next" onclick="javascript:insertLectureForm()" class="submit mc-btn-3 btn-style-1">
                             <input type="submit" value="Cancel" onclick="javascript:stgoback()" class="submit mc-btn-3 btn-style-1">
                        </div>

                     
                    </div>
</form>
                </div>			  
            </div>

    </section>
    <!-- END / CREATE COURSE CONTENT -->
        
<%@include file="/resources/footer.jsp" %>

	
	<!-- Load jQuery -->
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
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/scripts.js"></script>
		
	
	<script type="text/javascript">
	$('#popup_test').on('click', function(){
		alert("팝업");
		var courseno=document.getElementById("courseno");
		var lectureno=document.getElementById("lectureno");
		/* "/javatree/course/codingMain.action?lectureno=<s:property value="lectureno"/>&courseno=<s:property value="courseno"/> */
		/*  window.open('codingMain.action?courseno'+courseno.value,'pop','resizable=no scrollbars=yes top=50 left=200 width=1200 height=870');   */
		 window.open('codingMainInsertLectureView.action','pop','resizable=no scrollbars=yes top=50 left=200 width=1200 height=870');  
	});
	</script>


		
</body>



</html>