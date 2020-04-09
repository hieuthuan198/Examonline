<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="gallery-cont text-center pb-5" id="gallery">
	</br> </br> </br> </br> </br> </br>
	<div>
		<h3>Feedback List</h3>
	</div>
	<div class="container">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>#</th>
					<th>Subject</th>
					<th>Content</th>
					<th>Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="feedback" items="${feedbacks}" varStatus="a">
					<tr>
						<td>${a.index+1 }</td>
						<td>${feedback.subject }</td>
						<td>${feedback.content }</td>
						<td><a
							href="${pageContext.request.contextPath }/student/feedback/repply/${feedback.id}"
							class="badge badge-primary">Repply</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>