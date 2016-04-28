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
<title>강좌 메인</title>
</head>
<body>

	<%@include file="/resources/header.jsp" %>
	
	<section class="sub-banner sub-banner-course">
        <div class="awe-static bg-sub-banner-course"></div>
        <div class="container">
            <div class="sub-banner-content">
                <h2 class="text-center">JAVATree</h2>
            </div>
        </div>
    </section>
		<!-- 가운데 영역 -->
		<section class="blog">
		<div id="mid-course" class="mid-course">
			<div class="container">
		 <div class="course-list">
		 
		 <h2>COURSE-Board</h2>
		  <br>
		 <div class = "course-list-option">
		 <div class="course-list-field">
		 <fieldset>
		 <legend>Field</legend>
		 <form name="form">
		 <input type="checkbox" name="interest" value="1" onchange="javascript:selectByField(this)"/>&nbsp;<label>PUREJAVA</label>
		 &nbsp;<input type="checkbox" name="interest" value="2" onchange="javascript:selectByField(this)"/>&nbsp;<label>WEB</label>
		 &nbsp;<input type="checkbox" name="interest" value="3" onchange="javascript:selectByField(this)"/>&nbsp;<label>MOBILE</label>
		 &nbsp;<input type="checkbox" name="interest" value="4" onchange="javascript:selectByField(this)"/>&nbsp;<label>IOT</label>
		 &nbsp;<input type="checkbox" name="interest" value="5" onchange="javascript:selectByField(this)"/>&nbsp;<label>SWING</label>
		 &nbsp;<input type="checkbox" name="interest" value="6" onchange="javascript:selectByField(this)"/>&nbsp;<label>JDBC</label>
		 &nbsp;<input type="checkbox" name="interest" value="7" onchange="javascript:selectByField(this)"/>&nbsp;<label>API</label>
		 <br>
		 <input type="checkbox" name="interest" value="8" onchange="javascript:selectByField(this)"/>&nbsp;<label>SPRING</label>
		 &nbsp;<input type="checkbox" name="interest" value="9" onchange="javascript:selectByField(this)"/>&nbsp;<label>STRUTS</label>
		 <input type="checkbox" name="interest" value="10" onchange="javascript:selectByField(this)"/>&nbsp;<label>etcFramework</label>
		 &nbsp;<input type="checkbox" name="interest" value="11" onchange="javascript:selectByField(this)"/>&nbsp;<label>ETC</label>
		 </form>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <!-- <input type="button" value = "SEARCH" class = "mc-btn-7 btn-style-1" id="searchByField"> -->
       
       </fieldset>
       </div>
       
      <s:if test="interestList != null">
       		<script>
       		
       			var interests = document.getElementsByName("interest");
       			
       			var list = "${interestList}";
       	   		//alert(list + typeof list);
       	   		
       	   		var str = list.split(',');
       	   		var strStart = str[0].substring(1); //시작
       	   		for(j = 0; j < interests.length; j++){
	 				if(interests[j].value == strStart){
	 				interests[j].checked = true;
	 				}
	 				      	 					
	 				}
       	   		
       	   		//alert("s길이> " + strStart);
       	   		
       	   if(str.length-1 != 0){
       	   			var end = str.length-1;
       	   			Number(end);
       	   		var strEnd = str[end].split(']');
       	  
       	   	var strEndk = strEnd[0].substr(1, 1);  // 끝
       	 for(j = 0; j < interests.length; j++){
 				if(interests[j].value == strEndk){
 				interests[j].checked = true;
 				}
 				      	 					
 				} 
       	   	//alert("StrEndk>> " + strEndk[0] +"/" + strEndk[0].length);
       	   		
       	   		var ano;
       	   		for (i = 1; i < str.length-1; i++) {
       	   			var tmp= str[i].substr(1, 1);
       	 			//여기서 돌리자
			       	  
       	 			for(j = 0; j < interests.length; j++){
       	 				if(interests[j].value == tmp[0]){
       	 				interests[j].checked = true;
       	 				}
       	 				      	 					
       	 				} 
       	 			}//중간
       	   		} 
       	   		
       		</script>
       		</s:if>
       
       <div class = "course-list-list">
       <fieldset>
       <legend>List</legend>
       <br>
       <select name="listoption" id="listoption" style="width: 120px; height: 30px;" onchange="javascript:selectEvent(this)">
       <option value="desc" selected="selected">최신순</option>
       <option value="asc">오래된 순</option>
       </select>
      
		 </fieldset>
		 </div>
		 </div>
			
<!-- 강좌 리스트 뿌리기 시작 -->			
<div class="blog-list-content">
     
     <s:iterator value="courseList" status="incr">
     	
		<!-- start post -->
     			
                     <div class="post" id = "<s:property value="%{#incr.index+1}"/>"> 
                            <div class="post-body">
                                <div class="post-title">
                                    <h3 class="md"><a href="selectCourseDefaultDetail.action?courseno=<s:property value="courseno" />">
                                    <s:property value="coursename" /></a></h3>
                                </div>
                                	<div class="post-meta">
                                    	by <a href="#"><s:property value="username" /></a> on <s:property value="regdate" />
                                	</div>  
                                   <div class="post-link">
                                    <a href="blog-single.jsp?courseno=<s:property value="courseno" />">
                                        <i class="fa fa-play-circle-o"></i>
                                        Lecture List
                                    </a>
                                	</div>                           
                            </div>
                     </div> 
                     
		<!-- end post -->     
     </s:iterator>
     
          <s:iterator value="recourseList" status="incr">
     	
		<!-- start post -->
     			
                     <div class="post" id = "<s:property value="%{#incr.index+1}"/>"> 
                            <div class="post-body">
                                <div class="post-title">
                                    <h3 class="md"><a href="selectCourseDefaultDetail.action?courseno=<s:property value="courseno" />">
                                    <s:property value="coursename" /></a></h3>
                                </div>
                                	<div class="post-meta">
                                    	by <a href="#"><s:property value="username" /></a> on <s:property value="regdate" />
                                	</div>  
                                   <div class="post-link">
                                    <a href="blog-single.jsp?courseno=<s:property value="courseno" />">
                                        <i class="fa fa-play-circle-o"></i>
                                        Lecture List
                                    </a>
                                	</div>                           
                            </div>
                     </div> 
                     
		<!-- end post -->     
     </s:iterator>
     
         
             <ul class="pager">                
            
            
            <s:if test="#session.currentPage == 1 & #session.endPageGroup == 1">
             <li><a href = "#"> <s:property value="#session.currentPage"/> </a></li>
             </s:if>
            
            <s:elseif test="#session.currentPage == 1 & #session.endPageGroup != 1">
            <li><a href = "#"> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/></a></li>
             <li><a href = "plusCourseDefaultMain.action?currentPage=<s:property value="#session.currentPage + 1"/>">next &gt</a></li>
            </s:elseif>
			
			<s:elseif test="#session.currentPage == #session.endPageGroup & #session.endPageGroup != 1">
             <li><a href = "plusCourseDefaultMain.action?currentPage=<s:property value="#session.currentPage - 1"/>">&lt prev</a></li>
            <li> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/></li>
            </s:elseif>
			
			<s:else>
             <li><a href = "plusCourseDefaultMain.action?currentPage=<s:property value="#session.currentPage - 1"/>">&lt prev</a></li>
             <li> <s:property value="#session.currentPage"/> / <s:property value="#session.endPageGroup"/> </li>
             <li><a href = "plusCourseDefaultMain.action?currentPage=<s:property value="#session.currentPage + 1"/>">next &gt</a></li>
            </s:else>
                            </ul>
                    </div>
                
                <div id="display"></div>
                </div>
                
                 <!-- SIDEBAR -->
                <div class = "course-side">
                    <aside class="blog-sidebar">
  
                        <!-- WIDGET SEARCH -->
                        <div class="widget widget_search">
                            <h4 class="sm">Search Course</h4>
                            <form>
                                <div class="form-item">
                                    <input type="text" id="searchText">
                                </div>
                                <div class="form-actions">
                                    <input type="submit" id="searchIcon">
                                </div>
                            </form>
                        </div>
                        <!-- END / WIDGET SEARCH -->
                        
                        <!-- 베스트 랭킹 탭 1 -->
						
						<h4 class="sm">BEST RANKING</h4>
						<!-- 탭ㅂㅂㅂㅂㅂ -->
						<div class="tab-content">
                            <ul class="design-course-tabs" role="tablist">
                            <li>
                                <a href="#design-question" role="tab" data-toggle="tab">Total RANK</a>
                            </li>
                            
                            <li>
                                <a href="#design-assignment" role="tab" data-toggle="tab">Recent RANK</a>
                            </li>
                        </ul>
                        <!-- 탭 끝 -->
                        <!--  탭 내용  -->
                        
                        <!-- 베스트 최근 랭킹 -->
                            <div class="tab-pane fade in active" id="design-question">                               
                                <table class="table-quest">
                                    <tbody>
										
                                        <s:iterator value="allRank" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><a href="selectCourseDefaultDetail.action?courseno=<s:property value="courseno" />"><s:property value="coursename" /></a> &nbsp;[ &nbsp;ID: &nbsp; <s:property value="id" /> &nbsp; ]</td>                                          
                                        </tr>
										</s:iterator>
										
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <div class="tab-pane fade" id="design-assignment">
                                
                                <table class="table-assignment">
                                    <tbody>
                                        <s:iterator value="recentRank" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><a href="selectCourseDefaultDetail.action?courseno=<s:property value="courseno" />"><s:property value="coursename" /></a>&nbsp;[ID: &nbsp;<s:property value="id" />&nbsp; ]</td>                                          
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

	<!-- FOOTER -->
	<footer id="footer" class="footer">
		<div class="second-footer">
			<div class="container">
				<div class="contact">
					<div class="email">
						<i class="icon md-email"></i> <a href="#">course@megadrupal.com</a>
					</div>
					<div class="phone">
						<i class="fa fa-mobile"></i> <span>+84 989 999 888</span>
					</div>
					<div class="address">
						<i class="fa fa-map-marker"></i> <span>Maecenas sodales,nisl eget</span>
					</div>
				</div>
				<p class="copyright">Copyright © 2014 Megadrupal. All rights reserved.</p>
			</div>
		</div>
	</footer>
	<!-- END / FOOTER -->
	
	<!-- Load jQuery -->
	<script src="../resources/jquery-2.2.3.min.js"></script>
	<script src="../resources/jquery-ui.min.js"></script>
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
		
<script>

function clickNext(page) {
 	Number(page);
	var temp = page;
 	$.ajax({
	        type : 'get', 
	        url : 'plusSearchCourse',
	        data : "currentPage="+temp,
	        success : function(response){
	        	
	        	$(".blog-list-content").html(' ');
	        		
	        	 var list = response.courseList;
	        	 list.forEach(function(course){
	 				var divTag = $('<div class="post"><div class="post-body"></div></div>');
	 				divTag.html('<div class="post-title"><h3 class="md"><a href="selectCourseDefaultDetail.action?courseno='+course.courseno+'">'
	 				+course.coursename+'</a></h3></div><div class="post-meta">by'
	 				+course.username+' on '+course.regdate+'</div><div class="post-link"><a href="blog-single.jsp?courseno='+course.courseno
	 				+'"><i class="fa fa-play-circle-o"></i>Lecture List</a></div>').appendTo(".blog-list-content");
	 			
	 			});
	        	 
	        	 var curPage = Number(response.currentPage);
	        	 var curPagePlus = Number(response.currentPage+1);
	        	 var curPageMinus = Number(response.currentPage-1);
	        	 var endPage =  Number(response.endPageGroup);
	        	 			        	 
	        	 var paging = $('<ul class="pager"></ul>');
	        	 if(curPage == 1 & endPage == 1){
	        		 var paging0 = '<li><a href="#">'+ curPage +'</a></li>';
	        		 paging.html(paging0).insertAfter(".blog-list-content > div:last");
	        	 }else if(curPage == 1 & endPage != 1){
	        		 var paging1 = '<li><a href="#">'+ curPage +' / '+endPage+'</a></li><li><a href="javascript:clickNext('+curPagePlus+')">next &gt</a></li>';
	        		 paging.html(paging1).insertAfter(".blog-list-content > div:last");
	        	 }else if(curPage == endPage & endPage != 1){
	        		 var paging2 = '<li><a href="javascript:clickNext('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage +'</a></li>';	
	        		 paging.html(paging2).insertAfter(".blog-list-content > div:last");
	        	 }else{
	        		 var paging3 = '<li><a href="javascript:clickNext('+curPageMinus+')">&lt prev</a></li>/'+endPage+'<li><a href="#">'+ curPage+' / '+endPage+'</a></li><li><a href="javascript:clickNext('+curPagePlus+')">next &gt</a></li>';
	        		 paging.html(paging3).insertAfter(".blog-list-content > div:last");
	        	 }
	        
	        }
	 
	 });
	 event.preventDefault(); 
}	
	
function clickNextField(page) {
 	Number(page);
	var temp = page;
	
	var str = '';	
	var cnt;
	 $(":checkbox:checked").each(function(index){
	        if(index == cnt-1){
	        	str += $(this).val();
	        }else{
	        	str += $(this).val()+",";
	        }
	    });
	 
	
	$.ajax({
 		 type : 'get', 
	        url : 'plusSelectListbyField',
	        data : "interestString="+str+"&currentPage="+temp,
	        success : function(response){
	        	
	        	$(".blog-list-content").html(' ');
	        		
	        	 var list = response.courseList;
	        	 list.forEach(function(course){
	 				var divTag = $('<div class="post"><div class="post-body"></div></div>');
	 				divTag.html('<div class="post-title"><h3 class="md"><a href="selectCourseDefaultDetail.action?courseno='+course.courseno+'">'
	 				+course.coursename+'</a></h3></div><div class="post-meta">by'
	 				+course.username+' on '+course.regdate+'</div><div class="post-link"><a href="blog-single.jsp?courseno='+course.courseno
	 				+'"><i class="fa fa-play-circle-o"></i>Lecture List</a></div>').appendTo(".blog-list-content");
	 			
	 			});
	        	 
	        	 var curPage = Number(response.currentPage);
	        	 var curPagePlus = Number(response.currentPage+1);
	        	 var curPageMinus = Number(response.currentPage-1);
	        	 var endPage =  Number(response.endPageGroup);
	        	 			        	 
	        	 var paging = $('<ul class="pager"></ul>');
	        	 if(curPage == 1 & endPage == 1){
	        		 var paging0 = '<li><a href="#">'+ curPage +'</a></li>';
	        		 paging.html(paging0).insertAfter(".blog-list-content > div:last");
	        	 }else if(curPage == 1 & endPage != 1){
	        		 var paging1 = '<li><a href="#">'+ curPage+' / '+endPage +'</a></li><li><a href="javascript:clickNextField('+curPagePlus+')">next &gt</a></li>';
	        		 paging.html(paging1).insertAfter(".blog-list-content > div:last");
	        	 }else if(curPage == endPage & endPage != 1){
	        		 var paging2 = '<li><a href="javascript:clickNextField('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage +'</a></li>';	
	        		 paging.html(paging2).insertAfter(".blog-list-content > div:last");
	        	 }else{
	        		 var paging3 = '<li><a href="javascript:clickNextField('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage +'</a></li><li><a href="javascript:clickNextField('+curPagePlus+')">next &gt</a></li>';
	        		 paging.html(paging3).insertAfter(".blog-list-content > div:last");
	        	 }
	        
	        }
	 
	 });
	 event.preventDefault(); 
}		
	
function selectByField(asd) {
	 
	var order;
	
	var sum = 0;
	 sum = $(":checkbox:checked").length;
	 
	 if(sum > 5){
		 alert( sum + "개 이상은 선택할 수 없습니다." );	
		 $(asd).prop("checked",false);	 
	 }
	
	    $( "select option:selected" ).each(function() {
	    	order = $( this ).val();
	    });
	    
	 var str = '';	
	 var cnt;
	 $(":checkbox:checked").each(function(index){
	        if(index == cnt-1){
	        	str += $(this).val();
	        }else{
	        	str += $(this).val()+",";
	        }
	    });
	 
	 
	 $.ajax({
	        type : 'get', 
	        url : 'selectListbyField',
	        data : "interestString="+str+"&order="+order,
	        success : function(response){
	        	$(".blog-list-content").html(' ');
        		
	        	 var list = response.courseList;
	        	 list.forEach(function(course){
	 				var divTag = $('<div class="post"><div class="post-body"></div></div>');
	 				divTag.html('<div class="post-title"><h3 class="md"><a href="selectCourseDefaultDetail.action?courseno='+course.courseno+'">'
	 				+course.coursename+'</a></h3></div><div class="post-meta">by'
	 				+course.username+' on '+course.regdate+'</div><div class="post-link"><a href="blog-single.jsp?courseno='+course.courseno
	 				+'"><i class="fa fa-play-circle-o"></i>Lecture List</a></div>').appendTo(".blog-list-content");
	 			});
	        	 
	        	 var curPage = Number(response.currentPage);
	        	 var curPagePlus = Number(response.currentPage+1);
	        	 var curPageMinus = Number(response.currentPage-1);
	        	 var endPage =  Number(response.endPageGroup);
	        	 			        	 
	        	 var paging = $('<ul class="pager"></ul>');
	        	 if(curPage == 1 & endPage == 1){
	        		 var paging0 = '<li><a href="#">'+ curPage +'</a></li>';
	        		 paging.html(paging0).insertAfter(".blog-list-content > div:last");
	        	 }else if(curPage == 1 & endPage != 1){
	        		 var paging1 = '<li><a href="#">'+ curPage+' / '+endPage +'</a></li><li><a href="javascript:clickNextField('+curPagePlus+')">next &gt</a></li>';
	        		 paging.html(paging1).insertAfter(".blog-list-content > div:last");
	        	 }else if(curPage == endPage & endPage != 1){
	        		 var paging2 = '<li><a href="javascript:clickNextField('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage +'</a></li>';	
	        		 paging.html(paging2).insertAfter(".blog-list-content > div:last");
	        	 }else{
	        		 var paging3 = '<li><a href="javascript:clickNextField('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage+'</a></li><li><a href="javascript:clickNextField('+curPagePlus+')">next &gt</a></li>';
	        		 paging.html(paging3).insertAfter(".blog-list-content > div:last");
	        	 }
	        
	        }
	 
	 });
	 str = '';
	 
}	
	

$(function(){
	 
	searchCourse();
	
});

function searchCourse() {
	$("#searchIcon").on("click", function(){
	 	
	 	var text = '';
	 	text = $("#searchText").val();
		 
		 $(":checkbox:checked").each(function(index){
		        $(this).prop("checked",false);
		    });
	 	
	 	$.ajax({
		        type : 'get', 
		        url : 'searchCourse',
		        data : "searchText="+text,
		        success : function(response){
		        	
		        	$(".blog-list-content").html(' ');
		        		
		        	 var list = response.courseList;
		        	 list.forEach(function(course){
		 				var divTag = $('<div class="post"><div class="post-body"></div></div>');
		 				divTag.html('<div class="post-title"><h3 class="md"><a href="selectCourseDefaultDetail.action?courseno='+course.courseno+'">'
		 				+course.coursename+'</a></h3></div><div class="post-meta">by'
		 				+course.username+' on '+course.regdate+'</div><div class="post-link"><a href="blog-single.jsp?courseno='+course.courseno
		 				+'"><i class="fa fa-play-circle-o"></i>Lecture List</a></div>').appendTo(".blog-list-content");
		 			
		 			});
		        	 
		        	 var curPage = Number(response.currentPage);
		        	 var curPagePlus = Number(response.currentPage+1);
		        	 var curPageMinus = Number(response.currentPage-1);
		        	 var endPage =  Number(response.endPageGroup);
		        	 			        	 
		        	 var paging = $('<ul class="pager"></ul>');
		        	 if(curPage == 1 & endPage == 1){
		        		 var paging0 = '<li><a href="#">'+ curPage +'</a></li>';
		        		 paging.html(paging0).insertAfter(".blog-list-content > div:last");
		        	 }else if(curPage == 1 & endPage != 1){
		        		 var paging1 = '<li><a href="#">'+ curPage+' / '+endPage+'</a></li><li><a href="javascript:clickNext('+curPagePlus+')">next &gt</a></li>';
		        		 paging.html(paging1).insertAfter(".blog-list-content > div:last");
		        	 }else if(curPage == endPage & endPage != 1){
		        		 var paging2 = '<li><a href="javascript:clickNext('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage+ '</a></li>';	
		        		 paging.html(paging2).insertAfter(".blog-list-content > div:last");
		        	 }else{
		        		 var paging3 = '<li><a href="javascript:clickNext('+curPageMinus+')">&lt prev</a></li><li><a href="#">'+ curPage+' / '+endPage+ '</a></li><li><a href="javascript:clickNext('+curPagePlus+')">next &gt</a></li>';
		        		 paging.html(paging3).insertAfter(".blog-list-content > div:last");
		        	 }
		        
		        }
		 
		 });
		 event.preventDefault();
 });
}

	 // combobox 클릭시 이벤트 지정
	 function selectEvent(selectObj)
	 {		
		 var sum = 0;
		 sum = $(":checkbox:checked").length;
		 var order;
		 if(sum == 0){
			 alert("한 분야 이상은 선택해야 합니다.");	
		 }else{
			 order = selectObj.value;
			
				 var str = '';	
				 var cnt;
				 $(":checkbox:checked").each(function(index){
				        if(index == cnt-1){
				        	str += $(this).val();
				        }else{
				        	str += $(this).val()+",";
				        }
				    });
				 
				 $.ajax({
				        type : 'get', 
				        url : 'selectListbyField',
				        data : "interestString="+str+"&order="+order,
				        success : function(response){
				        	$(".blog-list-content").html(' ');
			        		
				        	 var list = response.courseList;
				        	 list.forEach(function(course){
				 				var divTag = $('<div class="post"><div class="post-body"></div></div>');
				 				divTag.html('<div class="post-title"><h3 class="md"><a href="selectCourseDefaultDetail.action?courseno='+course.courseno+'">'
				 				+course.coursename+'</a></h3></div><div class="post-meta">by'
				 				+course.username+' on '+course.regdate+'</div><div class="post-link"><a href="blog-single.jsp?courseno='+course.courseno
				 				+'"><i class="fa fa-play-circle-o"></i>Lecture List</a></div>').appendTo(".blog-list-content");
				 			
				 			});
				        	 
				        	 var curPage = Number(response.currentPage);
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
				        	 }
				        
				        }
				 
				 });
				 str = '';
				 
			}	
			 
		 }
</script>
	
</body>
</html>