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
		<h3>CV List</h3>
	</div>
	<div class="container">
		<form action="${pageContext.request.contextPath }/admin/cv/index"
			method="post">
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="inputCity">Username</label> <select name="account"
						class="form-control">
						<option value="0" ${selectedAccount == 0 ? "selected" : "" }>All</option>
						<c:forEach var="account" items="${accounts }">
							<option ${selectedAccount == account.id ? "selected" : "" }
								value="${account.id }">${account.username }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="inputState">Subject</label> <select name="subject"
						class="form-control">
						<option value="0" ${selectedSubject == 0 ? "selected" : "" }>All</option>
						<c:forEach var="subject" items="${subjects }">
							<option ${selectedSubject == subject.id ? "selected" : "" }
								value="${subject.id }">${subject.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="inputState">Status</label> <select name="status"
						class="form-control">
						<option ${selectedStatus == 3 ? "selected" : "" } value="3">All</option>
						<option ${selectedStatus == 0 ? "selected" : "" } value="0">Awaiting approval</option>
						<option ${selectedStatus == 1 ? "selected" : "" } value="1">Approved</option>
						<option ${selectedStatus == 2 ? "selected" : "" } value="2">Refuse approve</option>
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
				<th scope="col" class="col-1">#</th>
					<th scope="col" class="col-2">Username</th>
					<th scope="col" class="col-5">Subject</th>
					<th scope="col" class="col-2">Year of experience</th>
					<th scope="col" class="col-2">Status</th>
					<th scope="col" class="col-1">Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cv" items="${cvs }" varStatus="a">
					<tr>
						<td>${a.index +1 }</td>
						<td>${cv.account.username }</td>
						<td>${cv.subject.name }</td>
						<td>${cv.yearOfExperience }</td>
						<td>${cv.status == 0 ? "Awaiting approval" : cv.status == 1? "Approved" : "Refuse approve"}</td>
						<td><a href="${pageContext.request.contextPath }/admin/cv/detail/${cv.id}">View</a> </td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
