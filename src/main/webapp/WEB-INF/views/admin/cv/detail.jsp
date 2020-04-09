<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>
<br>


<div class="btn-effcts panel-widget">
	<h1 style="text-align: center;">CV Detail</h1>
	<br> <br>

	<div class="form-row">
		<fieldset disabled>
			<legend>
				<h3>
					<h3>CV info</h3>
				</h3>
			</legend>
			<div class="col-md-5 mb-3">
				<label for="validationCustom01">Account</label> <input type="text"
					class="form-control" id="validationCustom01" placeholder="Account"
					value="${cv.account.username}" required>

			</div>
			<div class="col-md-5 mb-3">
				<label for="validationCustom02">Subject</label> <input type="text"
					class="form-control" id="validationCustom02" placeholder="Subject"
					value="${cv.subject.name}" required>

			</div>
			<div class="col-md-5 mb-3">
				<label for="validationCustom02">Year of experience</label> <input
					type="text" class="form-control" id="validationCustom02"
					placeholder="Status" value="${cv.yearOfExperience}" required>
			</div>

			<div class="col-md-5 mb-3">
				<label for="validationCustom02">Status</label> <input type="text"
					class="form-control" id="validationCustom02" placeholder="Status"
					value="${cv.status == 0 ? " Awaiting approval" : cv.status==
					1? "Approved" : "Refuse approve"}" required>
			</div>
			<div class="col-md-10 mb-3">
				<label for="validationCustom02">Image</label> <img
					style="height: 700px" class="form-control" id="validationCustom02"
					src="/uploads/images/cv/${cv.account.id }_${cv.id }.png" required>
			</div>

		</fieldset>
		<br> <br>
	</div>

	<div class="btn-effcts panel-widget">

		<br>
		<div class="form-row col-8">
			<fieldset>
				<legend>
					<h3>Confirm</h3>
				</legend>
				<c:if test="${cv.status == 0 || cv.status == 2}">
					<form action="${pageContext.request.contextPath }/admin/cv/accept"
						method="post">
						<input class="col-4" type="hidden" value="${cv.id}" name="id"> <input
							type="submit" value="Accept">
					</form>
				</c:if>
				<c:if test="${cv.status == 0 || cv.status == 1}">
					<form action="${pageContext.request.contextPath }/admin/cv/refuse"
						method="post">
						<input class="col-4" type="hidden" value="${cv.id}" name="id"> <input
							type="submit" value="Refuse">
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