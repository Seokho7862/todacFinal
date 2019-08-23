package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public @ResponseBody HashMap<String, Object> getYkiho(@RequestParam(defaultValue="1")String page ,@RequestParam(required=false) String code1, 
				@RequestParam(required=false)String code2,
				@RequestParam(required=false)String hname,
				@RequestParam(required=false)String[] check,
				@RequestParam(required=false)String subject) {
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		System.out.println(code1 +","+code2+", check:"+check+","+subject+","+hname);
		
		List<String> ykiList = new YkihoGet1().getYkiho(code1, code2, hname, page);
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
		//페이지
//		HashMap<String, Object> pageinfo = new HashMap<String, Object>();
//		int offset = (page-1)*10+1;
//		int num =newlist.size();
		
//		List<Rate> nlist = new ArrayList<Rate>();
//		for(int j=offset;j<=(offset+10)-1;j++) {
//			nlist.add(newlist.get(j));
//		}
//		pageinfo.put("current",page);
//		pageinfo.put("newlist",newlist);
//		pageinfo.put("key", subject);
//		pageinfo.put("start", page-((page-1)%10));
//		pageinfo.put("end", page-((page-1)%10)+(10-1));
//		pageinfo.put("total", num);
//		pageinfo.put("last", (num-1)/10+1);
//		
//		List<Rate> end = new ArrayList<Rate>();
//		for(int i =0;i<newlist.size();i++) {
//			if(newlist.get(i).getInjection_rate().equals("1")) {
//				end.add(newlist.get(i));
//			}
//		}
		
//		System.out.println(subject);
//		switch (subject) {
//		case "1":
//			subject="1";
//			break;
//		case "2":
//			subject="2";
//			break;
//		case "3":
//			subject="3";
//			break;
//		case "4":
//			subject="4";
//			break;
//
//		default:
//			break;
//		}
		param.put("key", subject);
		param.put("newlist", newlist);
		System.out.println(page);
		return param;
		
	}
	@RequestMapping("getaddress.do")
	public @ResponseBody HashSet<List<String>> test(@RequestParam(required=false) String code1) {
		HashSet<List<String>>set = new YkihoGet1().getadrress(code1);
		
		for(List<String> s : set) {
			System.out.println(s +": 결과출력");
		}
		
	return set;
	}
		
}
