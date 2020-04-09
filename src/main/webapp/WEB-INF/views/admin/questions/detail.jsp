<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>
<br>


<div class="btn-effcts panel-widget">
	<h1 style="text-align: center;">Question Detail</h1>
	<br> <br>

	<div class="form-row">
		<fieldset disabled>
			<legend>
				<h3>
					<h3>Question info</h3>
				</h3>
			</legend>
			<div class="col-md-5 mb-3">
				<label for="validationCustom01">Account</label> <input type="text"
					class="form-control" id="validationCustom01" placeholder="Account"
					value="${question.account.username}" required>

			</div>
			<div class="col-md-5 mb-3">
				<label for="validationCustom02">Subject</label> <input type="text"
					class="form-control" id="validationCustom02" placeholder="Subject"
					value="${question.subject.name}" required>

			</div>


			<div class="col-md-5 mb-3">
				<label for="validationCustom02">Status</label> <input type="text"
					class="form-control" id="validationCustom02" placeholder="Status"
					value="${question.status == 0 ? "Awaiting approval" :
					question.status== 1? "Approved" : "Refuse approve"}" required>
			</div>
			<br>
			<div class="col-md-10 mb-3">
				<label for="disabledSelect">Question</label>
				<textarea id="disabledSelect" class="form-control">${question.text}</textarea>

			</div>
		</fieldset>
		<br> <br>
	</div>
	<div class="btn-effcts panel-widget">
		<div class="form-row">
			<fieldset disabled>
				<legend>
					<h3>Answer</h3>
				</legend>
				<c:forEach var="questionSub" items="${questionSubs }" varStatus="a">
					<div class="col-md-5 mb-3">
						<label for="validationCustom01">Question sub ${a.index }</label>
						<textarea style="${questionSub.coprrect == 1 ? "background: #81F79F;" : ""}" class="form-control" id="validationCustom01" required>${questionSub.text } </textarea>
					</div>
				</c:forEach>
			</fieldset>
		</div>
		<br>
	</div>
	<br>
	<div class="btn-effcts panel-widget">

		<br>
		<div class="form-row">
			<fieldset>
				<legend>
					<h3>Confirm</h3>
				</legend>

				
				<c:if test="${question.status == 0 || question.status == 2}">
					<form
					action="${pageContext.request.contextPath }/admin/questions/accept"
					method="post">
					<input type="hidden" value="${question.id}" name="id">
						<input type="submit" value="Accept">
				</form>
				</c:if>
				<c:if test="${question.status == 0 || question.status == 1}">
					<form
					action="${pageContext.request.contextPath }/admin/questions/refuse"
					method="post">
					<input type="hidden" value="${question.id}" name="id">
						<input type="submit" value="Refuse">
				</form>
				</c:if>
			</fieldset>
		</div>
		<br>
	</div>
	<br>

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