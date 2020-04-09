<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
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
			<h3 class="title-w3 mb-5 text-center text-wh font-weight-bold">Register
				Now</h3>
			<s:form modelAttribute="account"
				action="${pageContext.request.contextPath }/teacher-register"
				method="post">
				<div class="form-group">
					<label class="col-form-label">Full name</label>
					<s:input path="fullname" type="text" class="form-control"
						placeholder="Full name" name="fullname" />
					<s:errors path="fullname" cssClass="error"></s:errors>
				</div>
				<div class="form-group">
					<label class="col-form-label">Email</label>
					<s:input path="email" type="text" class="form-control"
						placeholder="Email" name="Email" required="" />
					<s:errors path="email" cssClass="error"></s:errors>
				</div>
				<div class="form-group">
					<label class="col-form-label">Address</label>
					<s:input path="address" type="text" class="form-control"
						placeholder="Address" name="address" required="" />
					<s:errors path="address" cssClass="error"></s:errors>
				</div>

				<div class="form-group ">
					<label class="col-form-label">Age</label>

					<s:input path="age" type="text" class="form-control col-6"
						placeholder="Your age" name="age" required=""
						onkeypress="return keyPhone(event);" />
					<s:errors path="age" cssClass="error"></s:errors>

				</div>
				<div class="col-6" style="color: white;">
					<label class="col-form-label">Gender</label></br>
					<s:radiobutton path="gender" value="1" />
					Male</br>
					<s:radiobutton path="gender" value="0" />
					Female</br>
					<s:errors path="gender" cssClass="error"></s:errors>
				</div>
				<div class="form-group">
					<label class="col-form-label">Phone Number</label>
					<s:input path="numberPhone" type="text" class="form-control"
						placeholder="phonenumber" name="numberPhone" required=""
						onkeypress="return keyPhone(event);"/>
					<s:errors path="numberPhone" cssClass="error"></s:errors>
				</div>
				<div class="form-group">
					<label class="col-form-label">Username</label>
					<s:input path="username" type="text" class="form-control"
						placeholder="username" name="username" required="" />
					<s:errors path="username" cssClass="error"></s:errors>
				</div>
				<div class="form-group">
					<label class="col-form-label">Password</label>
					<s:input path="password" type="Password" class="form-control"
						placeholder="Password" name="password" required="" />
					<s:errors path="password" cssClass="error"></s:errors>
				</div>

				<div class="sub-w3l my-3">
					<div class="sub-w3layouts_hub">
						<input type="checkbox" id="brand1" value=""> <label
							for="brand1" class="text-li text-style-w3ls"> <span></span>I
							Accept to the Terms & Conditions
						</label>
					</div>
				</div>
				<button type="submit" class="btn button-style-w3" value="create">Register</button>
			</s:form>
		</div>
		<!-- //register -->
	</div>
</div>
</body>
<!-- //inner banner -->
