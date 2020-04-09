<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                <h3 class="title-w3 mb-5 text-center text-wh font-weight-bold">Đăng nhập</h3>
                <form action="${pageContext.request.contextPath }/student/process" method="post" >
                    <div class="form-group">
                        <label class="col-form-label">Tên đăng nhập:</label>
                        <input  type="text" class="form-control" placeholder="Username" name="username" >
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Mật khẩu:</label>
                        <input type="password" class="form-control" placeholder="*****" name="password" >
                    </div>
                    <div class="col-md-8">
									<p style="color: red">${ mess }</p>
								</div>
                    <button type="submit" class="btn button-style-w3">Đăng nhập</button>
                    
                    <p class="text-center dont-do text-style-w3ls text-li">Bạn chưa có tài khoảng?
                        <a href="${pageContext.request.contextPath }/student-register" class="font-weight-bold text-li">
                            Đăng ký ngay</a>
                    </p>
                </form>
            </div>
            <!-- //login -->
        </div>
    </div>
    <!-- //inner banner -->

</body>
</html>