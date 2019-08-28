<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function facebookOP(){
	window.open('https://www.facebook.com');
}
function instaOP(){
	window.open('https://www.instagram.com');
}
function twitOP(){
	window.open('https://twitter.com');
}
function skyOP(){
	window.open('https://skype.daesung.com/main.asp');
}
function hos1(){
	window.open('http://www.snuh.org/intro.do');
}
function hos2(){
	window.open('http://sev.iseverance.com/');
}
function hos3(){
	window.open('https://www.cmcseoul.or.kr/');
}
function hos4(){
	window.open('http://www.amc.seoul.kr/');
}
function hos5(){
	window.open('http://www.samsunghospital.com/');
}


</script>
</head>
<body>


   <!-- footer part start-->
    <footer class="footer-area">
        <div class="footer section_padding">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-xl-2 col-md-4 col-sm-6 single-footer-widget">
                        <a href="service_info.do" class="footer_logo"> <img src="img/todac_ori.png" alt="#"> </a>
                        <p>토닥과 함께 아프지말자</p>
                        <div class="social_logo">
                            <a onclick="facebookOP()"><i class="ti-facebook"></i></a>
                            <a onclick="twitOP()"> <i class="ti-twitter"></i> </a>
                            <a onclick="instaOP()"><i class="ti-instagram"></i></a>
                            <a onclick="skyOP()"><i class="ti-skype"></i></a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-sm-6 col-md-4 single-footer-widget">
                        <h4>QUICK LINKS</h4>
                        <ul>
                            <li><a href="service_info.do">TODAC MAIN</a></li>
                            <li><a href="todacIntroForm.do">SERVICE INTRO</a></li>
                            <li><a href="HospitalInfo_TestMain.do">SEARCH</a></li>
                            <li><a href="rateinfoform.do">HOSPITAL RATE</a></li>
                            <li><a href="diseaseSearchForm.do">DISEASE</a></li>
                            <li><a href="healthInfoList.do">HEALTH INFO</a></li>
                            <li><a href="managerApplyForm.do">MANAGER APPLY</a></li>
                        </ul>
                    </div>
                    <div class="col-xl-2 col-sm-6 col-md-4 single-footer-widget">
                        <h4>MAIN HOSPITAL</h4>
                        <ul>
                            <li><a onclick="hos1()">SEOUL NATIONAL UNIVERSITY HOSPITAL</a></li>
                            <li><a onclick="hos2()">SEVERANCE HOSPITAL</a></li>
                            <li><a onclick="hos3()">SEOUL ST. MARY’S HOSPITAL</a></li>
                            <li><a onclick="hos4()">ASAN MEDICAL CENTER</a></li>
                            <li><a onclick="hos5()">SAMSUNG MEDICAL CENTER</a></li>
                        </ul>
                    </div>
                    <div class="col-xl-2 col-sm-6 col-md-6 single-footer-widget">
                        <h4>TODAC_TEAM</h4>
                        <ul>
                            <li><a href="todacTeamIntroduce.do">NAM SEOK HO</a></li>
                            <li><a href="todacTeamIntroduce.do">YANG JUN LYUL</a></li>
                            <li><a href="todacTeamIntroduce.do">LEE SO JIN</a></li>
                            <li><a href="todacTeamIntroduce.do">LEE SE YOUNG</a></li>
                        </ul>
                    </div>
                   
                </div>
            </div>
        </div>

        <div class="copyright_part">
            <div class="container">
                <div class="row align-items-center">
                    <p class="footer-text m-0 col-lg-8 col-md-12"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Todac_Team</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</p>
                    <div class="col-lg-4 col-md-12 text-center text-lg-right footer-social">
                        <a onclick="facebookOP()"><i class="ti-facebook"></i></a>
                        <a onclick="twitkOP()"> <i class="ti-twitter"></i> </a>
                        <a onclick="instaOP()"><i class="ti-instagram"></i></a>
                        <a onclick="skyOP()"><i class="ti-skype"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- footer part end-->



</body>
</html>