<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="gallery-cont text-center pb-5" id="gallery">
	</br> </br> </br> </br> </br>
	<style>
.margin {
	margin: auto;
	text-align: center;
	width: 800px;
	height: 100%;
}
</style>
	<div>
		<h3 class="title-w3 mb-5 text-center text-wh font-weight-bold">Upload
			Question</h3>
	</div>

	<div class="margin col-12">


		<div class="container">
			<div>
			<p style="color: red;">${msgerr }</p>
				<form method="Post"
					action="${pageContext.request.contextPath }/teacher/question/upload">
					<div class="input-group mb-3 col-12">
						<select class="custom-select" id="inputGroupSelect02"
							name="subject">

							<c:forEach var="sj" items="${subjects }">
								<option value="${sj.id}"  ${subjectIDParam ==  sj.id ? "selected":""}>${sj.name }</option>
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
						<textarea rows="3" class="form-control  col-12" name="question">${questionParam }</textarea>
					</div>

					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub</span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSubs"></textarea>
						<div class="input-group-text">
							<input type="checkbox" name="correct" value="1">
						</div>
					</div>
					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub</span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSubs"></textarea>
						<div class="input-group-text">
							<input type="checkbox" name="correct" value="2">
						</div>
					</div>

					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub</span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSubs"></textarea>
						<div class="input-group-text">
							<input type="checkbox" name="correct" value="3">
						</div>
					</div>

					<br>
					<!-- sssss -->
					<div class="input-group col-12">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">Questionsub</span>
						</div>
						<textarea rows="1" class="form-control  col-12"
							name="questionSubs"></textarea>
						<div class="input-group-text">
							<input type="checkbox" name="correct" value="4">
						</div>
					</div>
					<br>
					<tr>
						<td>&nbsp</td>

						<button type="submit" class="btn btn-outline-primary col-10">Submit</button>
					</tr>
					</table>
			</div>
			</form>
		</div>

		<br>
	</div>