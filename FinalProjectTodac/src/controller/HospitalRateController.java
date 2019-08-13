package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HospitalRateController {
	
	
	@RequestMapping("rateinfoform.do")
	public String rateInfoForm() {
		return "hosRate";
	}
	
	@RequestMapping("rateinfo.do")
	public void getYkiho(@RequestParam(required=false) String code1, 
				@RequestParam(required=false)String code2,
				@RequestParam(required=false)String hname,
				@RequestParam(required=false)String check,
				@RequestParam(required=false)String subject) {
		
		List<String> ykiList = new YkihoGet1().getYkiho(code1, code2, hname);
		for(String y: ykiList) {
    		System.out.println(y+" controller");
    	}
		
		
		
		
		
		
		
	}
		
}
