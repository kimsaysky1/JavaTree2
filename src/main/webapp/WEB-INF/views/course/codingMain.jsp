<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- <script src="/views/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
		
	$('#myFriends').on('click', function(){
		$.ajax({
			method : 'GET'
			, url:'Friends'
			, dataType : "json"
			, success: function(response){
		
				var a="";
				
				$.each(response.list, function(index, item){
					var name= item.name;
					var age= item.age;
					var phone= item.phone;
					a=a+"<p>name: "+name+",age: "+age+"phone: "+phone+"</p>";
				});
				$('.result_all').html(a);
			}
			, error: function(){
				
			}
		});
		
	});
	
	//
	
	$('#insert').on('click', function(){
		alert("옴");
		var temp = $('.result_insert').text();
		alert(temp[0].value);
	//	var insertArray = [temp];
		
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
			method : 'POST'
			, url:'insert'
			, data : /* temp : $.param({temp:temp}, true) */
					JSON.stringify({temp:temp})	
			, dataType : "json"
			, success: function(response){
				$('#result').html(response.messege);
			}
			, error: function(){
				
			}
		});
		
	});
	
	/*  $('#insert').on('click', function(){
			alert("옴");
			$("<p>"+$(this).text()+"</p>").appendTo('.result_insert');
			
		});  */
	/* $('.result_all').unbind('click'); */
	$('.result_all').undelegate( $(this), "click");
	$('.result_all').delegate('p','click', function(){
		 
		//$(this).after("<p>"+$(this).text()+"</p>");
		//alert($(this).text());
	
		
		$("<p>"+$(this).text()+"</p>").appendTo('.result_insert');
		if($('#example').is(":visible")){  
			$('.result_insert').css('display','block');
		}
		
	});
       /*  $("#show-example").click(function () {
           if ($('#example').is(":visible")) {
               $(this).html($(this).html().replace(/Hide/, 'Show'));
           } else {
               $(this).html($(this).html().replace(/Show/, 'Hide'));
           }
           // Do it afterwards as the operation is async
           $("#example").slideToggle("slow");
        });
	 */
	
	/*  $("#element").unbind("click").bind("click",function(){
		        alert("click!!");
		    });
		 
		 $(this).find(".wbannerarrow.left").unbind().bind("click", function(){ */
	
			 
	$('.result_insert').delegate('p','click', function(){
		alert($(this).text());
		$(this).remove();
	});
	
});
</script> -->

</head>
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
										<a href="#">
											<h6>MAIN</h6>
										</a>
									</div>


								</li>

								<li>
									<div class="list-body">
										<a href="#">
											<h6>INSERT</h6>
										</a>
									</div>


								</li>

								<li>
									<div class="list-body">
										<a href="#">
											<h6>UPDATE</h6>
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
									<select multiple="multiple" id='lstBox1' style='width: 400px; height: 600px;' >
										<option value="ajax">Ajax</option>
										<option value="jquery">jQuery</option>
										<option value="javascript">JavaScript</option>
										<option value="mootool">MooTools</option>
										<option value="prototype">Prototype</option>
										<option value="dojo">Dojo</option>
									</select>
								</td>
								<td style='width: 50px; text-align: center; vertical-align: middle;'>
									<input type='button' id='btnRight' value='  >  ' /> <br />
									<input type='button' id='btnLeft' value='  <  ' />
								</td>
								<td style='width: 400px;'><b>SELECTED QUESTION </b><br /> 
									<select multiple="multiple" id='lstBox2' style='width: 400px; height: 600px;'>
										<option value="asp">ASP.NET</option>
										<option value="c#">C#</option>
										<option value="vb">VB.NET</option>
										<option value="java">Java</option>
										<option value="php">PHP</option>
										<option value="python">Python</option>
									</select></td>
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

    $('#btnRight').click(function(e) {
        var selectedOpts = $('#lstBox1 option:selected');
        if (selectedOpts.length == 0) {
            alert("Nothing to move.");
            e.preventDefault();
        }

        $('#lstBox2').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });

    $('#btnLeft').click(function(e) {
        var selectedOpts = $('#lstBox2 option:selected');
        if (selectedOpts.length == 0) {
            alert("Nothing to move.");
            e.preventDefault();
        }

        $('#lstBox1').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });
});
</script>
	

</body>
</html>