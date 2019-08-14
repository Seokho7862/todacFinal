package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import service.HospitalInfoService;

@Controller
public class HospitalInfoMapController {
	@Autowired
	private HospitalInfoService hsvc;
	
	@RequestMapping("HospitalInfo_Main.do")
	public ModelAndView HospitalInfo_Main() {
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("HospitalInfo_Main");
		return mav;
		
	}
	@RequestMapping("HospitalInfo_MakingMarker.do")
	public @ResponseBody List<HashMap<String,Object>> getMarker(){
		//System.out.println(hsvc.getMarker());
		return hsvc.getMarker();
	}
	
	@RequestMapping("HospitalInfo_searchKeyword.do")
	public @ResponseBody List<HashMap<String,Object>> searchKeyword(String keyword){
		System.out.println(keyword);
		System.out.println("컨트롤러 단 : "+ hsvc.searchKeyword(keyword));
		return hsvc.searchKeyword(keyword);
	}
	
	@RequestMapping("HospitalInfo_TestMain.do")
	public String HospitalInfo_TestMain() {
		return "HospitalInfo_TestMain";
	}
	
	@RequestMapping("HospitalInfo_FirstMarker.do")
	public @ResponseBody List<HashMap<String,Object>> HospitalInfo_FirstMarker(String swLat,
			String swLng, String neLat, String neLng){
		
		System.out.println(hsvc.getFirstMarker(swLat, swLng, neLat, neLng));
		return hsvc.getFirstMarker(swLat, swLng, neLat, neLng);
	}
	
	@RequestMapping("HospitalInfo_InfoForm.do")
	public ModelAndView HospitalInfo_Review(
			@RequestParam String hpid) {
		ModelAndView mav = new ModelAndView();
		System.out.println("-----infoForm.do 내-----------");
		System.out.println(hpid);
		System.out.println(hsvc.HospitalInfo_InfoForm(hpid));
		System.out.println("------------------------------");
		mav.addObject("hlist",hsvc.HospitalInfo_InfoForm(hpid));
		mav.setViewName("HospitalInfoForm");
		return mav;
	}
	
	@RequestMapping("HospitalInfo_DiagnosisByName.do")
	public @ResponseBody List<HashMap<String,Object>> HospitalInfo_DiagnosisByName(String swLat,
			String swLng, String neLat, String neLng, String keyword){
		
		List<HashMap<String,Object>> list = hsvc.HospitalInfo_DiagnosisByName(swLat, swLng, neLat, neLng, keyword);
		
		return hsvc.HospitalInfo_DiagnosisByName(swLat, swLng, neLat, neLng, keyword);
	}
}
