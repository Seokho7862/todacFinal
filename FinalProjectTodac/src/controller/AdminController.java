package controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	//관리자 메인페이지
	@RequestMapping("admin_main.do")
	public String adminMain() {
		return "forAdmin";
	}

	//관계자 신청 목록 리스트
	@RequestMapping("apply_list.do")
	public ModelAndView hosApplyList() {
		ModelAndView mav = new ModelAndView();
		System.out.println(service.selectAllapply());
		mav.addObject("applylist", service.selectAllapply());
		mav.setViewName("applylist2");
		return mav;
	}
	
	@RequestMapping("download.do")
	public View download(int aid) {
	
	
		File attachFile = service.getFile(aid);
		View view = new DownloadView(attachFile);
		return view;
	}
	
	//관계자 승인하기
	@RequestMapping("accept_manager.do")
	public @ResponseBody String acceptManager(HttpSession session ,@RequestParam(required=true) String muid,
											@RequestParam(required=true)String hpid,
											@RequestParam(required=true)String haid) {
		System.out.println(hpid);
		int aid = Integer.parseInt(haid);
		System.out.println(muid);
		if(session.getAttribute("muid")==null) {
			return "0";
		}else {
			
			service.updateAccept(muid, hpid);
			service.denyApply(aid);
			
			return "1";
		}
	}	
	
	//관계자 승인 거절하기
	@RequestMapping("deny_apply.do")
	public @ResponseBody String denyApply(String haid) {
		int aid = Integer.parseInt(haid);
		int res =service.denyApply(aid);
		if(res==1) {
			return "1";
		}
		else 
			return "0";
	}
	
	
	//관리자 로그인 폼 열기
	@RequestMapping("admin_login_form.do")
	public String adminLoginForm() {
		return "adminLoginForm";
	}
	
	//관리자 로그인하기
	@RequestMapping("admin_login.do")
	public @ResponseBody String adminLogin(@RequestParam HashMap<String, Object> param,HttpSession session) {
		System.out.println(param);
		if(service.adminLogin(param)==1) {
			
			session.setAttribute("muid", param.get("maid"));
			session.setAttribute("status", 7);
			
			return "1";
		}
		else {
			
			return "0";
		}
		
		
	}
	//신고리스트 불러오기
	@RequestMapping("report_list.do")
	public ModelAndView reportList() {
		ModelAndView mav = new ModelAndView();
		System.out.println(service.selectAllReport());
		mav.addObject("reportlist", service.selectAllReport());
		mav.setViewName("reportlist");
		return mav;
	}
	
	//신고확정하기
	@RequestMapping("confirm_report.do")
	public @ResponseBody int updateReport(String muid) {
		System.out.println(service.updateReport(muid));
		
		if(service.updateReport(muid)==1) {
			return 1;
		}
		else {
			
			return 0;
		}
		
	}
	
	//신고삭제하기
	@RequestMapping("delete_report.do")
	public @ResponseBody int deleteReport(int reportid) {
		if(service.deleteReport(reportid)==1) {
			System.out.println(reportid);
			return 1;
		}
		else
			return 0;
	}
	
	//5회이상 신고받은 사용자
	@RequestMapping("over_report_list.do")
	public ModelAndView selectOverReport() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("overlist", service.selectOverReport());
		mav.setViewName("confirmReport");
		return mav;
	}
	
	//사용자 탈퇴하기
	@RequestMapping("delete_user.do")
	public @ResponseBody int deleteUser(String muid) {
		if(service.deleteUser(muid)==1) {
			return 1;
		}
		else {
			return 0;
			
		}
	}
	
	
}
