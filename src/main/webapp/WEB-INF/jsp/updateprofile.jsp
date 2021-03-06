<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<jsp:include page="layout.jsp"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../resources/css/userProfile.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



</head>
<body>

<!------ Include the above in your HEAD tag ---------->
<%if (request.getRemoteUser() != null) {%>
<div class="container emp-profile">
            <%-- <form method="post"> --%>
            <form:form action="/updateprofile" modelAttribute="user" method="POST" enctype="multipart/form-data">
            <form:hidden path = "id"/>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                        <c:if test="${user.photoPath != null}">
                            <img id = "profilImg" src="${user.photoPath}" alt="Profil Photo"/>
                            </c:if>
                            <c:if test="${user.photoPath == null}">
                            <img id = "profilImg" src="https://via.placeholder.com/300" alt="Profil Photo"/>
                            </c:if>
                            <div class="fileRemove btn btn-lg btn-danger">
                                Remove Photo
                                <input type="submit" name="removePhoto" />
                            </div>
                             <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input id = "imgInput" type="file" name="file" />
                                <input style = "display:none;" id = "idOfProfileImg" name="nameOfProfileImg" type="radio" />
                            </div>
                            
                        </div>
                        
                         <div class="profile-work">
                            <p>WORK LINK</p>
                            <a href="">Website Link</a><br/>
                            <a href="">Bootsnipp Profile</a><br/>
                            <a href="">Bootply Profile</a>
                            <p>SKILLS</p>
                            <a href="">Web Designer</a><br/>
                            <a href="">Web Developer</a><br/>
                            <a href="">WordPress</a><br/>
                            <a href="">WooCommerce</a><br/>
                            <a href="">PHP, .Net</a><br/>
                        </div>
                        
                        
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h4 class="form-heading"><scan style = "font-size:3rem;"><b>${user.firstname} ${user.lastname}</b></scan></h4>
                                    <h3>
                                        ${user.username}
                                    </h3>
                                    <!-- <p class="proile-rating">RANKINGS : <span>8/10</span></p> -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Timeline</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-8">
                    			<table class = "container">
									<c:if test="${error != null}">
									    </div><div style = "" class="alert alert-danger">
										<span style = "display:flex; justify-content:center;">${error}</span>
										</div>
										<br>  
									</c:if>
									
								</table>
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Firstname</label>
                                            </div>
                                            <div class="col-md-6">
                                               <b style = "color:red;"><b> <form:input placeholder = "Firstname" path = "firstname"/></b></b>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Lastname</label>
                                            </div>
                                            <div class="col-md-6">
                                               <b style = "color:red;"><b> <form:input placeholder = "Lastname" path = "lastname"/></b></b>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Username</label>
                                            </div>
                                            <div class="col-md-6">
                                               <b style = "color:red;"><b> <form:input placeholder = "Username" path = "username"/></b></b>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Password</label>
                                            </div>
                                            <div class="col-md-6">
                                               <b style = "color:red;"><b> <form:input placeholder = "Password" path = "password"/></b></b>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Password Confirm</label>
                                            </div>
                                            <div class="col-md-6">
                                               <b style = "color:red;"><b> <form:input placeholder = "Password Confirm" path = "passwordConfirm"/></b></b>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <b style = "color:red;"><b><form:input placeholder = "Email" path = "email"/></b></b>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <b style = "color:red;"><b><form:input placeholder = "Phone" path = "phone"/></b></b>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>School</label>
                                            </div>
                                            <div class="col-md-6">
                                                <b style = "color:red;"><b><form:input placeholder = "School" path = "school"/></b></b>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Class</label>
                                            </div>
                                            <div class="col-md-6">
                                                <b style = "color:red;"><b><form:input id = "classNumber" placeholder = "Class" path = "classNumber"/></b></b>
                                            </div>
                                        </div><br>
                                        
                                        
                                        <div class = "row" >
	                                        <div  class = "col-md-8">
		                                        <c:if test="${user.lecturePhotoPath != null}">
					                            	<img  style = "width:100%;height:100%;" id = "dersProgramiImg" src="${user.lecturePhotoPath}" alt="Lecture Photo"/>
					                            </c:if>
					                            <c:if test="${user.lecturePhotoPath == null}">
					                            	<img id = "dersProgramiImg" src="https://via.placeholder.com/700" alt="Lecture Photo"/>
					                            </c:if>
			                                 </div>
			                                 
			                                
                                        </div>
                                        <div class = "row">
                                         <div class="col-md-6 profile-img">
                                        
                                        <div style = "margin-top:2rem;" class="file btn btn-lg btn-primary">
			                                Ders Programi
			                                <input  id = "imgDersProgramiInput" type="file" name="file" /><br>
			                                <input style = "display:none;" id = "idOfDersProgrami" name="imgDersProgramiRadio" type="radio" />
			                            
			                            </div>
                            
                                        	
                                        </div>
                                        </div>
                                        <br>
                                        

                                   
			                            
                            </div>
                            <div class="tab-pane " id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                        

                    
                    
                                            <div class="col-md-6">
                                                <label>Experience</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Hourly Rate</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>10$/hr</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Total Projects</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>English Level</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Availability</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div  class ="col-md-4 col-md-offset-4" style = "display:flex;justify-content: center">
                        <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Save Profile"/>
                    </div>
            </form:form>           
        </div>
<%}%>

</body>

<script type="text/javascript">

function showImage(imgInput,target) {
	  var fr=new FileReader();
	  // when image is loaded, set the src of the image where you want to display it
	  fr.onload = function(e) { target.src = this.result; };
	  imgInput.addEventListener("change",function() {
	    // fill fr with image data    
	    fr.readAsDataURL(imgInput.files[0]);
	    radiobtnofProfileImage.checked = true;
	  });
	}

	var src = document.getElementById("imgInput");
	var target = document.getElementById("profilImg");
	radiobtnofProfileImage = document.getElementById("idOfProfileImg");
	
	showImage(src,target); 
	 


	function showImageDersProgrami(imgInput,target) {
		  var fr=new FileReader();
		  // when image is loaded, set the src of the image where you want to display it
		  fr.onload = function(e) { target.src = this.result; };
		  imgInput.addEventListener("change",function() {
		    // fill fr with image data    
		    fr.readAsDataURL(imgInput.files[0]);
		    radiobtnofDersProgrami.checked = true;
		  });
		}

		radiobtnofDersProgrami = document.getElementById("idOfDersProgrami");
		
		var srcForDersProgrami = document.getElementById("imgDersProgramiInput");
		var targetForDersProgrami = document.getElementById("dersProgramiImg");

		
		showImageDersProgrami(srcForDersProgrami,targetForDersProgrami);  

		
  

</script>

</html>




