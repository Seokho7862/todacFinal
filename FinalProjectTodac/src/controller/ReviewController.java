package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.HospitalInfo;
import model.Review;
import service.HospitalInfoService;
import service.ReivewService;

@Controller
public class ReviewController {
	@Autowired
	private ReivewService rsvc;
	@Autowired
	private HospitalInfoService hsvc;
	
	@RequestMapping("HospitalInfo_ReviewBoard.do")
	public ModelAndView HospitalInfo_ReviewBoard(String rid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("review", rsvc.selectOneReviewBoard(rid));
		mav.addObject("prev",rsvc.selectAroundReview(rid, "prev"));
		mav.addObject("next",rsvc.selectAroundReview(rid, "next"));
		mav.setViewName("ReviewBoard");
		return mav;
	}
	@RequestMapping("HospitalInfo_ReviewWriteForm.do")
	public ModelAndView HospitalInfo_ReviewWriteForm(String hpid) {
		ModelAndView mav = new ModelAndView();
		System.out.println(hpid);
		
		mav.addObject("h", hsvc.SelectOneHospital(hpid));
		mav.setViewName("ReviewWriteForm");
		return mav;
	}
	@RequestMapping("reviewWrite.do")
	public ModelAndView writeReview(@RequestParam("rfile") MultipartFile file,
								String hpid,String title,String content,int grade) {
		
		Review r = new Review();
		r.setHpid(hpid);r.setTitle(title);
		r.setContent(content);r.setGrade(grade);
		
		rsvc.reviewWrite(r, file);
		
		ModelAndView mav = new ModelAndView();
		HospitalInfo h = hsvc.HospitalInfo_InfoForm(hpid);
		String[] str;
		if(h.getDgidldName() != null) {
			str =  h.getDgidldName().split("/");
		}
		else {
			str =  null;
		}
		
		mav.addObject("dlist", str);
		mav.addObject("hlist",h);
		mav.addObject("rlist",rsvc.selectOneHospitalInfo(h.getHpid()));
		mav.setViewName("HospitalInfoForm");
		
		return mav;
	}
}
