<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="gallery-cont text-center pb-5" id="gallery">
	</br> </br> </br> </br> </br> </br> </br>
	
	<div>
		<h1>List Result</h1>
		<br>
	</div>
	<div class="container">
		<table class="table table-striped table-bordered">
			<tr>
				<td><h2>Subject:</h2></td>
				<td><h2>Day exam:</h2></td>
				<td><h2>Score:</h2></td>
				<td><h2>Detail</h2></td>
			</tr>
			<c:forEach var="exam" items="${exams }">
				<a href="#">
					<tr>
						<td><h4>${exam.subject.name }</h4></td>
						<td><h4>${exam.created }</h4></td>
						<td><h4>${exam.score }</h4></td>
						<td><h4><a href="${pageContext.request.contextPath }/student/seeResult/detail/${exam.id}">View</a></h4></td>
					</tr>
				</a>
			</c:forEach>
		</table>
	</div>