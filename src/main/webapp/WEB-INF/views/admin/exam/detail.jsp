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
	</br> </br> </br> </br> </br>

	<div>
		<h3>Question List</h3>
	</div>
	<div class="container">


		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Text</th>
					<th>Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="examQuestion" items="${examQuestions }">
					<tr>
						<td>${examQuestion.question.text }</td>
						<td><a href="${pageContext.request.contextPath }/admin/exam/questionDetail/${examQuestion.id}">View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



</div>