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
		<form action="list" method="post">

			<div class="form-row">
				<div class="form-group col-md-5">
					<label for="inputCity">Subject</label> <select name="subject"
						class="form-control">
						<option ${selectedSubject == 0 ? "selected" : "" } value="0">All</option>
						<c:forEach var="subjectInList" items="${allSubjects }">
							<option ${selectedSubject == subjectInList.id ? "selected" : "" } value="${subjectInList.id }">${subjectInList.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-5">
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
					<th>Subject</th>
					<th>Text</th>
					<th>Status</th>
					<th>Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="question" items="${allQuestion }">
					<tr>

						<td>${question.subject.name }</td>
						<td>${question.text }</td>
						<td>${question.status == 0 ? "Refuse approve" : question.status == 1? "Approved" : "Refuse approve"}</td>
						<td><a href="#" data-toggle="modal" data-target="#myModal${question.id }">View</span></a>

						</td>
					</tr>
					<div class="modal fade" id="myModal${question.id }" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">

									<h4 class="modal-title">Question Detail	</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>


								<div>
								</br>
									<div class="input-group mb-3 col-12">
										<input type="text" class="form-control  col-12"
											name="question" value="${question.subject.name }" disabled="disabled">
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
									<c:forEach var="questionSub" items ="${question.getQuestionSubs() }">
										<div class="input-group col-12">
										<div class="input-group-prepend">
											<span class="input-group-text" id="">Questionsub</span>
										</div>
										<textarea rows="1" class="form-control  col-12"
											name="questionSub1" disabled="disabled">${questionSub.text }</textarea>
										<div class="input-group-text">
											<input type="checkbox" disabled=true ${questionSub.coprrect == 1 ? "checked" : ""}>
										</div>
									</div>
									</c:forEach>
									
									<br>
									
									<br>
								</div>
								<br>
							</div>
						</div>

					</div>

				</c:forEach>
			</tbody>
		</table>
	</div>


	<!-- Modal -->

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title">Modal Header</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>


				<div>
					<div class="input-group mb-3 col-12">
						<select class="custom-select" id="inputGroupSelect02"
							name="subject">

							<c:forEach var="sj" items="${subjects }">
								<option value="${sj.id}">${sj.name }</option>
							</c:forEach>
						</select>
						<div class="input-group-append">
							<label class="input-group-text" for="inputGroupSelect02">Subject</label>
						</div>
					</div>
					<!-- sssss -->

					<div class="input-group  col-12">
						<div class="input-group-prepend">
							<span class="input-group-text">Question</span>
						</div>
						<textarea rows="3" class="form-control  col-12" name="question"></textarea>
					</div>

					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub 1</span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSub1"></textarea>
						<div class="input-group-text">
							<input type="checkbox" disabled=true>
						</div>
					</div>
					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub 2 </span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSub2"></textarea>
						<div class="input-group-text">
							<input type="checkbox" disabled=true>
						</div>
					</div>

					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub 3 </span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSub3"></textarea>
						<div class="input-group-text">
							<input type="checkbox" disabled=true>
						</div>
					</div>

					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub 4 </span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSub4"></textarea>
						<div class="input-group-text">
							<input type="checkbox" disabled=true checked="checked">
						</div>
					</div>
					<br>
				</div>
				<br>
			</div>
		</div>

	</div>

</div>