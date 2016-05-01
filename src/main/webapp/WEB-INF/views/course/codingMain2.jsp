<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="s" uri="/struts-tags" %>
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
<title>문제보관함</title>


<body id="page-top">

   <!-- PAGE WRAP -->
   <div id="page-wrap">

      <div class="top-nav">

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
                              <a href="/javatree/course/codingMainInsertLectureView.action">
                                 <h6>MAIN</h6>
                              </a>
                           </div>


                        </li>

                        <li>
                           <div class="list-body">
                              <a href="/javatree/course/insertSelectedCodingfromInsertLectureView.action">
                                 <h6>INSERT</h6>
                              </a>
                           </div>


                        </li>

                        <li>
                           <div class="list-body">
                              <a href="/javatree/course/updateCodingfromInsertLectureView.action">
                                 <h6>UPDATE</h6>
                              </a>
                           </div>

                        </li>
                        
                        <!-- <li>
                           <div class="list-body">
                              <a href="/javatree/course/deleteCodingfromMainView.action">
                                 <h6>DELETE</h6>
                              </a>
                           </div>

                        </li> -->

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
                  <h4 class="sm">QUESTION BOX  </h4>

                  <table style='width: 900px;'>
                     <tr>
                        <td style='width: 400px;'><b>ALL QUESTION<s:property value="codingno"/></b><br /> 
                           <select multiple="multiple" id='lstBox1' style='width: 400px; height: 600px;' >
                               <s:iterator value="codingList" status="st">   
                                 <option value="<s:property value="codingno"/>"><s:property value="codingquestion"/></option>
                               </s:iterator>
                           </select>
                        </td>
                        <td style='width: 50px; text-align: center; vertical-align: middle;'>
                           <input type='button' id='btnRight' value='  >  ' /> <br />
                           <input type='button' id='btnLeft' value='  <  ' />
                        </td>
                        <td style='width: 400px;'><b>SELECTED QUESTION </b><br /> 
                          <%--  <select multiple="multiple" class="courselistbox" id ="courselistbox" style='width: 400px; height:30px;'>
                                    <option>강좌<s:property value="courseno"/>  </option>

                           </select> --%>
                           <br><br>
	                        
                           <br><br>
                           <select multiple="multiple" id='lstBox2' style='width: 400px; height: 600px;'>
 								<s:iterator value="codingList" status="st"> 
                                 <<%-- option value="<s:property value="codingquestion"/>"><s:property value="codingquestion"/></option> --%>
								</s:iterator>
                           </select>
                           <input type="button" id="btninsert" value="저장" style="float: right; margin-right: 28px;">
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
         </div>
      </section>



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
   
/*    function courselistget(){
      alert("코스리스트겟들어옴");

       var selectcourse =  $('#courselistbox option:selected').val();
       alert(selectcourse);
       
   } */
   
   $("#courselistbox").change(function(){
      var courseno=$(this).val()      
      $('#lstBox2 option').remove();
      $.ajax({
         url : 'golecturelist.action',
         data : {'courseno' : courseno},
         success : function(response){
            alert("성공");
            $(response.lectureList).each(function(index, item) {
               $('#lecturelistbox').append( '<option value='+item.lectureno+' class="lecturelistbox1">'+item.lecturename+'</option>');
            });      
         },
         error:function(){
            alert('에러');
         }
      });
      
   });
   
   
   $("#lecturelistbox").change(function(){
      var lectureno = $(this).val()
      $('#lstBox2 option').remove();
		
      
      $.ajax({
         url:'gocodinglist.action',
         data: {'lectureno' : lectureno},
         success: function(response){
            alert(response.codingList);
            $(response.codingList).each(function(index, item) {
               $('#lstBox2').append( '<option value='+item.codingno+' class="lstBox2_1">'+item.codingquestion+'</option>');
            });      
            
         },
         error:function(){
            alert('에러');
         }
      });
      
      
   });
   
   
   $('#lstBox1').change(function(){
      
      $.ajax({
         url : 'deleteCodingfromMain.action',
         data : {'codingno' : codingno},
         success : function(response){
         }
      });
      
   });

    $('#btnRight').click(function(e) {
        var selectedOpts = $('#lstBox1 option:selected');
        if (selectedOpts.length == 0) {
            alert("Nothing to move.");
            e.preventDefault();
        }

        $('#lstBox2').append($(selectedOpts).clone());
        e.preventDefault();
    });

    $('#btnLeft').click(function(e) {
        var selectedOpts = $('#lstBox2 option:selected');
        if (selectedOpts.length == 0) {
            alert("Nothing to move.");
            e.preventDefault();
        }

   /*      $('#lstBox1').append($(selectedOpts).clone()); */
        $(selectedOpts).remove();
        e.preventDefault();
    });
    
    
    $('#btninsert').on( "click", function(){
    	alert("옴");

    	var codingListForInsert = [];
    	$('#lstBox2 option').each(function(index) {
    		codingListForInsert.push( $(this).val()) ;
      	});
   
    		$.ajax({
             url : 'insertSelectedCodingfromInsertLecture.action',
             data : 'codingListForInsert='+codingListForInsert,
             success : function(response){
            	
            	 alert("완료");
            	 $('#lstBox2 option').remove();
             }
          }); 
    });
    
 
});
</script>
   

</body>
</html>