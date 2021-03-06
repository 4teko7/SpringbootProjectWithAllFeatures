<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="layout.jsp"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../resources/css/myvideos.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>


<div class="container">
   				 <table class = "container">
					<c:if test="${error != null}">
					    </div><div style = "" class="alert alert-danger">
						<span style = "display:flex; justify-content:center;">${error}</span>
						</div>
						<br>  
					</c:if>
					
				</table>
				
			<form:form action="/secured/updatevideo" modelAttribute="video" method="POST" enctype="multipart/form-data">
			
	  			<form:hidden path="id" />

					<!-- For Video Upload -->
					<div>

					  <div class="card">
					  
					  <video  controls style=" width:100%;height:100%;margin-left: auto; margin-right: auto; display: block; width:100%">
					    <source src="/${video.path}" type="${video.mimeType }">
					    
					</video>
					
					</div>
                 <!-- END OF Video Upload -->
                 
                  <br>
                  <form:input name="name" path = "name" type="text" class="form-control" placeholder="Name Of Video"/> <br>
                  <form:input name="videoSubject" path = "videoSubject" type="text" class="form-control" placeholder="Subject Of Video"/> <br>
                  <form:textarea name="videoContent" path = "videoContent" class="form-control" placeholder="Content Of Video" rows="5" cols="30" /><br>
                  <div  style = "display:flex; justify-content:center;"> <input name="removeVideo" type="radio" value="remove" />Remove Video</div>

                  
                   <button style = "margin-top:2rem;" class="btn btn-lg btn-primary btn-block" type="submit">Save</button>
            		<h4 class="text-center"><a href="${pageContext.request.contextPath}/secured/myvideos">Go My Videos</a></h4>
            
  
	       </form:form> 
	       
			<div style="clear; both;"></div>
			
		</div>
		
		
		



                
  




  
  
  
</body>
<script type="text/javascript">

</script>
</html>