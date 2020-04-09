<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OEP||Edit Profile</title>
</head>
     <style>
.error {
	color: red;
}
</style>
<script>

	function keyPhone(e) {
		var keyword = null;
		if (window.event) {
			keyword = window.event.keyCode;
		} else {
			keyword = e.which; //NON IE;
		}

		if (keyword<48 || keyword>57) {
			if (keyword == 48 || keyword == 127) {
				return;
			}
			return false;
		}
	}
</script>
<body>
	<!-- inner banner -->
	<div class="inner-banner-w3ls py-5" id="home">
		<div class="container py-xl-5 py-lg-3">
			<!-- register  -->
			<div class="modal-body mt-md-2 mt-5">
				<h3 class="title-w3 mb-5 text-center text-wh font-weight-bold">Edit
					Profile</h3>
				<s:form
					action="${pageContext.request.contextPath }/student/updateProfile"
					method="post" modelAttribute="account"
					enctype="multipart/form-data">
					<s:hidden path="username" value="${account.username }" />
					<s:hidden path="password" value="${account.password }" />
					<div class="form-group">
						<label class="col-form-label">Name:</label>
						<s:input path="fullname" type="text" class="form-control"
							placeholder="your name" name="fullname" required="" />
							<s:errors path="fullname" cssClass="error"></s:errors>
					</div>

					<div class="form-group">
						<label class="col-form-label">Email:</label>
						<s:input path="email" type="text" class="form-control"
							placeholder="Email" name="Email" required="" />
							<s:errors path="email" cssClass="error"></s:errors>
					</div>
					<div class="form-group">
						<label class="col-form-label ">Phone:</label>
						<s:input path="numberPhone" onkeypress="return keyPhone(event);" type="text" class="form-control"
							placeholder="phonenumber" name="numberPhone" required="" />
					</div>
					<div class="form-group">
						<label class="col-form-label">Address:</label>
						<s:input path="address" type="text" class="form-control"
							placeholder="" name="address" required="" />
					</div>
					<div class="form-group">
						<div class="row">

							<label class="col-form-label" >Age:</label>
							<div class="col">
								<s:input path="age" onkeypress="return keyPhone(event);" type="text" placeholder="Your Age"
									name="age" required="" />
							</div>
						</div>
					</div>
					<div class="form-group" style="color: white;">
						<div class="col-6">
							<label class="col-form-label">Gender</label></br>
							<s:radiobutton path="gender" value="1" />
							Male</br>
							<s:radiobutton path="gender" value="0" />
							Female</br>
						</div>
					</div>
					<div class="form-group">
						<div class="col-6">
							<label class="col-form-label">Image</label></br> <input type="file"
								name="image" class="form-control">
								<p style="color: red;">${err }</p>
						</div>
					</div>

					<button type="submit" class="btn button-style-w3" value="Save">Save</button>
				</s:form>
			</div>
			<!-- //register -->
		</div>
	</div>
	<!-- //inner banner -->

</body>
</html>