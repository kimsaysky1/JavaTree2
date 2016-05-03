<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
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
    
<title>문제보관함</title>


<body id="page-top">

   <!-- PAGE WRAP -->
   <div id="page-wrap">

      <div class="top-nav" style="z-index: 1;">

         <h4 class="sm black bold">QUESTION BOX</h4>

         <ul class="top-nav-list">
            <li class="outline-learn"><a href="#"><i
                  class="icon md-list"></i></a>
               <div class="list-item-body outline-learn-body">
                  <div class="section-learn-outline">
                     <h5 class="section-title">MENU</h5>
                     <ul class="section-list">
                        <li>
                           <div class="o-view">
                              <a href="/javatree/course/codingFormfromMain.action">
                                 <h6>MAIN</h6>
                              </a>
                           </div>


                        </li>

                        <li>
                           <div class="list-body">
                              <a href="/javatree/course/insertCodingfromMainView.action">
                                 <h6>INSERT</h6>
                              </a>
                           </div>
                        </li>

                        <li>
                           <div class="list-body">
                              <a href="/javatree/course/updateCodingfromMainView.action">
                                 <h6>UPDATE</h6>
                              </a>
                           </div>

                        </li>
                        
                           <li>
                           <div class="list-body">
                              <a href="/javatree/course/deleteCodingfromMainView.action">
                                 <h6>DELETE</h6>
                              </a>
                           </div>

                        </li>

                     </ul>
                  </div>


               </div></li>
            <!-- 페이지 종료 -->
            <li class="backpage"><a href="#"><i
                  class="icon md-close-1" onclick="self.close();"></i></a></li>
         </ul>

      </div>
      <section id="quizz-intro-section"
         class="quizz-intro-section learn-section">
         <div class="container">

            <div class="title-ct">
               <h3>
                  <strong></strong>
               </h3>
               <div class="tt-right">
                  <a href="#" class="skip"><i class="icon md-arrow-right"></i>Skip
                     quizz</a>
               </div>
            </div>
            <div class="question-content-wrap">
               <div class="question-content">
                  <h4 class="sm">QUESTION BOX</h4>

                  <table style='width: 900px;'>
                     <tr>
                        <td style='width: 400px;'><b>ALL QUESTION</b><br /> 
                  <!-- 보유 코딩 문제 리스트 -->
                           <select multiple="multiple" id='lstBox1' style='width: 400px; height: 600px;' >
                               <s:iterator value="codingList" status="st">   
                                 <option value="<s:property value="codingno"/>"><s:property value="codingquestion"/></option>
                               </s:iterator>
                           </select>
                        <!-- 보유 코딩 문제 리스트 끝 -->   
                           
                        </td>
                        <td style='width: 50px; text-align: center; vertical-align: middle;'>
                           <input type='button' id='btnRight' value='  >  ' /> <br />
                           <input type='button' id='btnLeft' value='  <  ' />
                        </td>
                        <td style='width: 400px;'><b>SELECTED QUESTION </b><br /> 
                          
                           <br><br>
                           <!-- 강의 해당 코딩문제 리스트 -->
                           <select multiple="multiple" id='lstBox2' style='width: 400px; height: 600px;'>                          
                      <s:iterator value="codingList" status="st">  
                                 <%-- <option value="<s:property value="codingquestion"/>"><s:property value="codingquestion"/></option> --%>
                     </s:iterator>
                           </select>
                           <!-- 강의 해당 코딩문제 리스트 끝-->
                           <input type="button" id="btnCancel" value="창닫기" style="float: right; margin-right: 28px;">
                           <input type="button" id="btnDelete" value="삭제" style="float: right; margin-right: 28px;">
                           <input type="button" id="btnSave" value="저장" style="float: right; margin-right: 28px;">
                        </td>
                     </tr>
                  </table>
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
          <p>내용이 저장되었습니다.</p>
        </div>
         <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
    </div>
  </div>
</div>
   </div>
   <!-- END / PAGE WRAP -->


   <!-- Load jQuery -->
   <script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
   <script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
   <script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
   <script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
   <script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
   <script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
   <script type="text/javascript" src="../resources/javatree_view/html/js/scripts.js"></script>
   
   <script type="text/javascript">
$(document).ready(function() {
   
   
    $('#btnRight').click(function(e) { //오른쪽 화살표
       var lectureno = $("#lecturelistbox option:selected").val();
       var beforeCodingArray = [];
       $('#lstBox1 :selected').each(function(i, selected) {
          
          var temp = {
             codingno: Number($(selected).val())
             ,codingquestion: $(selected).html()
          }
          beforeCodingArray.push(temp);
       });
       
       var rightCodingArray = [];
       
       $('#lstBox2 option').each(function(i, coding){
          rightCodingArray.push(Number($(coding).val()));
       });
       
       beforeCodingArray.forEach(function(item){
          var check = $.inArray(item.codingno, rightCodingArray);
       if(check < 0){
             $('<option value="'+item.codingno+'">'+item.codingquestion+'</option>').appendTo('#lstBox2');
          }
      });
    });

    $('#btnLeft').click(function(e) { //왼쪽 화살표
        var selectedOpts = $('#lstBox2 option:selected');
        if (selectedOpts.length == 0) {
            e.preventDefault();
        }
        $(selectedOpts).remove();
        e.preventDefault();
    });
    
 
    $('#btnSave').on( "click", function(){ 
       var StringForSaveCoding = [];
       $('#lstBox2 option').each(function(index) {
          StringForSaveCoding.push(Number($(this).val()));
         });
         $.ajax({
        	 method : 'get'
             , url : 'tempLectureCodingforLecture.action'
             , data : 'StringForSaveCoding='+StringForSaveCoding
             , dataType : 'json'
             , success : function(response){
                $("#modalNotification").trigger('click');
                $("#btnSave").blur();
                //$('#lstBox2 option').remove();
                //window.close();
             }
             , error : function(response){
                console.log('에러');
             }
          }); 
    });
    
    $('#btnDelete').on('click',function(){
    	var StringForSaveCoding = [];
    	
    	$('#lstBox1 option:selected').each(function(index) {
    		StringForSaveCoding.push(Number($(this).val())) ;
           });
    	$.ajax({
            url : 'deleteCoding.action'
            , data : 'StringForSaveCoding='+StringForSaveCoding
            , dataType : 'json'
            , success : function(response){
            	$('#lstBox1').empty();
            	var list = response.codingList;
            	list.forEach(function(coding){
	            	$('<option value="'+coding.codingno+'">'+coding.codingquestion+'</option>').appendTo('#lstBox1');
            	});
               $("#modalNotification").trigger('click');
            }
            , error : function(response){
               console.log('에러');
            }
         });
    });
    
    $("#btnCancel").on('click',function(){
       window.close();
    });
});
</script>
   

</body>
</html>