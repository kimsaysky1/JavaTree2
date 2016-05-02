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
<title>studyMain2</title>
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
		        </div>
		    </section>
        <!-- END / PROFILE FEATURE -->
        
        <!-- CONTEN BAR -->
    <section class="content-bar">
        <div class="container">
            <ul>
                <li class="current">
                    <a href="/javatree/course/studyMainView2.action">
                        <i class="icon md-book-1"></i>
                        Learning
                    </a>
                </li>
                <li>
                    <a href="/javatree/course/selectAllCourseListForTeach.action">
                        <i class="icon md-people"></i>
                        Teaching
                    </a>
                </li>
            </ul>
        </div>
    </section>
   <!-- END / CONTENT BAR -->
   
   <!-- 가운데 영역 -->
		<section class="blog">
			<div id="mid-course" class="mid-course">
				<div class="container">				
				 <h2>MY COURSE</h2>
				<br>
			<div class = "form-study">
			
				<div class="tab-content">
                    <!-- MY SUBMISSIONS -->
                    <div class="tab-pane fade in active" id="mysubmissions">
                        <div class="table-wrap">
                            <!-- TABLE HEAD -->
                            <div class="table-head">
                                <div class="submissions">Title</div>
                                <div class="total-subm"></div>
                                <div class="replied"></div>
                                <div class="latest-reply">ID(SUBNOTE)</div>
                                <div class="tb-icon"></div>
                            </div>
                            <!-- END / TABLE HEAD -->

                            <!-- TABLE BODY -->
                    
                            <div class="table-body">
                         
                                <!-- TABLE ITEM -->
                                
                                    
                               <s:iterator value="courseList">
                               <div class="table-item" >
                                    <div class="thead" id="<s:property value="courseno" />">
                                        <div class="submissions"><s:property value="coursename" /></div>
                                        <div class="total-subm"></div>
                                        <div class="replied"></div>
                                        <div class="latest-reply"><s:property value="teacherid" /></div>
                                        <div class="toggle tb-icon">
                                            <a><i class="fa fa-angle-down"></i></a>
                                        </div>
                                    </div>
                                    
                                      <!-- <div class="tbody">
                                        ITEM
                                        <div class="item">
                                            <div class="submissions"><a href="#">Title of Assignment 1 in course</a></div>
                                            <div class="total-subm">Submited</div>
                                            <div class="replied">Replied</div>
                                            <div class="latest-reply">11. Jul , 2014</div>
                                            <div class="link tb-icon">
                                                <a href="#"><i class="fa fa-play-circle-o"></i></a>
                                            </div>
                                        </div>-->
                                 
                                    </div> 
								</s:iterator>
								  
                                  
                                <!-- END / TABLE ITEM -->
                                </div>
                                <div class = "paging" align="center">
               		   <ul class="pager">
               		   
			<s:if test="#session.currentPage == 1 & #session.endPageGroup == 1">
             <li><a> <s:property value="#session.currentPage"/> </a></li>
             </s:if>
            
            <s:elseif test="#session.currentPage == 1 & #session.endPageGroup != 1">
             <li><a> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = "plusStudyMain2.action?currentPage=<s:property value="#session.currentPage + 1"/>">next &gt</a></li>
            </s:elseif>
			
			<s:elseif test="#session.currentPage == #session.endPageGroup & #session.endPageGroup != 1">
             <li><a href = "plusStudyMain2.action?currentPage=<s:property value="#session.currentPage - 1"/>">&lt prev</a></li>
            <li><a> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/></a></li>
            </s:elseif>
			
			<s:elseif test="#session.currentPage == 0">
             <li><a> <s:property value="#session.currentPage"/> </a></li>
             </s:elseif>
			
			<s:else>
             <li><a href = "plusStudyMain2.action?currentPage=<s:property value="#session.currentPage - 1"/>">&lt prev</a></li>
             <li><a href = "#"> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = "plusStudyMain2.action?currentPage=<s:property value="#session.currentPage + 1"/>">next &gt</a></li>
            </s:else>
				
                        </ul>
                 </div>   
                                </div>
                                </div>
                                
                              
                                
		</div>
		
		  
		
		</div>
	<!-- SIDEBAR -->
                <div class = "course-side">
                    <aside class="blog-sidebar">
                    
                    <!-- 질문 보관함 -->
                    	
                    	<div class="form-submit-1">
							<input type="button" id="questionBox" value="QUESTION BOX" class="mc-btn btn-style-1">
						</div>
                    	
                        <!-- 보관함 끝-->
                        <br><br>
                        <!-- 베스트 랭킹 탭 1 -->
						
						<h4 class="sm">COURSE INFO</h4>
						<!-- 탭ㅂㅂㅂㅂㅂ -->
						<div class="tab-content">
                            <ul class="design-course-tabs" role="tablist">
                            <li>
                                <a href="#design-question" role="tab" data-toggle="tab">Recently Completed</a>
                            </li>
                            <li>
                                <a href="#design-assignment" role="tab" data-toggle="tab">Lately Purchased</a>
                            </li>
                        </ul>
                        <!-- 탭 끝 -->
                        <!--  탭 내용  -->
                        
                        <!-- 완료 강의 -->
                            <div class="tab-pane fade in active" id="design-question">                               
                                <table class="table-quest">
                                    <tbody>
                                      
                                      <s:iterator value="recentlyCompletedLectureList" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><s:property value="lecturename" /> &nbsp;[ &nbsp;강좌명: &nbsp; <s:property value="coursename" /> &nbsp; ]</td>                                          
                                        </tr>
										</s:iterator>
                                       
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <!-- 구입강의 -->
                            <div class="tab-pane fade" id="design-assignment">
                                
                                <table class="table-assignment">
                                    <tbody>
                                     <s:iterator value="latelyPurchasedLectureList" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><s:property value="lecturename" /> &nbsp;[ &nbsp;강좌명: &nbsp; <s:property value="coursename" /> &nbsp; ]</td>                                          
                                        </tr>
										</s:iterator>
                                       
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN ASSIGNMENT -->
    
                        </div>
                        <!-- 내용 끝 -->
                        <!-- 베스트 랭킹 탭 끝 -->
  
                    </aside>    
				</div>
				  <!-- END / SIDEBAR -->
				  </div>
				  </div>
				  </section>
				  
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
	
	
    
	$(function(){
		$("#questionBox").on('click',function(){
			
		});
		
		
		function List() {
			   this.elements = {};
			   this.idx = 0;
			   this.length = 0;
			}
	
			List.prototype.add = function(element) {
			   this.length++;
			   this.elements[this.idx++] = element;
			};
	
			List.prototype.get = function(idx) {
			   return this.elements[idx];
			};
	
		
		var sel = '';
		var prev = 0;
		var approve = 'deny';
		 var list = new List();
		 
	    $.each($('.table-wrap'), function() {
	        $(this)
	            .find('.table-item')
	            .children('.thead:not(.active)')
	            .next('.tbody').hide();
	        
	        $(this)
	            .find('.table-item')
	            .delegate('.thead', 'click', function(evt) {
	            	evt.preventDefault();
	            	
	            	var id = $(this).attr('id');
	                alert("id> " + id);
	                
	              if(prev == 0){
	            	  prev = id;
	              }
	               
	             alert("list길이> " + list.length);
	             
	             approve = 'approve';
	             
	              for(var i=0; i<list.length; i++) {
	            	    if(list.get(i) == id){
	            	    	approve = 'deny';
	            	    	break;
	            	    }
	            	}
	              
	      		
	            
	      		/* alert(list.get(0)); */
	      		
	      		
	             if(approve == 'approve'){
	            	list.add(id);
	                sel = $(this);
	                $.ajax({
					        type : 'get', 
					        url : 'selectListForSlide',
					        data : "courseno="+id,
					        success : function(response){
					        	
					        	var divTag = $('<div class="tbody"></div>');
				 				divTag.html('<div class="item" style = "height:60px;"><div class="submissions"></div><div class="total-subm"></div><div class="replied"></div><div class="latest-reply" style="margin-left:45px;"><a href="selectCourseDetailForStudy.action?courseno='+id+'">>>강좌상세정보</div></div>')
				 				.insertAfter(sel); 	  
					        	
					        	 var list = response.lectureList;
					        	 list.forEach(function(lec){
					 				
					        		 if(lec.uploadedfilename != null){
					        			 var divTag = $('<div class="tbody"></div>');
							 				divTag.html('<div class="item"><div class="submissions">'+ '&nbsp;&nbsp;' + lec.lecturename+'</div><div class="total-subm"></div><div class="replied"><a href="DownLoadFile.action?uploadedfilename='+lec.uploadedfilename+'&lectureno='+lec.lectureno+'">'+lec.uploadedfilename +'</a></div><div class="latest-reply"></div><div class="link tb-icon"><a href="../compiler/Compiler.action?lectureno='+lec.lectureno+'"><i class="fa fa-play-circle-o"></i></a></div></div>')
							 				.insertAfter(sel); 
					        		 }else{
					        			 var divTag = $('<div class="tbody"></div>');
							 				divTag.html('<div class="item"><div class="submissions">'+ '&nbsp;&nbsp;' + lec.lecturename+'</div><div class="total-subm"></div><div class="replied"></div><div class="latest-reply"></div><div class="link tb-icon"><a href="#" onclick = "javascript:popup(lec.lectureno)"><i class="fa fa-play-circle-o"></i></a></div></div>')
							 				.insertAfter(sel); 
					        		 }
					        		 
					        	 		  
					        		 
					        		 /* var divTag = $('<div class="post"><div class="post-body"></div></div>');
					 				divTag.html('<div class="post-title"><h3 class="md"><a href="selectCourseDefaultDetail.action?courseno='+course.courseno+'">'
					 				+course.coursename+'</a></h3></div><div class="post-meta">by'
					 				+course.username+' on '+course.regdate+'</div><div class="post-link"><a href="blog-single.jsp?courseno='+course.courseno
					 				+'"><i class="fa fa-play-circle-o"></i>Lecture List</a></div>').appendTo(".blog-list-content"); */
					 			
					 			});
					        	 
					        	/*  var curPage = Number(response.currentPage);
					        	 var curPagePlus = Number(response.currentPage+1);
					        	 var curPageMinus = Number(response.currentPage-1);
					        	 var endPage =  Number(response.endPageGroup);
					        	 			        	 
					        	 var paging = $('<ul class="pager"></ul>');
					        	 if(curPage == 1 & endPage == 1){
					        		 var paging0 = '<li><a href="#">'+ curPage+'</a></li>';
					        		 paging.html(paging0).insertAfter(".blog-list-content > div:last");
					        	 }else if(curPage == 1 & endPage != 1){
					        		 var paging1 = '<li><a href="#">'+ curPage+' / '+endPage+ +'</a></li><li><a href="javascript:clickNextField('+curPagePlus+')">next &gt</a></li>';
					        		 paging.html(paging1).insertAfter(".blog-list-content > div:last");
					        	 }else if(curPage == endPage & endPage != 1){
					        		 var paging2 = '<li><a href="javascript:clickNextField('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage+'</a></li>';	
					        		 paging.html(paging2).insertAfter(".blog-list-content > div:last");
					        	 }else{
					        		 var paging3 = '<li><a href="javascript:clickNextField('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage +'</a></li><li><a href="javascript:clickNextField('+curPagePlus+')">next &gt</a></li>';
					        		 paging.html(paging3).insertAfter(".blog-list-content > div:last");
					        	 } */
					        	
					        }
	               
					 });
	             }
	      		
	             function popup(lectureno){
	            		
	            	var lectureno = lectureno;
	            	window.open('../compiler/Compiler.action?lectureno='+lectureno,'pop','resizable=no scrollbars=yes top=50 left=200 width=1800 height=800'); 
	            		
	            }
	      		
	                //slide effect 시작
	                if ($(this).hasClass('active')==false) {
	                	$('.table-item')
	                        .find('.thead')
	                        .removeClass('active')
	                        .siblings('.tbody')
	                            .slideUp(200);
	                	
	                	$('.table-item')
	                    .find('.thead').children().children().children().html('');
	                    
	                }
	                	$(this)
	                    .toggleClass('active')
	                    .siblings('.tbody')
	                        .slideToggle(200);
	                	//slide effect 종료
	               
	               
	                	/*  var divTag = $('<div class="tbody"></div>');
			 				divTag.html('<div class="item"><div class="submissions">Title</div><div class="total-subm">Submited</div><div class="replied">Replied</div><div class="latest-reply">11. Jul , 2014</div><div class="link tb-icon"><a href="#"><i class="fa fa-play-circle-o"></i></a></div></div>')
			 				.insertAfter($(this));     */        
	                
	           				
	                   
	        });
	    });
	});

</script>

</body>
</html>