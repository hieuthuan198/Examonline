<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="gallery-cont text-center pb-5" id="gallery">
	</br> </br> </br> </br> </br> </br> </br>


	<div>
		<h3>CV List</h3>
	</div>
	<div class="container">
		<form method="post"
			action="${pageContext.request.contextPath }/teacher/cv/list">
			<div class="form-row">
				<div class="form-group col-md-5">
					<label for="inputCity">Subject</label> <select name="subject"
						class="form-control">
						<option value="0" ${selectedSubject == 0 ? "selected" : "" }>All</option>
						<c:forEach var="subject" items="${subjects }">
							<option ${selectedSubject == subject.id ? "selected" : "" }
								value="${subject.id }">${subject.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-5">
					<label for="inputState">Status</label> <select name="status"
						class="form-control">
						<option value="3" ${selectedStatus == 3 ? "selected" : "" }>All</option>
						<option value="0" ${selectedStatus == 0 ? "selected" : "" }>Awaiting approval</option>
						<option value="1" ${selectedStatus == 1 ? "selected" : "" }>Approved</option>
						<option value="2" ${selectedStatus == 2 ? "selected" : "" }>Refuse approve</option>
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
					<th>Subject</th>
					<th>YEAR_OF_EXPERIENCE</th>
					<th>STATUS</th>
					<th>DETAIL</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cv" items="${cvs }">
					<tr>
						<td>${cv.subject.name }</td>
						<td>${cv.yearOfExperience }</td>
						<td>${cv.status == 0 ? "Awaiting approval" : cv.status == 1? "Approved" : "Refuse approve"}</td>
						<td><a href="#" data-toggle="modal"
							data-target="#myModal${cv.id }">View</span></a></td>
					</tr>
					<div class="modal fade" id="myModal${cv.id }" role="dialog">
						<div class="modal-dialog">
							<br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br>
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">

									<h4 class="modal-title">CV Detail</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>


								<div>
									</br>
									<div class="input-group mb-3 col-12">
										<div class="input-group-append">
											<label class="input-group-text" for="inputGroupSelect02">SUBJECT</label>
										</div>
										<input type="text" class="form-control  col-12"
											name="question" value="${cv.subject.name }"
											disabled="disabled">

									</div>
									<!-- sssss -->

									<div class="input-group  col-12">
										<div class="input-group-prepend">
											<span class="input-group-text">YEAR OF EXPERIENCE</span>
										</div>
										<input type="text" class="form-control  col-12"
											name="question" value="${cv.yearOfExperience }"
											disabled="disabled">
									</div>
									<br>
									<div class="input-group  col-12">
										<div class="input-group-prepend">
											<span class="input-group-text">STATUS</span>
										</div>
										<input type="text" class="form-control  col-12"
											name="question" value="${cv.status == 0 ? "Awaiting approval" : cv.status == 1? "Approved" : "Refuse approve"}"
											disabled="disabled">
									</div>
									<br>
									<div class="input-group  col-12">
										<div class="input-group-prepend">
											<span class="input-group-text">IMAGE</span>
										</div>
										<img class="form-control  col-12 image" name="question"
											src="/uploads/images/cv/${cv.account.id }_${cv.id}.png" alt="No pictures yet"
											disabled="disabled">
									</div>
									<br> <br> <br>
								</div>
								<br>
							</div>
						</div>

					</div>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<style>
.image {
	height: 600px;
}
$('img.image').on("error", function () {
    this.src = '/uploads/images/account/personal.jpg';
});
</style>