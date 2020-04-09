<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="gallery-cont text-center pb-5" id="gallery">
	</br> </br> </br> </br> </br> </br> </br>
<style>
.error {
	color: red;
}

</style>
<script>
function keyPhone(e)
{
var keyword=null;
    if(window.event)
    {
    keyword=window.event.keyCode;
    }else
    {
        keyword=e.which; //NON IE;
    }
   
    if(keyword<48 || keyword>57)
    {
        if(keyword==48 || keyword==127)
        {
            return ;
        }
        return false;
    }
}

</script>

	<div>
		<h3>Upload CV</h3>
	</div>

	<br>
	<div class="container">
		<div>
			<s:form modelAttribute="cv"
				action="${pageContext.request.contextPath }/teacher/cv/upload"
				method="post" enctype="multipart/form-data">
				<div class="input-group mb-3 col-12">
					<p style="color: red;" cssClass="error">${err }</p>
				</div>

				<div class="input-group mb-3 col-12">
					<div class="input-group-append">
						<label class="input-group-text" for="inputGroupSelect02">Subject</label>
					</div>
					<s:select class="custom-select" path="subject">

						<c:forEach var="sj" items="${subjects }">
							<option value="${sj.id}" ${sj.id == cv.subject.id?"selected":"" }>${sj.name }</option>
						</c:forEach>
					</s:select>

				</div>
				<div class="input-group col-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="">Year Of Experience</span>
					</div>
	
					<s:input type="text" class="form-control  col-12"
						path="yearOfExperience" onkeypress="return keyPhone(event);"/>
						
				</div>
				<br>
				<div class="input-group col-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="">Rank</span>
					</div>

					<input type="file" class="form-control  col-12" name="image" />

				</div>
				<br>

				<button type="submit" class="btn btn-outline-primary col-8">Save</button>

			</s:form>
		</div>
	</div>
	<br> <br>