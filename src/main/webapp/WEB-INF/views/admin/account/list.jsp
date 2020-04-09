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
	</br> </br> </br> </br> </br> </br>
	<div>
		<h3>CV List</h3>
	</div>
	<div class="container">
		<form action="${pageContext.request.contextPath }/admin/account/index"
			method="post">
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="inputCity">Role</label> <select name="role"
						class="form-control">
						<option value="0" ${selectedRole == 0 ? "selected" : "" }>All</option>
						<c:forEach var="role" items="${roles }">
							<option ${selectedRole == role.id ? "selected" : "" }
								value="${role.id }">${role.name }</option>
						</c:forEach>
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
				<th scope="col" class="col-1">#</th>
					<th scope="col" class="col-2">Username</th>
					<th scope="col" class="col-4">Fullname</th>
					<th scope="col" class="col-2">Gender</th>
					<th scope="col" class="col-3">Address</th>
					<th scope="col" class="col-1">Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="accountRole" items="${accountRoles }" varStatus="a">
					<tr>
						<td>${a.index +1 }</td>
						<td>${accountRole.account.username }</td>
						<td>${accountRole.account.fullname }</td>
						<td>${accountRole.account.gender == true ?"Male":"Female"}</td>
						<td>${accountRole.account.address}</td>
						<td><a href="${pageContext.request.contextPath }/admin/account/detail/${accountRole.id}">View</a> </td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
