<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>


<div class="btn-effcts panel-widget col-md-12">

	<h1 style="text-align: center;">Repply Feedback</h1>
	<br>
	<div class="btn-effcts panel-widget col-md-10">
		<div class="form-row">
			<fieldset disabled>
				<legend>
					<h3>Feedback</h3>
				</legend>
				<div class="col-md-10 mb-3">
					<label for="disabledSelect">Subject</label> <input type="text"
						id="disabledSelect" class="form-control"
						value="${feedback.subject}">

				</div>
				<div class="col-md-10 mb-3">
					<label for="disabledTextInput">Content</label>
					<textarea cols="4" id="disabledTextInput" class="form-control"
						placeholder="Disabled input">${feedback.content}</textarea>
				</div>

				<div class="col-md-5 mb-3">
					<label for="validationCustom01">User name</label> <input
						type="text" class="form-control" id="validationCustom01"
						placeholder="First name"
						value="${feedback.accountByFromId.username}" required>

				</div>
				<div class="col-md-5 mb-3">
					<label for="validationCustom02">Date Send</label> <input
						type="text" class="form-control" id="validationCustom02"
						placeholder="Last name" value="${feedback.createTime}" required>

				</div>
				<br>

			</fieldset>
			<br> <br>
		</div>
	</div>
	<div class="btn-effcts panel-widget col-md-10">
		<br>
		<c:forEach var="responseFeedback" items="${responseFeedbacks }">
			<div class="form-row">
				<fieldset disabled>
					<legend>
						<h3>Repply</h3>
					</legend>
					<div class="col-md-4 mb-3" align="right">
						<label for="validationCustom01">User name</label> <input
							type="text" class="form-control" id="validationCustom01"
							placeholder="First name"
							value="${responseFeedback.account.username }" required>
					</div>
					<div class="col-md-4 mb-3" align="right">
						<label for="validationCustom02">Date Send</label> <input
							type="text" class="form-control" id="validationCustom02"
							placeholder="Last name" value="${responseFeedback.createTime}"
							required>
					</div>
					<br>
					<div class="col-md-8 mb-3" align="right">
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

	<div class="btn-effcts panel-widget col-md-10">
		<div class="form-row">
			<fieldset>
				<legend>
					<h3>Repply</h3>
				</legend>
				<form action="${pageContext.request.contextPath }/admin/feedback/repply" method="post">
					<input type="hidden" name="id" value="${feedback.id }">
					<div class="col-md-10 mb-3">
						<textarea cols="4" id="disabledTextInput" class="form-control "
							placeholder="ReppLy Feedback" name= "content"></textarea>
					</div>
					<br>
					<br>
					<br>
					<br>
					<div class="col-md-10 mb-3" align="right">
						<button class="btn btn-primary" type="submit">Repply</button>
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