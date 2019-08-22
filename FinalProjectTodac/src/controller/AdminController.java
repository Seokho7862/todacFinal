package controller;

import java.io.File;
import java.util.HashMap;
import java.util.function.IntPredicate;

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

	@RequestMapping("apply_list.do")
	public ModelAndView hosApplyList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(service.checkAdmin((String)session.getAttribute("muid"))==null) {
			
			mav.setViewName("redirect:loginForm.do");
		}else {
			
		System.out.println(service.selectAllapply());
		mav.addObject("applylist", service.selectAllapply());
		mav.setViewName("applylist2");
		}
		return mav;
	}
	
	@RequestMapping("download.do")
	public View download(int aid) {
	
	
		File attachFile = service.getFile(aid);
		View view = new DownloadView(attachFile);
		return view;
	}
	
	@RequestMapping("accept_manager.do")
	public @ResponseBody String acceptManager(HttpSession session ,@RequestParam(required=true) String muid,
											@RequestParam(required=true)String hpid,
											@RequestParam(required=true)String said) {
		System.out.println(said);
		int aid = Integer.parseInt(said);
		System.out.println(hpid);
		System.out.println(muid);
		if(session.getAttribute("muid")==null) {
			return "0";
		}else {
			
			service.updateAccept(muid, hpid);
			return "1";
		}
	}	
	
	@RequestMapping("admin_login_form.do")
	public String adminLoginForm(HttpSession session) {
		session.invalidate();
		return "adminLoginForm";
	}
	
	@RequestMapping("admin_login.do")
	public @ResponseBody String adminLogin(HttpSession session ,@RequestParam HashMap<String, Object> param) {
		System.out.println(param);
		if(service.adminLogin(param)==1) {
			session.setAttribute("muid", (String)param.get("maid"));
			return "1";
		}
		else {
			
			return "0";
		}
		
		
	}
	
	
}
