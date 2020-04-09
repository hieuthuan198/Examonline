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
		<h3>Question Import</h3>
	</div>
	<div>
		<h3 style="color: red;">${msgerr }</h3>
	</div>
	<div class="container">
		<form
			action="${pageContext.request.contextPath }/teacher/question/import"
			method="post" enctype="multipart/form-data">

			<div class="form-row">
				<div class="input-group mb-3 col-6">
					<select class="custom-select" id="inputGroupSelect02"
						name="subject">

						<c:forEach var="sj" items="${subjects }">
							<option value="${sj.id}"
								${subjectIDParam ==  sj.id ? "selected":""}>${sj.name }</option>
						</c:forEach>
					</select>
					<div class="input-group-append">
						<label class="input-group-text" for="inputGroupSelect02">Subject</label>
					</div>
				</div>
				<div class="form-group col-md-4">
					<input type="file" class="form-control  col-12" name="excel" />
				</div>
				<div class="form-group col-md-2">
					<input type="submit" class="form-control btn btn-outline-warning"
						value="Import">
				</div>
			</div>
		</form>

		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Subject</th>
					<th>Text</th>
					<th>Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="question" items="${allQuestion }" varStatus="a">
					<tr>

						<td>${question.subject.name }</td>
						<td>${question.text }</td>
						<td><a href="#" data-toggle="modal"
							data-target="#myModal${a.index }">View</span></a></td>
					</tr>
					<div class="modal fade" id="myModal${a.index }" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">

									<h4 class="modal-title">Question Detail</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>


								<div>
									</br>
									<div class="input-group mb-3 col-12">
										<input type="text" class="form-control  col-12"
											name="question" value="${question.subject.name }"
											disabled="disabled">
										<div class="input-group-append">
											<label class="input-group-text" for="inputGroupSelect02">Subject</label>
										</div>
									</div>
									<!-- sssss -->

									<div class="input-group  col-12">
										<div class="input-group-prepend">
											<span class="input-group-text">Question</span>
										</div>
										<textarea rows="3" class="form-control  col-12"
											name="question" disabled="disabled">${question.text } </textarea>
									</div>

									<br>
									<!-- sssss -->
									<c:forEach var="questionSub"
										items="${question.getQuestionSubs() }">
										<div class="input-group col-12">
											<div class="input-group-prepend">
												<span class="input-group-text" id="">Questionsub</span>
											</div>
											<textarea rows="1" class="form-control  col-12"
												name="questionSub1">${questionSub.text }</textarea>
											<div class="input-group-text">
												<input type="checkbox"
													${questionSub.coprrect == 1 ? "checked" : ""}>
											</div>
										</div>
									</c:forEach>

									<br> <br>
								</div>
								<br>
							</div>
						</div>

					</div>
				</c:forEach>
				<tr>

				</tr>
			</tbody>
		</table>
		<form
			action="${pageContext.request.contextPath }/teacher/question/import/save"
			method="post" enctype="multipart/form-data">

			<div class="form-row">
				<div class="input-group mb-3 col-6">
					<input type="hidden" value="${subjectIDParam }" name="subject">
				</div>
				<div class="form-group col-md-2">
					<input type="submit" class="form-control btn btn-outline-warning"
						value="Import">
				</div>
			</div>
		</form>

	</div>
</div>