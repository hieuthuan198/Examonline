<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OEP||HOME</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords"
	content="My School Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //Meta tag Keywords -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Custom-Files -->
<link
	href="${pageContext.request.contextPath }/resources/student/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- Bootstrap-CSS -->
<link
	href="${pageContext.request.contextPath }/resources/student/css/style.css"
	rel='stylesheet' type='text/css' />
<!-- Style-CSS -->
<link
	href="${pageContext.request.contextPath }/resources/student/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Font-Awesome-Icons-CSS -->
<!-- //Custom-Files -->

<!-- Web-Fonts -->
<link
	href="//fonts.googleapis.com/css?family=Lora:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext,vietnamese"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext"
	rel="stylesheet">
<!-- //Web-Fonts -->
</head>
<body>
	<header>
		<div class="container">
			<div
				class="header d-lg-flex justify-content-between align-items-center py-2 px-sm-2 px-1">
				<!-- logo -->
				<div id="logo">
					<h1>
						<a href="${pageContext.request.contextPath }/student/home/index">EXAM
							ONLINE</a>
					</h1>
				</div>
				<!-- //logo -->
				<!-- nav -->
				<div class="nav_w3ls ml-lg-5">
					<nav>
						<label for="drop" class="toggle">Menu</label> <input
							type="checkbox" id="drop" />
						<ul class="menu">
							<li><a
								href="${pageContext.request.contextPath }/student/home/index">TRANG CHỦ</a></li>
							<li><a
								href="${pageContext.request.contextPath }/student/selectExam/index">TRẮC NGHIỆM</a></li>
							<li><a
								href="${pageContext.request.contextPath }/student/resultList">KẾT QUẢ</a></li>
							<li><!-- First Tier Drop Down --> <label for="drop-2"
								class="toggle toogle-2 glyphicon glyphicon-user"><span
									class="glyphicon glyphicon-user"></span>FEEDBACK<span
									class="fa fa-angle-down" aria-hidden="true"></span> </label> <a
								href="#">FEEDBACK<span class="fa fa-angle-down"
									aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
							<ul>
							<li><a
								href="${pageContext.request.contextPath }/student/feedback/list">LIST
									FEEDBACK</a></li>
							<li><a
								href="${pageContext.request.contextPath }/student/feedback">FEEDBACK</a></li>
								</ul>
								</li>


							<li>
								<!-- First Tier Drop Down --> <label for="drop-2"
								class="toggle toogle-2 glyphicon glyphicon-user"><span
									class="glyphicon glyphicon-user"></span>TÀI KHOẢNG<span
									class="fa fa-angle-down" aria-hidden="true"></span> </label> <a
								href="#">TÀI KHOẢNG<span class="fa fa-angle-down"
									aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
								<ul>
									<li><a
										href="${pageContext.request.contextPath }/student/profile"><span
											class="glyphicon glyphicon-user"></span> THÔNG TIN TÀI KHOẢNG</a></li>
									<li><a
										href="${pageContext.request.contextPath }/student/process/logout"><span
											class="glyphicon glyphicon-log-out"></span> ĐĂNG XUẤT</a></li>

								</ul>
							</li>

						</ul>
					</nav>
				</div>
				<!-- //nav -->
			</div>
		</div>
	</header>
	<!-- //header -->

	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	<!-- footer -->
	<footer class="py-5">
		<div class="container py-xl-4 py-lg-3">
			<div class="row footer-grids">
				<div class="col-lg-2 col-6 footer-grid">
					<h3 class="mb-sm-4 mb-3">Danh Mục</h3>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath }/home">Exam
								Home</a></li>
						<li><a href="#about">Giới thiệu</a></li>
						<li><a href="#what">What We Do?</a></li>
						<li><a href="#gallery">Our Gallery</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-6 footer-grid">
					<h3 class="mb-sm-4 mb-3">Mở rộng</h3>
					<ul class="list-unstyled">
				
						
						<li><a
							href="${pageContext.request.contextPath }/student/exam">Thi
								Online</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-6 footer-grid footer-contact mt-lg-0 mt-4">
					<h3 class="mb-sm-4 mb-3">Liên lạc và phản hồi</h3>
					<ul class="list-unstyled">
						<li>+092 1800 674</li>
						<li><a href="mailto:info@example.com">vothanhloccv@gmail.com</a>
						</li>
					</ul>
				</div>

				<div class="col-lg-4 footer-grid mt-lg-0 mt-4">
					<div class="footer-logo">
						<h2 class="text-lg-center text-center">
							<a class="logo text-wh font-weight-bold"
								href="${pageContext.request.contextPath }/student/home/index"> EXAM
								ONLINE</a>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- //footer -->
	<!-- copyright -->
	<div class="copyright-w3ls py-4">
		<div class="container">
			<div class="row">
				<!-- copyright -->
				
				<!-- //copyright -->
				<!-- social icons -->
				<div
					class="col-lg-4 w3social-icons text-lg-right text-center mt-lg-0 mt-3">
					<ul>
						<li><a href="#" class="rounded-circle"> <span
								class="fa fa-facebook-f"></span>
						</a></li>
						<li class="px-2"><a href="#" class="rounded-circle"> <span
								class="fa fa-google-plus"></span>
						</a></li>
						<li><a href="#" class="rounded-circle"> <span
								class="fa fa-twitter"></span>
						</a></li>
						<li class="pl-2"><a href="#" class="rounded-circle"> <span
								class="fa fa-dribbble"></span>
						</a></li>
					</ul>
				</div>
				<!-- //social icons -->
			</div>
		</div>
	</div>
	<!-- //copyright -->
	<!-- move top icon -->
	<a href="#home" class="move-top text-center"> <span
		class="fa fa-angle-double-up" aria-hidden="true"></span>
	</a>
	<!-- //move top icon -->

</body>
</html>