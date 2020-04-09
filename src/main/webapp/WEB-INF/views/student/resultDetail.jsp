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
		<h1>Danh sách câu hỏi</h1>
	</div>
	<div class="container">


		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th><h2>Câu hỏi</h2></th>
					<th><h2>Chi tiết</h2></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="examQuestion" items="${examQuestions }">
					<tr>
						<td><h4>${examQuestion.question.text }</h4></td>
						<td><a href="#" data-toggle="modal"
							data-target="#myModal${examQuestion.id }"><h4>View</h4></a></td>
					</tr>
					<div class="modal fade" id="myModal${examQuestion.id }"
						role="dialog" >
						<div class="modal-dialog" style="width: 700px;">

							<!-- Modal content-->
							<div class="modal-content" style="width: 700px; height: 500px;">
								<div class="modal-header">

									<h4 class="modal-title">Question Detail</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>


								<div>
									</br>
									<div class="input-group mb-3 col-12">
									
										<input type="text" class="form-control  col-12"
											name="question"
											value="${examQuestion.question.subject.name }"
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
											name="question" disabled="disabled">${examQuestion.question.text } </textarea>
									</div>

									<br>
									<!-- sssss -->
									<div class="input-group col-12">
											<div class="input-group-prepend col-2">
												
												<input type="text" disabled >
											</div>
											<textarea rows="1" class="form-control  col-7"
												name="questionSub1" disabled="disabled"></textarea>
											<textarea rows="1" class="form-control  col-2"
												name="questionSub1" disabled="disabled">Result</textarea>
											<textarea rows="1" class="form-control  col-2"
												name="questionSub1" disabled="disabled">Answer</textarea>
										</div>
									<c:forEach var="questionSub"
										items="${examQuestion.question.getQuestionSubs() }">
										<div class="input-group col-12">
											<div class="input-group-prepend col-2">
												<span class="input-group-text" id="">Questionsub</span>
											</div>
											<textarea rows="1" class="form-control  col-7"
												name="questionSub1" disabled="disabled">${questionSub.text }</textarea>
											<div class="input-group-text col-2">
												<input type="checkbox" disabled=true
													${questionSub.coprrect == 1 ? "checked" : ""}>
											</div><div class="input-group-text col-2">
											
												<input type="checkbox" disabled=true 
													<c:forEach var="answer" items="${examQuestion.getAnswers() }">
													
													${answer.questionSub.id ==  questionSub.id ? "checked" : ""}
												</c:forEach>
												>
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
			</tbody>
		</table>
	</div>



</div>