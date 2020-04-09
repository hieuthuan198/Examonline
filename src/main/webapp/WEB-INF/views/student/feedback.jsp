<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <style>
.error {
	color: red;
}
</style>
<br>
<br>
<br>
<br>
<br>
<div class="gallery-cont pb-5 col-8" style="margin: auto;" id="gallery">
	<h1 style="text-align: center;">Feedback From Student</h1>

	<form action="${pageContext.request.contextPath }/student/feedback" method="post">
		<div class="form-row">
			<div class="form-group col-md-12">
				<p style="color: red;">${msserr }</p>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-12">
				<label for="inputCity">To</label> <select name="accountID"
						class="form-control">
						<c:forEach var="accountRole" items="${accountRoles }">
							<option value="${accountRole.account.id }" ${accountRole.account.id == accountID? "selected" : "" }>${accountRole.account.username } - ${accountRole.role.name }</option>
						</c:forEach>
					</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputAddress">Subject</label> <input name="subject" type="text"
				class="form-control" id="inputAddress" placeholder="input subject"value="${subject }">
		</div>
		<div class="form-group">
			<label for="inputAddress2">Content</label>
			<textarea name="content" rows="5" class="form-control" placeholder="input feedback">${content }</textarea>
		</div>
		<div style="text-align: center;">
			<button type="submit" class="btn btn-primary col-6">SEND</button>
		</div>
	</form>
</div>