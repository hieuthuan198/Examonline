<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OEP||Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link
	href="${pageContext.request.contextPath }/resources/admin/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link
	href="${pageContext.request.contextPath }/resources/admin/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!--js-->
<script
	src="${pageContext.request.contextPath }/resources/admin/js/jquery-2.1.1.min.js"></script>
<!--icons-css-->
<link
	href="${pageContext.request.contextPath }/resources/admin/css/font-awesome.css"
	rel="stylesheet">
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600'
	rel='stylesheet' type='text/css'>
<!--static chart-->
<script
	src="${pageContext.request.contextPath }/resources/admin/js/Chart.min.js"></script>
<!--//charts-->
<!-- geo chart -->
<link
	href="${pageContext.request.contextPath }/resources/admin/css/demo-page.css"
	rel="stylesheet" media="all">
<link
	href="${pageContext.request.contextPath }/resources/admin/css/hover.css"
	rel="stylesheet" media="all">
<script src="//cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
<script>
	window.modernizr
			|| document
					.write('<script src="lib/modernizr/modernizr-custom.js"><\/script>')
</script>
<!--<script src="lib/html5shiv/html5shiv.js"></script>-->
<!-- Chartinator  -->
<script
	src="${pageContext.request.contextPath }/resources/admin/js/chartinator.js"></script>
<script type="text/javascript">
	jQuery(function($) {

		var chart3 = $('#geoChart').chartinator(
				{
					tableSel : '.geoChart',

					columns : [ {
						role : 'tooltip',
						type : 'string'
					} ],

					colIndexes : [ 2 ],

					rows : [ [ 'China - 2015' ], [ 'Colombia - 2015' ],
							[ 'France - 2015' ], [ 'Italy - 2015' ],
							[ 'Japan - 2015' ], [ 'Kazakhstan - 2015' ],
							[ 'Mexico - 2015' ], [ 'Poland - 2015' ],
							[ 'Russia - 2015' ], [ 'Spain - 2015' ],
							[ 'Tanzania - 2015' ], [ 'Turkey - 2015' ] ],

					ignoreCol : [ 2 ],

					chartType : 'GeoChart',

					chartAspectRatio : 1.5,

					chartZoom : 1.75,

					chartOffset : [ -12, 0 ],

					chartOptions : {

						width : null,

						backgroundColor : '#fff',

						datalessRegionColor : '#F5F5F5',

						region : 'world',

						resolution : 'countries',

						legend : 'none',

						colorAxis : {

							colors : [ '#679CCA', '#337AB7' ]
						},
						tooltip : {

							trigger : 'focus',

							isHtml : true
						}
					}

				});
	});
</script>
<!--geo chart-->

<!--skycons-icons-->
<script
	src="${pageContext.request.contextPath }/resources/admin/js/skycons.js"></script>
<!--//skycons-icons-->
</head>
<body>

	<div class="page-container">
		<div class="left-content">
			<div class="mother-grid-inner">
				<!--header start here-->
				<div class="header-main">
					<div class="header-left">
						<div class="logo-name">
							<a href="${pageContext.request.contextPath }/admin/home">
								<h1>EXAM ONLINE</h1> <!--<img id="logo" src="" alt="Logo"/>-->
							</a>
						</div>

						<div class="clearfix"></div>
					</div>
					<div class="header-right">

						<!--notification menu end -->
						<div class="profile_details">
							<ul>
								<li class="dropdown profile_details_drop"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="false">
										<div class="profile_img">
											
											<div class="user-name">
												
												<span>Administrator</span>
											</div>
											<i class="fa fa-angle-down lnr"></i> <i
												class="fa fa-angle-up lnr"></i>
											<div class="clearfix"></div>
										</div>
								</a>
									<ul class="dropdown-menu drp-mnu">

										<li><a
											href="${pageContext.request.contextPath }/admin/process/logout"><i
												class="fa fa-sign-out"></i> Logout</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--heder end here-->
				<!-- script-for sticky-nav -->
				<script>
					$(document).ready(function() {
						var navoffeset = $(".header-main").offset().top;
						$(window).scroll(function() {
							var scrollpos = $(window).scrollTop();
							if (scrollpos >= navoffeset) {
								$(".header-main").addClass("fixed");
							} else {
								$(".header-main").removeClass("fixed");
							}
						});

					});
				</script>
				<!-- /script-for sticky-nav -->
				<!--inner block start here-->
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
				<!--inner block end here-->
				<!--copy rights start here-->
				<div class="copyrights">
					<p>
						© 2016 Shoppy. All Rights Reserved | Design by <a
							href="http://w3layouts.com/" target="_blank">W3layouts</a>
					</p>
				</div>
				<!--COPY rights end here-->
			</div>
		</div>
		<!--slider menu-->
		<div class="sidebar-menu">
			<div class="logo">
				<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span>
				</a> <a href="#"> <span id="logo"></span> <!--<img id="logo" src="" alt="Logo"/>-->
				</a>
			</div>
			<div class="menu">
				<ul id="menu">
					<li id="menu-home"><a
						href="${pageContext.request.contextPath }/admin/home"><i
							class="fa fa-tachometer"></i><span>Home</span></a></li>
					<li id="menu-comunicacao"><a
						href="${pageContext.request.contextPath }/admin/subject"><i
							class="fa fa-book nav_icon"></i><span>Subject</span><span
							class="fa fa-angle-right" style="float: right"></span></a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-arquivos"><a
								href="${pageContext.request.contextPath }/admin/subject">List
									Subject</a></li>
							<li id="menu-arquivos"><a
								href="${pageContext.request.contextPath }/admin/subject/add">Create
									Subject</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath }/admin/exam/index"><i class="fa fa-list-alt"></i><span>Exam</span></a></li>
					<li id="menu-academico"><a href="${pageContext.request.contextPath }/admin/questions/index"><i
							class="fa fa-file-text"></i><span>Questions</span></a></li>
					<li><a
						href="${pageContext.request.contextPath }/admin/feedback/index"><i
							class="fa fa-envelope"></i><span>Feedback</span></a></li>
					<li><a
						href="${pageContext.request.contextPath }/admin/cv/index"><i
							class="glyphicon glyphicon-edit"></i><span>CV</span></a></li>
					<li><a href="${pageContext.request.contextPath }/admin/account/index"><i class="fa fa-user"></i><span>Account</span></a>
					</li>
					<li><a href="#"><i class="fa fa-file-o"></i><span>Bill</span></a></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--slide bar menu end here-->
	<script>
		var toggle = true;

		$(".sidebar-icon").click(
				function() {
					if (toggle) {
						$(".page-container").addClass("sidebar-collapsed")
								.removeClass("sidebar-collapsed-back");
						$("#menu span").css({
							"position" : "absolute"
						});
					} else {
						$(".page-container").removeClass("sidebar-collapsed")
								.addClass("sidebar-collapsed-back");
						setTimeout(function() {
							$("#menu span").css({
								"position" : "relative"
							});
						}, 400);
					}
					toggle = !toggle;
				});
	</script>
	<!--scrolling js-->
	<script
		src="${pageContext.request.contextPath }/resources/admin/js/jquery.nicescroll.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/js/scripts.js"></script>
	<!--//scrolling js-->
	<script
		src="${pageContext.request.contextPath }/resources/admin/js/bootstrap.js">
		
	</script>
	<!-- mother grid end here-->

</body>
</html>