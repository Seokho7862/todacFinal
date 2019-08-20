package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.ApplyService;

@Controller
public class AdminController {
	
	@Autowired
	private ApplyService service;

	@RequestMapping("apply_list.do")
	public ModelAndView hosApplyList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("applylist", service.selectAllapply());
		mav.setViewName("applylist2");
		return mav;
	}
	
	
	
}
