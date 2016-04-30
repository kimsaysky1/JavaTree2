<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<script type="text/javascript" src="script/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="script/jquery-ui.min.js" ></script>    
<title>JavaTree(Q&A) Main</title>
</head>
<body>
		<%@include file="/resources/header2.jsp" %>
		
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
		<div id="mid-qna" class="mid-qna">
			<div class="container">
		 <div class="qna-list">
		 
		 <h2>JAVATreeBoard</h2>
		 
		 <div class = "qna-list-option">
		 <div class="qna-list-field">
			 <fieldset>
			 <legend>Field</legend>
			 <input type="checkbox" name="interest" value="1" onchange="javascript:selectByField(this)" />&nbsp;<label>PUREJAVA</label>
			 &nbsp;<input type="checkbox" name="interest" value="2" onchange="javascript:selectByField(this)" />&nbsp;<label>WEB</label>
			 &nbsp;<input type="checkbox" name="interest" value="3" onchange="javascript:selectByField(this)" />&nbsp;<label>MOBILE</label>
			 &nbsp;<input type="checkbox" name="interest" value="4" onchange="javascript:selectByField(this)" />&nbsp;<label>IOT</label>
			 &nbsp;<input type="checkbox" name="interest" value="5" onchange="javascript:selectByField(this)" />&nbsp;<label>SWING</label>
			 &nbsp;<input type="checkbox" name="interest" value="6" onchange="javascript:selectByField(this)" />&nbsp;<label>JDBC</label>
			 &nbsp;<input type="checkbox" name="interest" value="7" onchange="javascript:selectByField(this)" />&nbsp;<label>API</label>
			 <br>
			 <input type="checkbox" name="interest" value="8" onchange="javascript:selectByField(this)" />&nbsp;<label>SPRING</label>
			 &nbsp;<input type="checkbox" name="interest" value="9" onchange="javascript:selectByField(this)" />&nbsp;<label>STRUTS</label>
			 <input type="checkbox" name="interest" value="10" onchange="javascript:selectByField(this)" />&nbsp;<label>etcFramework</label>
			 &nbsp;<input type="checkbox" name="interest" value="11" onchange="javascript:selectByField(this)" />&nbsp;<label>ETC</label>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value = "SEARCH" class = "mc-btn-7 btn-style-1" id="searchByCheckBox" />
       </fieldset>
       </div>
       
       <div class = "course-list-list">
       <fieldset>
       <legend>List</legend>
       <br>
       <select name="listoption" style="width: 120px; height: 30px;">
       <option value="new">최신순</option>
       <option value="old">오래된 순</option>
       </select>
		 </fieldset>
		 </div>
		 </div>
			<div class="blog-list-content">
					<s:iterator value="questionList" status="incr">
						<!-- POST -->
                        <div class="post" id = "<s:property value="%{#incr.index+1}"/>">                      
                            <!-- POST BODY -->
                            <div class="post-body">
                                <div class="post-title">
                                    <h3 class="md"><a href="qnaDetail.action?questionno=<s:property value="questionno"/>"><s:property value="title"/></a></h3>
                                </div>
                                <div class="post-meta">
                                    by <a href="#"><s:property value="username"/></a> <s:property value="regdate"/>
                                </div>                                           
                            </div>
                            <!-- END / POST BODY -->
                        </div>
                        <!-- END / POST -->
					</s:iterator>
                        <ul class="pager">
                            
                            <li><a href="#" id= "watchMore">더보기</a></li>
                        </ul>
                    </div>
                </div>
                
                 <!-- SIDEBAR -->
                <div class = "qna-side">
                    <aside class="blog-sidebar">
                    
                    	<!-- 질문 버튼 -->
                    	
                    	<div class="form-submit-1">
                    		<form action="insertQuestion" name="insertQuestion" method="get">
								<input type="button" value="WRITE QUESTION" class="mc-btn btn-style-1" data-toggle="modal" data-target="#writeQuestion"/>
                    			<div class="container">
									<div class="modal fade" id="writeQuestion" role="dialog">
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
													<td><select id="typeno" name="typeno" style="width: 100px;">
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
													<td><textarea id="question.title" name="question.title" style="height: 100px;"></textarea></td>
												</tr>
												<tr>
													<td style='height: 20px;'></td>
													<td></td>
												</tr>
												<tr>
													<td style='width: 100px; text-align:center;'><b>content</b></td>
													<td><textarea id="question.content" name="question.content" style="height: 250px;"></textarea></td>
												</tr>
													<tr>
													<td style='height: 20px;'></td>
													<td></td>
												</tr>
												</table>
									        </div>
									        <div class="modal-footer">
									        	<input type="submit" value="등록" class="mc-btn-5">&nbsp;&nbsp;&nbsp;
												<input type="reset" value="취소" class="mc-btn-5">
									          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
									        </div>
									      </div>
								  	   </div>
								  </div>
                    		</div>
                    		</form> <!-- id = "insertQuestionReady"  btn btn-info btn-lg-->
						</div>
                    	
                    	<!-- 질문 버튼 끝 -->
                    	<br><br>

                        <!-- WIDGET SEARCH -->
                        <div class="widget widget_search">
                            <h4 class="sm">Search in JAVATree</h4>
                            <form>
                                <div class="form-item">
                                    <input type="text">
                                </div>
                                <div class="form-actions">
                                    <input type="submit">
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
                        
                        <!-- 궁금도 랭킹 -->
                            <div class="tab-pane fade in active" id="design-question">                               
                                <table class="table-quest">
                                    <tbody>
                                    	<s:iterator value="bestAllQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>">답변자: <s:property value="id"/> - <s:property value="title"/></a></td>                                          
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
                                        <s:iterator value="bestRecentQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>">답변자: <s:property value="id"/> - <s:property value="title"/></a></td>                                          
	                                        </tr>
                                    	</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN ASSIGNMENT -->
    
                        </div>
                        <!-- 내용 끝 -->
                        <!-- 베스트 랭킹 탭 끝 -->
                        
                       
                        <!-- 궁금 랭킹 탭 -->
						
						<h4 class="sm">GUNGGUM RANKING</h4>
						<!-- 탭ㅂㅂㅂㅂㅂ -->
						<div class="tab-content">
                            <ul class="design-course-tabs" role="tablist">
                            <li>
                                <a href="#design-question1" role="tab" data-toggle="tab">Total RANK</a>
                            </li>
                            <li>
                                <a href="#design-assignment1" role="tab" data-toggle="tab">Recent RANK</a>
                            </li>
                        </ul>
                        <!-- 탭 끝 -->
                        <!--  탭 내용  -->
                        
                        <!-- 궁금 랭킹 -->
                            <div class="tab-pane fade in active" id="design-question1">                               
                                <table class="table-quest">
                                    <tbody>
 										<s:iterator value="gunggumAllQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>">질문자: <s:property value="id"/> -<s:property value="title"/></a></td>                                          
	                                        </tr>
                                    	</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <div class="tab-pane fade" id="design-assignment1">
                                
                                <table class="table-assignment">
                                    <tbody>
                                        <s:iterator value="gunggumRecentQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>"><s:property value="title"/></a></td>                                          
	                                        </tr>
                                    	</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN ASSIGNMENT -->
    
                        </div>
                        <!-- 내용 끝 -->
                        <!-- 궁금도 랭킹 탭 끝 -->
                       
                    </aside>
                    </div>
                <!-- END / SIDEBAR -->
                
			</div>
		</div>
		 
		 </section>
	
	<div class="container">
  <!-- Modal -->
  
  
</div>
	
<%@include file="/resources/footer.jsp" %>
	
	<!-- Load jQuery -->
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript" src="../resources/javatree_view/html/js/scripts.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		$('#insertQuestionReady').on('click', function(){
			insertQuestion.submit();
		});
		
		$("body").on('click', "#searchByCheckBox", function(){
			var stringForTokenizer = '';
			var test = $("[name=interest]");
			for(var i = 0; i < test.length; i++){
				if(test[i].checked){
					stringForTokenizer += test[i].value + ',';
				}
			}
			$.ajax({
				type: 'GET'
					, url: 'searchListByInterest'
					, data : 'stringForTokenizer='+stringForTokenizer
					, dataType : 'json'
					, success : function(response){
						var list = response.questionList;
						var indexNum = 1;
						$('.blog-list-content').html('');
						list.forEach(function(question){
							var divTag = $('<div class="post" id='+(indexNum++)+'><div class="post-body"></div></div>');
							divTag.html('<div class="post-title"><h3 class="md"><a href="qnaDetail.action?questionno='+question.questionno+'">'
							+question.title+'</a></h3></div><div class="post-meta">by'
							+question.username+' '+question.regdate+'</div>').appendTo(".blog-list-content");
						});
						$('<ul class="pager"><li><a href="#" id= "watchMore">더보기</a></li></ul>').appendTo('.blog-list-content');
					}	
			});
		});
		
		$("body").on('click', '#watchMore', function(){
			var start = $(".blog-list-content > div:last").attr('id');
			start = parseInt(start) + 1;
			var end = start + 4;
			var stringForTokenizer = '';
			var test = $("[name=interest]");
			for(var i = 0; i < test.length; i++){
				if(test[i].checked){
					stringForTokenizer += test[i].value + ',';
				}
			}
			$.ajax({
				type: 'GET'
				, url: 'plusQnaDefaultMain'
				, data : 'start='+start+'&end='+end+'&stringForTokenizer='+stringForTokenizer
				, dataType : 'json'
				, success : function(response){
					var indexNum = start;
					var list = response.questionList;
					list.forEach(function(question){
						var divTag = $('<div class="post" id='+(indexNum++)+'><div class="post-body"></div></div>');
						divTag.html('<div class="post-title"><h3 class="md"><a href="qnaDetail.action?questionno='+question.questionno+'">'
						+question.title+'</a></h3></div><div class="post-meta">by'
						+question.username+' '+question.regdate+'</div>').insertAfter(".blog-list-content > div:last");
					});
				}
			});
			//event.preventDefault(); 
		});
	});
	</script>
</body>
</html>