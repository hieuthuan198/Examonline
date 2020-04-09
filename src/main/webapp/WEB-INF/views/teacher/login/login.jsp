<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OEP||Login</title>
</head>
<body>
 <!-- inner banner -->
    <div class="inner-banner-w3ls py-5" id="home">
        <div class="container py-xl-5 py-lg-3">
            <!-- login  -->
            <div class="modal-body my-5 pt-4">
                <h3 class="title-w3 mb-5 text-center text-wh font-weight-bold">Login For Teacher</h3>
                <form action="${pageContext.request.contextPath}/teacher/process" method="post" >
                    <div class="form-group">
                        <label class="col-form-label">Username:</label>
                        <input  type="text" class="form-control" placeholder="Username" name="username" />
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Password:</label>
                        <input type="password" class="form-control" placeholder="*****" name="password" />
                    </div>
                   <p style="color: red; font-size: 16">${mess } ${mes }</p>
                    <button type="submit" class="btn button-style-w3">Login</button>

                    <p class="text-center dont-do text-style-w3ls text-li">Don't have an account?
                        <a href="${pageContext.request.contextPath }/teacher-register" class="font-weight-bold text-li">
                            Register Now</a>
                    </p>
                </form>
            </div>
            <!-- //login -->
        </div>
    </div>
    <!-- //inner banner -->

</body>
</html>