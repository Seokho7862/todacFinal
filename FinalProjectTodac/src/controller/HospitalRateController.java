package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Rate;

@Controller
public class HospitalRateController {
	
	
	@RequestMapping("rateinfoform.do")
	public String rateInfoForm() {
		return "hosRate";
	}
	
	@RequestMapping("rateinfo.do")
	public @ResponseBody List<Rate> getYkiho(@RequestParam(required=false) String code1, 
				@RequestParam(required=false)String code2,
				@RequestParam(required=false)String hname,
				@RequestParam(required=false)String[] check,
				@RequestParam(required=false)String subject) {
		
		System.out.println(code1 +","+code2+", check:"+check+","+subject+","+hname);
		
		List<String> ykiList = new YkihoGet1().getYkiho(code1, code2, hname);
//		for(String y: ykiList) {
//    		System.out.println(y+" controller");
//    	}
		List<Rate> rlist = new rate_test1().showRate(ykiList);
		List<Rate> newlist = new ArrayList<Rate>();
		for(int i =0; i<rlist.size();i++) {
//			System.out.println(r+" : test");
			if(rlist.get(i)!=null) {
				newlist.add(rlist.get(i));
			}
		}
		
//		List<Rate> end = new ArrayList<Rate>();
//		for(int i =0;i<newlist.size();i++) {
//			if(newlist.get(i).getAnti_rate().equals("1")) {
//				end.add(newlist.get(i));
//			}
//		}
		
		return newlist;
		
		
		
		
		
	}
		
}
