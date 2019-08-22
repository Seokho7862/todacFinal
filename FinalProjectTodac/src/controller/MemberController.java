package controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MEMBER_USER;
import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("openMain.do")
	public String openMain() {
		return "Openmain";
	}
	
	//로그인폼
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "MemberLoginForm";
	}
	
	@RequestMapping("loginUser.do")
	public String loginUser(String muid, String pwd, HttpSession session) {
		if(service.loginUser(muid, pwd)==1) {
			//세션에 아이디 저장하기 
			session.setAttribute("muid", muid);
			return "Openmain";
		}
		else {
			return "redirect:loginForm.do";
		}
	}
	
	
	@RequestMapping("loginManager.do")
	public @ResponseBody String loginManager(HttpSession session, String muid, String pwd) {
		System.out.println(muid);
		if(service.loginManager(muid, pwd)==1) {
			//세션에 아이디 저장하기 
			session.setAttribute("muid", muid);
			return "1";
		}
		else {
			return "0";
		}
		
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm.do";
	}
	
	
	@RequestMapping("find_id_form.do")
	public String FindIdForm() {
		
		return "findIdForm";
		
	}
	@RequestMapping("find_id.do")
	public @ResponseBody String FindId(@RequestParam HashMap<String, String> param) {
		String res = "";
		if(service.getId(param).equals("0")) {
			System.out.println(service.getId(param)+"실패");
			return res;
		}
		else {
			System.out.println(service.getId(param));
			
			return res=service.getId(param);
		}
	}
	
	@RequestMapping("find_pw_form.do")
	public String FindPwForm() {
		
		return "findPwForm";
		
	}
	
	@RequestMapping("find_pw.do")
	public @ResponseBody String FindPw(@RequestParam HashMap<String, String>param) {
	
		String res = "";
		if(service.checkUser(param)==1) {
			return "성공";
		}
		else
			return res;
	}
	@RequestMapping("renew_pwd.do")
	public @ResponseBody void renewPwd(@RequestParam HashMap<String, String>param) {
		service.updatePwd(param);
		
	}
	
	
	@RequestMapping("authSms.do")
	public @ResponseBody Map<String, String> test(Model model, String phone) {
		Map<String, String> map = new HashMap<String, String>();
		int key = (int) (Math.random()*100000);
		System.out.println(key);
		map.put("result", "");
		map.put("key", String.valueOf(key));
		
		return map;
	}

//	@RequestMapping("authSms.do")
//	public @ResponseBody Map<String, Boolean> authSms(String phone) throws Exception { // 휴대폰 문자보내기
//
//			String api_key = "NCS0YGZGMGKMZMPV";
//			String api_secret = "VS3IUAYX1DCGGXOTNE77ROOQXYAB1YYW";
////			Coolsms coolsms = new Coolsms(api_key, api_secret); // 메시지보내기 객체 생성
//			Message coolsms = new Message(api_key, api_secret);
//			int key = (int)(Math.random()*100000); // 인증키 생성
////			userService.insertAuthCode(userPhoneNumber, key); // 휴대폰 인증 관련 서비스
//			/*
//			 * Parameters 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
//			 */
//			HashMap<String, String> set = new HashMap<String, String>();
//			set.put("to", phone); // 수신번호
//			set.put("from", "01020090519"); // 발신번호
//			set.put("text", "안녕하세요 토닥입니다. 인증번호는 [" + key + "] 입니다."); // 문자내용
//			set.put("type", "sms"); // 문자 타입
//
//			JSONObject result = coolsms.send(set); // 보내기&전송결과받기
//			if ((boolean) result.get("status") == true) {
//				// 메시지 보내기 성공 및 전송결과 출력
//				System.out.println("성공");
//				System.out.println(result.get("group_id")); // 그룹아이디
//				System.out.println(result.get("result_code")); // 결과코드
//				System.out.println(result.get("result_message")); // 결과 메시지
//				System.out.println(result.get("success_count")); // 메시지아이디
//				System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
//				return Collections.singletonMap("result", true);
//			} else {
//				// 메시지 보내기 실패
//				System.out.println("실패");
//				System.out.println(result.get("code")); // REST API 에러코드
//				System.out.println(result.get("message")); // 에러메시지
//				return Collections.singletonMap("result", false);
//			}
//		
//		
//	}
	
	@RequestMapping("show_mypage.do")
	public String showMypage() {
		return "myPage";
	}
	
	
	//회원수정폼 불러오기
	@RequestMapping("update_form.do")
	public ModelAndView modifyMemForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("muid")==null) {
			mav.setViewName("redirect:loginForm.do");
			return mav;
		}
		else {
		
		String muid=(String) session.getAttribute("muid");
		MEMBER_USER m =  service.findUserById(muid);
		mav.addObject("member", m);
		mav.setViewName("myFormUpdate");
		return mav;
		}
	}
	
	//회원 수정하기
	@RequestMapping("modify_member.do")
	public void ModifyMember(MEMBER_USER m) {
		System.out.println(m);
		
		service.updateMember(m);
	}
	
	//수정을 위한 비밀번호폼 
	@RequestMapping("show_pwd_form.do")
	public ModelAndView pwdForUpdate(String from) {
		ModelAndView mav = new ModelAndView();
		if(from.equals("member")) {
			mav.addObject("from", "member");
		}
		else {
			mav.addObject("from", "hos");
		}
		mav.setViewName("pwdForupdate");
		return mav;
	}
	
	//수정을 위해서 비밀번호 일치 확인
	@RequestMapping("chk_pwd.do")
	public @ResponseBody String checkForUpdate(HttpSession session, String pwd) {
		System.out.println(pwd);
		String muid = (String)session.getAttribute("muid");
		if(service.loginUser(muid, pwd)==1) {
			return "1";
		}
		else
			return "0";
	}
	//비밀번호만 수정하는 수정폼
	@RequestMapping("renew_form.do")
	public String renewForm() {
		return "RenewPwd";
	}
	
	//비밀번호 수정하기
	@RequestMapping("re_pwd.do")
	public @ResponseBody String renewPwd(HttpSession session, String pwd,String newPwd) {
		if(session.getAttribute("muid")==null) {
			return "redirect:loginForm.do";
		}
		else {
			
			String muid =(String)session.getAttribute("muid");
			HashMap<String, String> param = new HashMap<String, String>();
			if(service.loginUser(muid, pwd)==1) {
				param.put("muid", muid);
				param.put("pwd", newPwd);
				service.updatePwd(param);
				return "1";
			}
			else
				return "0";
			
		}
		
	}
	//주소api열기
	@RequestMapping("addressApi.do")
	public String addressapi() {
		return "addressApi";
	}
	//병원 업데이트 폼 띄우기
	@RequestMapping("hos_update_form.do")
	public ModelAndView hosUpdateForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("muid")==null) {
			mav.setViewName("redirect:loginForm.do");
			return mav;
		}
		else {
			String muid = (String)session.getAttribute("muid");
			System.out.println(service.selectOwnHos(muid));
			mav.addObject("hoslist", service.selectOwnHos(muid));
			mav.setViewName("hosinfoUpdate");
			return mav;
		}
	}
	
	@RequestMapping("review_list.do")
	public ModelAndView reviewList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("muid")==null) {
			mav.setViewName("redirect:loginForm.do");
		}
		else {
			if(service.selectManager((String)session.getAttribute("muid"))==1) {
				String muid =(String)session.getAttribute("muid");
				mav.addObject("reviewlist", service.selectAllreview(muid));
				mav.setViewName("reviewList");
			}
			else {
				
				mav.setViewName("redirect:loginForm.do");
			}
		}
		return mav;
	}
	@RequestMapping("like_list.do")
	public ModelAndView getlikeList(HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("muid")==null) {
			
			mav.setViewName("redirect:loginForm.do");
		}else {
			
			String muid =(String)session.getAttribute("muid");
		System.out.println(service.selectAllLike(muid));
		mav.addObject("likelist", service.selectAllLike(muid));
		mav.setViewName("likeHos");
		}
		return mav;
	}

}
