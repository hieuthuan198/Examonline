<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
     <style>
.error {
align-items:left;
	color: red;
}
</style>
<br>

<br>
<br>
<br>
<br>
<br>

<div class="gallery-cont text-center pb-8" id="gallery">
	<div class="container">


		<h2>Edit Subject</h2>
		<br>
		<s:form
			action="${pageContext.request.contextPath }/admin/subject/edit"
			method="post" modelAttribute="subject" enctype="multipart/form-data">
			<s:hidden path="id" />
			<s:errors path="name" cssClass="error"></s:errors>
			<div class="input-group">
			
				<span class="input-group-addon col-2">Subject Name</span>
				<s:input path="name" id="msg" type="text" class="form-control col-7"
					name="msg" placeholder="Subject Name" />
				
			</div>
			
			<br>
			<p style="color: red;">${err }</p>
			<div class="input-group ">
				<span class="input-group-addon col-2" name="image">Image</span> <input
					type="file" class="form-control col-7" name="image" />
			</div>
			<br>

			<button type="submit" class="btn btn-warning">UPDATE</button>
		</s:form>

	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>