<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>

	 <div class="container py-xl-5 py-lg-3">
  <div class="modal-body mt-md-2 mt-5">
	        <h3 class="title-w3 mb-5 text-center text-wh font-weight-bold">Repply Feedback</h3>
	<br>
		
		<div class="form-group">
			<fieldset disabled>
				<legend>
					<h3>Feedback</h3>
				</legend>
				<div class="form-group">
					<label for="disabledSelect" >Subject</label> <input type="text"
						id="disabledSelect" class="form-control"
						value="${feedback.subject}">

				</div>
				<div class="form-group">
					<label for="disabledTextInput">Content</label>
					<textarea rows="4" id="disabledTextInput" class="form-control"
						placeholder="Disabled input">${feedback.content}</textarea>
				</div>

				<div class="form-group">
					<label for="validationCustom01">User name</label> <input
						type="text" class="form-control" id="validationCustom01"
						placeholder="First name"
						value="${feedback.accountByFromId.username}" required>

				</div>
				<div class="form-group">
					<label for="validationCustom02">Date Send</label> <input
						type="text" class="form-control" id="validationCustom02"
						placeholder="Last name" value="${feedback.createTime}" required>

				</div>
				<br>

			</fieldset>
			<br> <br>
		</div>
	</div>
	<div class="modal-body mt-md-2 mt-5">
		<br>
		<c:forEach var="responseFeedback" items="${responseFeedbacks }">
			<div class="form-group ">
				<fieldset disabled>
					<legend>
						<h3>Repply</h3>
					</legend>
					<div class="form-group row">
					<div class="col-xs-6">
						<label for="validationCustom01">User name</label> <input
							type="text" class="form-control col-12" id="validationCustom01"
							placeholder="First name"
							value="${responseFeedback.account.username }" required>
					</div>
				<div class="col-xs-6">
					
						<label for="validationCustom02">Date Send</label> <input
							type="text" class="form-control col-12" id="validationCustom02"
							placeholder="Last name" value="${responseFeedback.createTime}"
							required>
				</div>
					</div>
					<br>
					<div class="form-group">
					
						<label for="disabledTextInput">Answered</label>
						<textarea cols="4" id="disabledTextInput" class="form-control"
							placeholder="Disabled input">${responseFeedback.content}</textarea>
							 
					
					</div>
				</fieldset>
			</div>
			<br>
		</c:forEach>
	</div>
	<br>
	<div class="modal-body mt-md-2 mt-5">
		<div class="form-group">
			<fieldset>
				<legend>
					<h3>Repply</h3>
				</legend>
				<form action="${pageContext.request.contextPath }/teacher/feedback/repply" method="post">
				<div class="form-group">
					<input type="hidden" name="id" value="${feedback.id }">
					<div class="col-md-12 mb-3">
						<textarea rows="4" id="disabledTextInput" class="form-control"
							placeholder="ReppLy Feedback" name= "content"></textarea>
					</div>
					<br>
					<br>
					<br>
					<br>
					<div class="col-md-6 mb-3" align="right">
						<button class="btn btn-primary col-6" type="submit">Repply</button>
					</div>
					</div>
				</form>
			</fieldset>
		</div>
		<br>
	</div>

</div>


<br>
<br>
<br>
<br>
<style>
.image {
	width: 80px;
	height: 80px;
}
</style>