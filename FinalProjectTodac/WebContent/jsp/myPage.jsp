<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="sy_fonts/icomoon/style.css">

    <link rel="stylesheet" href="sy_css/bootstrap.min.css">
    <link rel="stylesheet" href="sy_css/magnific-popup.css">
    <link rel="stylesheet" href="sy_css/jquery-ui.css">
    <link rel="stylesheet" href="sy_css/owl.carousel.min.css">
    <link rel="stylesheet" href="sy_css/owl.theme.default.min.css">

    <link rel="stylesheet" href="sy_css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="sy_fonts/flaticon/font/flaticon.css">



    <link rel="stylesheet" href="sy_css/aos.css">

    <link rel="stylesheet" href="sy_css/style.css">
    <script> 
$(function(){ 

var $win = $(window); 
var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
/*사용자 설정 값 시작*/ 
var speed = 500; 
// 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec) 

var easing = 'linear'; 
// 따라다니는 방법 기본 두가지 linear, swing 

var $layer = $('.float_sidebar'); 
// 레이어 셀렉팅 
var layerTopOffset = 0; 
// 레이어 높이 상한선, 단위:px 

$layer.css('position', 'relative').css('z-index', '1'); 
/*사용자 설정 값 끝*/ 
// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해 
if (top > 0 ) $win.scrollTop(layerTopOffset+top); 
else $win.scrollTop(0); 
//스크롤이벤트가 발생하면 

$(window).scroll(function(){ yPosition = $win.scrollTop() - 1100; 

//이부분을 조정해서 화면에 보이도록 맞추세요 

if (yPosition < 0) { yPosition = 0; } $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false}); }); 
}); 
</script>


    
</head>
<body>
    <script src="sy_js/jquery-3.3.1.min.js"></script>
  <script src="sy_js/jquery-migrate-3.0.1.min.js"></script>
  <script src="sy_js/jquery-ui.js"></script>
  <script src="sy_js/popper.min.js"></script>
  <script src="sy_js/bootstrap.min.js"></script>
  <script src="sy_js/owl.carousel.min.js"></script>
  <script src="sy_js/jquery.stellar.min.js"></script>
  <script src="sy_js/jquery.countdown.min.js"></script>
  <script src="sy_js/jquery.magnific-popup.min.js"></script>
  <script src="sy_js/bootstrap-datepicker.min.js"></script>
  <script src="sy_js/aos.js"></script>

  <script src="sy_js/main.js"></script>

<%-- <jsp:include page="header.jsp"></jsp:include> --%>
 
  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    
   <header class="site-navbar py-3" role="banner">

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-11 col-xl-2">
            <h1 class="mb-0"><a href="index.html" class="text-white h2 mb-0">Logistics</a></h1>
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About Us</a></li>
                <li class="has-children">
                  <a href="services.html">Services</a>
                  <ul class="dropdown">
                    <li><a href="#">Air Freight</a></li>
                    <li><a href="#">Ocean Freight</a></li>
                    <li><a href="#">Ground Shipping</a></li>
                    <li><a href="#">Warehousing</a></li>
                    <li><a href="#">Storage</a></li>
                  </ul>
                </li>
                <li><a href="industries.html">Industries</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li class="active"><a href="contact.html">Contact</a></li>
              </ul>
            </nav>
          </div>


          <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>
      
    </header>
  

    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(sy_images/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Mypage</h1>
            <p class="breadcrumb-custom"><a href="index.html">Home</a> <span class="mx-2">&gt;</span> <span>Mypage</span></p>
          </div>
        </div>
      </div>
    </div>
    
    
    
<div class="col-md-3">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">Panel Title</h3>
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group">
      <li class="list-group-item"><a href="#">HTML</a></li>
      <li class="list-group-item"><a href="#">CSS</a></li>
      <li class="list-group-item"><a href="#">ECMAScript5</a></li>
    </ul>
</div>
  <!-- 패널 타이틀2 -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Panel Title</h3>
  </div>
    <!-- 사이드바 메뉴목록2 -->
      <ul class="list-group">
        <li class="list-group-item"><a href="#">jQuery</a></li>
        <li class="list-group-item"><a href="#">BootStrap</a></li>
      </ul>
</div>      
  <!-- 패널 타이틀3 -->
<div class="panel panel-info">
  <div class="panel-heading">
    <h3 class="panel-title">Panel Title</h3>
  </div>
      <!-- 사이드바 메뉴목록3 -->
      <ul class="list-group">
        <li class="list-group-item"><a href="#">About</a></li>
        <li class="list-group-item"><a href="#">Help</a></li>
      </ul>
    </div>
</div>
    
    
    
      
</body>
</html>