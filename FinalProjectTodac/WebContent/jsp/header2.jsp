<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Todac</title>
<link rel="stylesheet" href="forcss/todac.css">
<link rel="icon" href="img/todac_ori.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">


#menuIcon {
	position: fixed;
	left: 0%;
	top: 50%;
	width: 50px;
	height: auto;
	cursor: pointer;
	z-index: 10;
}

#SideDiv {
	width: 250px;
	height: 100%;
	position: fixed;
	top: 0px;
	left: -252px;
	z-index: 100;
	border: 1px solid #f2f2f2;
	background-color: #f2f2f2;
	text-align: center;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
}

#SideDiv.open {
	left: 0px;
}

#headerDiv {
	position: relative;
	z-index: 5;
}

#close {
	margin-left: 218px;
	cursor: pointer;
	right: 0px;
	top: 0px;
	cursor: pointer;
}

#PopSearchTable {
	position: relative;
	margin-top: 30px;
	left: px;
	width: 100%;
}

#pop {
	text-align: center;
	font-size: xx-large;
}

.popTd {
	font-size: 25px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$('document')
			.ready(
					function() {
						$
								.ajax({
									url : "getSessionId.do",
									success : function(data) {
										var res = data;
										if (data != "") {
											var text = "";

											text = text
													+ '<div class="card" style="margin-top:40px;">'
											text = text
													+ '<div class="card-header" style="height: 30px; text-align:left; padding: 0px;">'
													+ data + '님 환영합니다!</div>'
											text = text
													+ '<div class="card-body" style="height: 70px;"><a href="show_mypage.do">내 정보  </a> 　　　<a href="logout.do">로그아웃 </a></div>'
											text = text + '</div>'

											$('#loginDiv').html("")
											$('#loginDiv').html(text)
										}
									}

								});

						$.ajax({
							url : "get10Disease.do",
							success : function(data) {
								var res = "";
								for (var i = 0; i < data.length; i++) {
									res = res + '<tr><td class="popTd"><a href="diseaseSearchForm.do?keyword='+data[i].keyword+'">'
											+ (i + 1) + "." + data[i].keyword
											+ "</a></td></tr>"

								}
								$('#popBody').html(res);
							}

						});

						$("#menuIcon").bind('click', function() {
							$("#SideDiv").addClass("open");

						});
						$("#close").click(function() {
							$("#SideDiv").removeClass("open");
						});
						$('#loginBtn').click(function() {
							location.href = "loginForm.do";
						})

					});
</script>
</head>
<body>
	<div id="headerDiv" style="height: 90px;">
		<!--::header part start::-->
		<header class="main_menu home_menu">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg navbar-light">
							<a class="navbar-brand" href="todacMainForm.do"> <img
								src="img/todac_ori.png" alt="logo" width="150px;" height="auto;">
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div
								class="collapse navbar-collapse main-menu-item justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav align-items-center">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="blog.html"
										id="navbarDropdown" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"><font
											face="Jua" size="6px"> 서비스 소개</font> </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">토닥이란?</a> <a
												class="dropdown-item" href="#">팀 토닥 소개</a> <a
												class="dropdown-item" href="#">rorem Ipsum?</a>
										</div></li>
									<li class="nav-item active"><a class="nav-link"
										href="HospitalInfo_TestMain.do"><font face="Jua"
											size="6px">병원 검색</font></a></li>

									<li class="nav-item active"><a class="nav-link"
										href="diseaseSearchForm.do"><font face="Jua"
											size="6px">질병 정보 검색</font></a></li>

									<li class="nav-item"><a class="nav-link" href="#"><font
											face="Jua" size="6px">병원 평가 정보</font></a></li>
									<li class="nav-item"><a class="nav-link"
										href="noticeListForm.do"><font face="Jua" size="6px">공지사항</font></a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>
	</div>
	<!-- Header part end-->
	<!-- Left Menu Icon Start-->
	<img src="img/menu.png" id="menuIcon">

	<div id="SideDiv">
		<img alt="" src="img/closeIcon.png" id="close" width="30px;"
			height="30px;">
		<div id="loginDiv">

			<button type="button" class="btn btn-primary" id="loginBtn"
				style="width: 200px; height: 70px; border-color: #ccdcff; background-color: #ccdcff; font-size: large; font-weight: bold; color: #808080; margin-top: 40px;">통합
				로그인</button>

		</div>
		<table id="PopSearchTable" class="table-hover">
			<tr>
				<th id="pop">주요 검색어</th>
			</tr>
			<tbody style="background-color: white" id="popBody">

			</tbody>
		</table>
	</div>
	<!-- Left Menu Icon End -->

</body>
</html>
