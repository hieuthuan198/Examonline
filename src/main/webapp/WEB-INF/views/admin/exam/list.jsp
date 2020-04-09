<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<div class="gallery-cont text-center pb-5" id="gallery">
	</br> </br> </br> </br> </br> </br>
	<div>
		<h3>Exam List</h3>
	</div>
	<div class="container">
		<form method="post"
			action="${pageContext.request.contextPath }/admin/exam/list">
			<div class="form-row">
				<div class="form-group col-md-5">
					<label for="inputCity">Username</label> <select name="account"
						class="form-control">
						<option value="0" ${selectedAccount == 0 ? "selected" : "" }>All</option>
						<c:forEach var="account" items="${accounts }">
							<option ${selectedAccount == account.id ? "selected" : "" }
								value="${account.id }">${account.username }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-5">
					<label for="inputState">Subject</label> <select name="subject"
						class="form-control">
						<option value="0" ${selectedSubject == 0 ? "selected" : "" }>All</option>
						<c:forEach var="subject" items="${subjects }">
							<option ${selectedSubject == subject.id ? "selected" : "" }
								value="${subject.id }">${subject.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-2">
					<label for="inputZip"> _</label> <input type="submit"
						class="form-control btn btn-outline-warning" value="Search">
				</div>
			</div>
		</form>

		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>#</th>
					<th>Username</th>
					<th>Subject</th>
					<th>Created</th>
					<th>Score</th>
					<th>Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="exam" items="${exams }" varStatus="a">
					<tr>
						<td>${a.index + 1}</td>
						<td>${exam.account.username }</td>
						<td>${exam.subject.name }</td>
						<td>${exam.created }</td>
						<td>${exam.score }</td>
						<td><a href="${pageContext.request.contextPath }/admin/exam/detail/${exam.id}">View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>