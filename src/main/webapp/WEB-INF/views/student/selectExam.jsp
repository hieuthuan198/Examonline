<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<br>
<br>

<div class="gallery-cont text-center pb-5" id="gallery">
	<div class="container py-xl-5 py-lg-3">
		<h3 class="title-w3 mb-sm-5 mb-4 text-center text-bl font-weight-bold">List subject</h3>
		<h3 style="color: red;" class="title-w3 mb-sm-5 mb-4 text-center text-bl font-weight-bold">${err }</h3>
		<%
			int a = 1;
		%>
		<c:forEach var="subject" items="${subjects }">

			<%
				if (a == 1) {
			%>
			<div class="row news-grids text-center no-gutters">
				<%
					}
						;
				%>
				<div class="col-md-4 gal-img">
					<a data-toggle="modal" data-target="#myModal${subject.id }"><img
						src="/uploads/images/subject/${subject.id }.png"
						alt="Subject ${subject.name }" class="img-fluid"></a>
					<h2>Subject ${subject.name }</h2>
				</div>
				<div class="modal" id="myModal${subject.id }">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Exam subject ${subject.name }</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>


							<!-- Modal body -->
							<div class="modal-body">
								<form action="${pageContext.request.contextPath }/student/exam" method="post">
									<input type="hidden" value="${subject.id}" name="subjectid">
									<button class="btn btn-primary">Catch the exam</button> 
								</form>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>
				<%
					if (a == 3) {
							a = 0;
				%>
			</div>
			<%
				}
					;
					a = a + 1;
			%>

		</c:forEach>
	</div>
</div>
