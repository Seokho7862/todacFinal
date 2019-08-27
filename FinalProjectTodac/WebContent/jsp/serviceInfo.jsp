<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥 &mdash;	TODAC</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<jsp:include page="mainBanner.jsp"></jsp:include>


    <!-- about us part start-->
    <section class="single_about_padding">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-md-6 col-lg-6">
                    <div class="about_us_img" style="margin-left: 30px">
                        <img src="img/todac_b.png" style="width: 8500px" alt="todac">
                    </div>
                </div>
                <div class="col-md-6 col-lg-5">
                    <div class="about_us_text">
                        <h2>토닥 &mdash;	TODAC</h2>
                        <p>아프지 말고 건강하게 TODAC!</p>
                        <a class="btn_2 " href="todacIntroForm.do">learn more</a>
                        <div class="banner_item">
                            <div class="single_item">
                                <img src="img/img_loc.png" alt="">
                                <h5>Location</h5>
                            </div>
                            <div class="single_item">
                                <img src="img/img_find.png" alt="">
                                <h5>Search</h5>
                            </div>
                            <div class="single_item">
                                <img src="img/icon/banner_3.svg" alt="">
                                <h5>Information</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about us part end-->






 <!-- our service part start-->
    <section class="our_depertment section_padding">
        <div class="container">
            <div class="row justify-content-center text-center">
                <div class="col-xl-12">
                    <div class="depertment_content">
                        <div class="row justify-content-center">
                            <div class="col-xl-8">
                                <h2>토닥 기능 소개</h2>
                                <div class="row">
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="single_our_depertment">
                                            <span class="our_depertment_icon"><img src="img/icon/PinClipart.com_party-popper-clipart_3755030.png"
                                                    alt=""></span>
                                            <h4>병원 검색</h4>
                                            <p> 진료과별 병원 검색<br>
                                            	키워드 병원 검색</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="single_our_depertment">
                                            <span class="our_depertment_icon"><img src="img/icon/PinClipart.com_party-popper-clipart_3755030.png"
                                                    alt=""></span>
                                            <h4>병원 정보</h4>
                                            <p>병원의 위치<br>
                                            	다양한 항목별 병원등급 정보제공</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="single_our_depertment">
                                            <span class="our_depertment_icon"><img src="img/icon/PinClipart.com_party-popper-clipart_3755030.png"
                                                    alt=""></span>
                                            <h4>병원 후기</h4>
                                            <p>알찬 후기를 통해서 사용자들에게<br>
                                            	유용한 정보 제공</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="single_our_depertment">
                                            <span class="our_depertment_icon"><img src="img/icon/PinClipart.com_party-popper-clipart_3755030.png"
                                                    alt=""></span>
                                            <h4>질병검색</h4>
                                            <p>질병에 관해 궁금한게 있으신가요? <br>
                                            	토닥의 질병검색 서비스를 통해서 정보를 얻어가세요.</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="single_our_depertment">
                                            <span class="our_depertment_icon"><img src="img/icon/PinClipart.com_party-popper-clipart_3755030.png"
                                                    alt=""></span>
                                            <h4>건강정보</h4>
                                            <p>전문가들이 제공하는  <br>알찬 건강정보들을 보실 수 있습니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="single_our_depertment">
                                            <span class="our_depertment_icon"><img src="img/icon/PinClipart.com_party-popper-clipart_3755030.png"
                                                    alt=""></span>
                                            <h4>병원 관계자</h4>
                                            <p>병원관계자 등록신청을 통해서 <br>
                                            	토닥내의 자신의 병원을 관리해보세요</p>
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
    <!-- our service part end-->

    <!--::programmer_part start::-->
    <section class="doctor_part section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8">
                    <div class="section_tittle text-center">
                        <h2> 토닥 개발자</h2>
                        <p>토닥을 만든이들</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/todac_ori.png" alt="todac" onclick="location.href='todacTeamIntroduce.do'">
                            <div class="social_icon">
                                <ul>
                                    <li><a onclick="facebookOP()"> <i class="ti-facebook"></i> </a></li>
                                    <li><a onclick="twitOP()"> <i class="ti-twitter-alt"></i> </a></li>
                                    <li><a onclick="instaOP()"> <i class="ti-instagram"></i> </a></li>
                                    <li><a onclick="skyOP()"> <i class="ti-skype"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_text">
                            <div class="single_blog_text" >
                                <h3>남석호</h3>
                                <p>specialist</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/todac_ori.png" alt="todac" onclick="location.href='todacTeamIntroduce.do'">
                            <div class="social_icon">
                                <ul>
                                    <li><a onclick="facebookOP()"> <i class="ti-facebook"></i> </a></li>
                                    <li><a onclick="twitOP()"> <i class="ti-twitter-alt"></i> </a></li>
                                    <li><a onclick="instaOP()"> <i class="ti-instagram"></i> </a></li>
                                    <li><a onclick="skyOP()"> <i class="ti-skype"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_text">
                            <div class="single_blog_text">
                                <h3>양준렬</h3>
                                <p>specialist</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/todac_ori.png" alt="todac" onclick="location.href='todacTeamIntroduce.do'">
                            <div class="social_icon">
                                <ul>
                                    <li><a onclick="facebookOP()"> <i class="ti-facebook"></i> </a></li>
                                    <li><a onclick="twitOP()"> <i class="ti-twitter-alt"></i> </a></li>
                                    <li><a onclick="instaOP()"> <i class="ti-instagram"></i> </a></li>
                                    <li><a onclick="skyOP()"> <i class="ti-skype"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_text">
                            <div class="single_blog_text">
                                <h3>이소진</h3>
                                <p>specialist</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/todac_ori.png" alt="todac" onclick="location.href='todacTeamIntroduce.do'">
                            <div class="social_icon">
                                <ul>
                                    <li><a onclick="facebookOP()"> <i class="ti-facebook"></i> </a></li>
                                    <li><a onclick="twitOP()"> <i class="ti-twitter-alt"></i> </a></li>
                                    <li><a onclick="instaOP()"> <i class="ti-instagram"></i> </a></li>
                                    <li><a onclick="skyOP()"> <i class="ti-skype"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_text">
                            <div class="single_blog_text">
                                <h3>이세영</h3>
                                <p>specialist</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::programmer_part end::-->


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>