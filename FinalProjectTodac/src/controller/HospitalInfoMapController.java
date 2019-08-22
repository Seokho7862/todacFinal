package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//import com.fasterxml.jackson.databind.ObjectMapper;

import model.HospitalInfo;
import service.HospitalInfoService;
import service.ReivewService;

@Controller
public class HospitalInfoMapController {
	@Autowired
	private HospitalInfoService hsvc;
	@Autowired
	private ReivewService rsvc;

	
	@RequestMapping("HospitalInfo_Main.do")
	public ModelAndView HospitalInfo_Main() {
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("HospitalInfo_Main");
		return mav;
		
	}
	@RequestMapping("HospitalInfo_MakingMarker.do")
	public @ResponseBody List<HashMap<String,Object>> getMarker(){
		return hsvc.getMarker();
	}
	
	@RequestMapping("HospitalInfo_searchKeyword.do")
	public @ResponseBody List<HashMap<String,Object>> searchKeyword(String keyword){
		return hsvc.searchKeyword(keyword);
	}
	
	@RequestMapping("HospitalInfo_TestMain.do")
	public String HospitalInfo_TestMain() {
		return "HospitalInfo_TestMain";
	}
	
	@RequestMapping("HospitalInfo_FirstMarker.do")
	public @ResponseBody List<HashMap<String,Object>> HospitalInfo_FirstMarker(String swLat,
			String swLng, String neLat, String neLng){
		
		return hsvc.getFirstMarker(swLat, swLng, neLat, neLng);
	}
	
	
	@RequestMapping("HospitalInfo_DiagnosisByName.do")
	public @ResponseBody List<HashMap<String,Object>> HospitalInfo_DiagnosisByName(String swLat,
			String swLng, String neLat, String neLng, String keyword){
		
		List<HashMap<String,Object>> list = hsvc.HospitalInfo_DiagnosisByName(swLat, swLng, neLat, neLng, keyword);	
		return hsvc.HospitalInfo_DiagnosisByName(swLat, swLng, neLat, neLng, keyword);
	}
	
	@RequestMapping("HospitalInfo_InfoForm.do")
	public ModelAndView HospitalInfo_Review(
			@RequestParam String hpid) {
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
		mav.addObject("sessionid", "say7862");
		mav.setViewName("HospitalInfoForm");
		
		return mav;
	}
	
}
