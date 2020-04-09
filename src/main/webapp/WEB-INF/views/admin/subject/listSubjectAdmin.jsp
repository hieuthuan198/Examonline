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
		<h3>Subject List</h3>
	</div>
	<div class="container">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th scope="col" class="col-2">Subject</th>
					<th scope="col" class="col-7">Name</th>
					<th scope="col" class="col-2">Image</th>
					<th scope="col" class="col-1">Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="subject" items="${subjects }" varStatus="a">
					<tr>
						<td>${a.index +1 }</td>
						<td>${subject.name }</td>
						<td><img class="image"
							src="/uploads/images/subject/${subject.id }.png" alt="Img is empty"></td>
						<td><a
							href="${pageContext.request.contextPath }/admin/subject/edit/${subject.id}"
							class="badge badge-primary">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<style>
.image {
	width: 80px;
	height: 80px;
}
</style>