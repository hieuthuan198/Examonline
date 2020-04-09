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
		<h3>Feedback List</h3>
	</div>
	<div class="container">
		<form action="${pageContext.request.contextPath }/admin/feedback/index" method="post">
			<div class="form-row">
				<div class="form-group col-md-6">
					<div class="input-group  col-12">
						<div class="input-group-prepend">
							<span class="input-group-text">Form Username</span>
						</div>
						<input class="form-control col-9" name="username">
						<input type="submit"
						class="form-control btn btn-outline-warning col-3" value="Search">
					</div>
				</div>
			</div>
		</form>

		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>#</th>
					<th>Subject</th>
					<th>Content</th>
					<th>From</th>
					<th>Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="feedback" items="${feedbacks}" varStatus="a">
					<tr>
						<td>${a.index+1 }</td>
						<td>${feedback.subject }</td>
						<td>${feedback.content }</td>
						<td>${feedback.accountByFromId.username }</td>
						<td><a
							href="${pageContext.request.contextPath }/admin/feedback/repply/${feedback.id}"
							class="badge badge-primary">View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>