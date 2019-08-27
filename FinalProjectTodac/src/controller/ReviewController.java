package controller;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.Favorites;
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
								String hpid,String title,String content,int grade,HttpSession session) {
		
		Review r = new Review();
		String muid = String.valueOf(session.getAttribute("muid"));
		r.setHpid(hpid);r.setTitle(title);
		r.setContent(content);r.setGrade(grade);
		r.setMuid(muid);
		
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
		
		if(muid != null) {
			Favorites f = rsvc.findLidByFavoritesModel(hpid,muid);
			if(f==null) { //라이크가 없을때 1
				mav.addObject("f_img",0);
			}
			else { //라이크가 잇을대 1
				mav.addObject("f_img",1);
			}
		}
		System.out.println(h);
		mav.addObject("avgRate",String.format("%.2f",rsvc.averageRate(hpid)));
		mav.addObject("dlist", str);
		mav.addObject("hlist",h);
		mav.addObject("rlist",rsvc.selectOneHospitalInfo(h.getHpid()));
		mav.setViewName("HospitalInfoForm");
		
		return mav;
	}
	
	@RequestMapping("ReportInsert.do")
	public @ResponseBody void ReportInsert(String rid, String reportreason,HttpSession session){
		String sessionId = String.valueOf(session.getAttribute("muid"));
		System.out.println(sessionId);
		
		rsvc.ReportInsert(sessionId,rid,reportreason);
	}
	
	@RequestMapping("ClickFavorite.do")
	public @ResponseBody void ClickFavorite(String muid, String hpid,String status) {
		Favorites f = new Favorites();
		//status 좋아요하지 않았을때 0넘어오면 아니면 1넘어오면
		f.setMuid(muid); f.setHpid(hpid);
		System.out.println("컨트롤러 단"+f);
		rsvc.ClickFavorite(f,status);
	}
	
	
}
