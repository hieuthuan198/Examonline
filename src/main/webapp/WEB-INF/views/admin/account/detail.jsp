<%@ page language="java" contentType="text/html; charset=UtF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script>
	$(document).ready(function() {
		$('img').error(function() {
			$(this).attr("src", src = "/uploads/images/account/personal.jpg")
		}

		)
	})
	function keyPhone(e) {
		var keyword = null;
		if (window.event) {
			keyword = window.event.keyCode;
		} else {
			keyword = e.which; //NON IE;
		}

		if (keyword<48 || keyword>57) {
			if (keyword == 48 || keyword == 127) {
				return;
			}
			return false;
		}
	}
</script>
<style>
body {
	background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}

.image {
	width: 300px height: 300px
}

.emp-profile {
	padding: 3%;
	margin-top: 3%;
	margin-bottom: 3%;
	border-radius: 0.5rem;
	background: #fff;
}

.profile-img {
	text-align: center;
}

.profile-img img {
	width: 70%;
	height: 100%;
}

.profile-img .file {
	position: relative;
	overflow: hidden;
	margin-top: -20%;
	width: 70%;
	border: none;
	border-radius: 0;
	font-size: 15px;
	background: #212529b8;
}

.profile-img .file input {
	position: absolute;
	opacity: 0;
	right: 0;
	top: 0;
}

.profile-head h5 {
	color: #333;
}

.profile-head h6 {
	color: #0062cc;
}

.profile-edit-btn {
	border: none;
	border-radius: 1.5rem;
	width: 70%;
	padding: 2%;
	font-weight: 600;
	color: #6c757d;
	cursor: pointer;
}

.proile-rating {
	font-size: 12px;
	color: #818182;
	margin-top: 5%;
}

.proile-rating span {
	color: #495057;
	font-size: 15px;
	font-weight: 600;
}

.profile-head .nav-tabs {
	margin-bottom: 5%;
}

.profile-head .nav-tabs .nav-link {
	font-weight: 600;
	border: none;
}

.profile-head .nav-tabs .nav-link.active {
	border: none;
	border-bottom: 2px solid #0062cc;
}

.profile-work {
	padding: 14%;
	margin-top: -15%;
}

.profile-work p {
	font-size: 12px;
	color: #818182;
	font-weight: 600;
	margin-top: 10%;
}

.profile-work a {
	text-decoration: none;
	color: #495057;
	font-weight: 600;
	font-size: 14px;
}

.profile-work ul {
	list-style: none;
}

.profile-tab label {
	font-weight: 600;
}

.profile-tab p {
	font-weight: 600;
	color: #0062cc;
}

.nen {
	background-image: url("/uploads/images/nen.jpg");
	background-color: red;
}
</style>
<br>
<br>
<br>


<section class="home_banner_area">
	<div class="container box_1620" align="center">
		<div class="banner_inner d-flex align-items-center">
			<div class="banner_content">
				<div class="media">
					<div class="d-flex">
						<img style="height: 400px; width: 700px" class=" image col-6"
							src="/uploads/images/account/${accountRole.account.id }.png" alt="No pictures yet">
					</div>
					<div class="media-body">
						<div class="personal_text">
							<div class="col-md-1 col-6">
								<div class="row">
									<div class="col-md-12 ">
										<h3>${accountRole.account.fullname }</h3>
									</div>

									<div class="col-md-6 ">
										<label>User Name:</label>
									</div>
									<div class="col-md-6">
										<p>${accountRole.account.username }</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<label>Gender:</label>
									</div>
									<div class="col-md-6">
										<p>${accountRole.account.gender==true ? "Male" : "Femail" }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Age:</label>
									</div>
									<div class="col-md-6">
										<p>${accountRole.account.age }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Email</label>
									</div>
									<div class="col-md-6">
										<p>${accountRole.account.email }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Phone:</label>
									</div>
									<div class="col-md-6">
										<p>${accountRole.account.numberPhone }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Address:</label>
									</div>
									<div class="col-md-6">
										<p>${accountRole.account.address }</p>
									</div>
								</div>
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<style>
.profile_area { .col-lg-7 { vertical-align:middle;
	align-self: center;
}

}
.profile_inner {
	border-bottom: 1px solid #eeeeee;
	.
	personal_text
	{
	padding-left
	:
	95px;
}

}
.personal_text {h6 { font-size:14px;
	font-family: $ rob;
	text-transform: uppercase;
	letter-spacing: 2.1px;
	font-weight: normal;
	margin-bottom: 12px;
	color: $dip;
}

h4 {
	font-size: 16px;
	font-weight: 500;
	font-family: $ rob;
	text-transform: uppercase;
	margin-bottom: 20px;
	color: $dip;
}

h3 {
	font-size: 48px;
	text-transform: uppercase;
	margin-bottom: 15px;
	color: $dip;
}

p {
	font-family: $ rob;
	max-width: 540px;
	color: $pfont;
	margin-bottom: 40px;
}

.basic_info {li { margin-bottom:15px;a { position:relative;
	padding-left: 40px;
	font-size: 16px;
	color: $pfont; i { position : absolute;
	left: 0px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 20px;
	color: $baseColor;
}

}
&
:last-child {
	margin-bottom: 0px;
}

}
}
.personal_social {
	margin-top: 45px; li { display : inline-block;
	margin-right: 7px;
	&:
	last-child
	{
	margin-right
	:
	0px;
}

a {
	line-height: 40px;
	width: 40px;
	background: #e8e8e8;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
	color: #fff;
	font-size: 16px;
}

&
:hover {a { background-image:-moz-linear-gradient(0deg, rgb(118, 109,
	255)0%, rgb(136, 243, 255)100%);
	background-image: -webkit-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
	background-image: -ms-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
}

}
}
}
}
.home_banner_area {
	position: relative;
	z-index: 1;
	background-image: -moz-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
	background-image: -webkit-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
	background-image: -ms-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
	margin-bottom: 200px; . box_1620 { min-height : 700px;
	border-radius: 12px;
	position: relative;
	bottom: -200px;
	background: #fff;
	padding: 30px;
	box-shadow: 0px 20px 80px 0px rgba(153, 153, 153, 0.3);
}

.banner_inner {
	position: relative;
	width: 100%;
	min-height: 700px;
	display: flex; // . overlay { // background :
	url(../img/banner/home-banner.jpg) no-repeat scroll center center; //
	position: absolute; //
	left: 0; //
	right: 0; //
	top: 0; //
	height: 121%; //
	bottom: 0; //
	z-index: -1;
	//
}

.banner_content {
	color: $dip;
	vertical-align: middle;
	align-self: center;
	text-align: left;
	.
	media
	{
	.d-flex{
	padding-right
	:
	125px;
}

.media-body {
	vertical-align: middle;
	align-self: center;
}

}
}
}
}
.blog_banner {
	min-height: 780px;
	position: relative;
	z-index: 1;
	overflow: hidden;
	margin-bottom: 0px; . banner_inner { background : #04091e;
	position: relative;
	overflow: hidden;
	width: 100%;
	min-height: 780px;
	z-index: 1; . overlay { background : url(../img/banner/banner-2.jpg)
	no-repeat scroll center center;
	opacity: .5;
	height: 125%;
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
	z-index: -1;
}

.blog_b_text {
	max-width: 700px;
	margin: auto;
	color: #fff; h2 { font-size : 60px;
	font-weight: bold;
	font-family: $ hee;
	line-height: 66px;
	margin-bottom: 15px;
	text-transform: uppercase;
}

p {
	font-size: 16px;
	margin-bottom: 35px;
}

.white_bg_btn {
	line-height: 42px;
	padding: 0px 45px;
	border-radius: 5px;
}

}
}
}
.banner_box {
	max-width: 1620px;
	margin: auto;
}

.banner_area {
	position: relative;
	z-index: 1;
	min-height: 350px;
	background-image: -moz-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
	background-image: -webkit-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
	background-image: -ms-linear-gradient(0deg, rgb(118, 109, 255) 0%,
		rgb(136, 243, 255) 100%);
	margin-bottom: 120px; . box_1620 { background : #fff;
	min-height: 360px;
	border-radius: 12px;
	position: relative;
	bottom: -120px;
	box-shadow: 0px 20px 80px 0px rgba(153, 153, 153, 0.3);
}

.banner_inner {
	position: relative;
	overflow: hidden;
	width: 100%;
	min-height: 360px;
	z-index: 1; // . overlay { // background :
	url(../img/banner/banner.jpg) no-repeat scroll center center; //
	position: absolute; //
	left: 0; //
	right: 0; //
	top: 0; //
	height: 125%; //
	bottom: 0; //
	z-index: -1; //
	opacity: .6;
	//
}

.banner_content {h2 { color: $dip;
	font-size: 48px;
	font-family: $ hee;
	margin-bottom: 0px;
	font-weight: bold;
}

.page_link {a { font-size:14px;
	color: $dip;
	font-family: $ rob;
	margin-right: 32px;
	position: relative; &: before { content : "\e87a";
	font-family: 'Linearicons-Free';
	position: absolute;
	right: -25px;
	top: 50%;
	transform: translateY(-50%);
}

&
:last-child {
	margin-right: 0px;
	&:
	before
	{
	display
	:
	none;
}

}
&
:hover {
	color: $baseColor;
}

}
}
}
}
}
.list {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

a {
	text-decoration: none;
	transition: all 0.3s ease-in-out; &: hover , & : focus {
       text-decoration : none;
	outline: none;
}

}
.row.m0 {
	margin: 0px;
}

body {
	line-height: 26px;
	font-size: 16px;
	font-family: $ rob;
	font-weight: normal;
	color: $pfont;
}

h1, h2, h3, h4, h5, h6 {
	font-family: $ hee;
	font-weight: bold;
}

button:focus {
	outline: none;
	box-shadow: none;
}

.p0 {
	padding-left: 0px;
	padding-right: 0px;
}

.p_120 {
	padding-top: 120px;
	padding-bottom: 120px;
}

.p_100 {
	padding-top: 100px;
	padding-bottom: 100px;
}

.pad_top {
	padding-top: 120px;
}

.pad_bt {
	padding-bottom: 120px;
}

.mt-25 {
	margin-top: 25px;
}

.container {@media (min-width :1200px){max-width: 1170px ;
	
}

}
@media ( min-width : 1620px) {
	.box_1620 {
		max-width: 1620px;
		margin: auto;
		width: 100%;
		padding-left: 0px;
		padding-right: 0px;
	}
}

/* Main Title Area css
============================================================================================ */
.main_title {
	text-align: center;
	max-width: 670px;
	margin: 0px auto 75px; h2 { font-family : $ hee;
	font-size: 36px;
	color: $dip;
	margin-bottom: 15px;
	text-transform: uppercase;
}

p {
	font-size: 16px;
	font-family: $ rob;
	font-weight: normal;
	line-height: 26px;
	color: $pfont;
	margin-bottom: 0px;
}
}

/* End Main Title Area css
============================================================================================ */
</style>