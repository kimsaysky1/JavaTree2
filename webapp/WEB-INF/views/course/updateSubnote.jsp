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
<title>updateLecture</title>
<script>
function updateSubnoteForm(){
	var form = document.getElementById("updateSubnoteForm");
	//opener.document.getElementById("lectureno").value = lectureno;
	
	form.submit();
}
function closeWindow() {
	this.close();
}
</script>

</head>
<body>
       <section id="create-course-section" class="create-course-section">
        <div class="container">
    
		 <div class="mid-insert-lecture">
		 
		    <h2>update Subnote</h2>
<form action="updateSubnote" method="post" id="updateSubnoteForm" enctype="multipart/form-data"> 	
<input type="hidden" name="courseno" value='<s:property value="courseno"/>'>	
<input type="hidden" name="lectureno" value='<s:property value="lectureno"/>'>
                    <div class="create-course-content">

                        <!-- PROMO VIDEO -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Upload Video</h4><%-- <s:property value="courseno"/> --%>
                                </div>
                                <div class="create-course-2">
                                    <div class="upload-video up-file">                                      
                                        <a href="#"><i class="icon md-upload"></i>Upload Subnote</a>
                                        <input type="file" name ="upload"/>
                                        <%-- <s:file name="uploads" /> --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->
                        
                       
  						<div class="form-action">
                           <%--  <input type="submit" value="Save and Next" onclick="javascript:updateLectureForm('<s:property value="lectureno"/>')" class="submit mc-btn-3 btn-style-1"> --%>
                            <input type="submit" value="Update" onclick="javascript:updateSubnoteForm()" class="submit mc-btn-3 btn-style-1">
                            <input type="button" value="Cancel" class="submit mc-btn-3 btn-style-1" id="close" onclick="javascript:closeWindow()">
                        </div>

                     
                    </div>
</form>
                </div>			  
            </div>

    </section>
    <!-- END / CREATE COURSE CONTENT -->
        
    	<s:if test="message != null">
  		<script type="text/javascript">
   		var result = "${message}";
   		alert(result);
   		this.close();
	</script>
	</s:if>

	
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
</body>
</html>