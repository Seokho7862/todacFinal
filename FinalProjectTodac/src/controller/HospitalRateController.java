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
				@RequestParam(defaultValue="0")String[] check,
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
		
		
		List<Rate> end = new ArrayList<Rate>();
		for(int i =0;i<check.length;i++) {
			if(!check[i].equals("0")) {
				System.out.println(check[i]);
			switch (check[i]) {
			case "1":
				System.out.println("1입니다.");
				switch (subject) {
				case "1":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getInjection_rate().equals("1")) {
							end.add(newlist.get(j));
						}
					}
					
					break;
				case "2":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getAnti_rate().equals("1")) {
							end.add(newlist.get(j));
						}
					}
					break;
				case "3":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getMedi_cost_rate().equals("1")) {
							end.add(newlist.get(j));
						}
					}
					
					
					break;
				case "4":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getOp_anti_rate().equals("1")) {
							end.add(newlist.get(j));
						}
					}
					
					break;

				default:
					break;
				}
			
				break;
			case "2":
				System.out.println("2입니다.");
				switch (subject) {
				case "1":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getInjection_rate().equals("2")) {
							end.add(newlist.get(j));
							System.out.println("2-1입니다.");
						}
					}
					
					break;
				case "2":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getAnti_rate().equals("2")) {
							end.add(newlist.get(j));
							System.out.println("2-2입니다.");
						}
					}
					
					break;
				case "3":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getMedi_cost_rate().equals("2")) {
							end.add(newlist.get(j));
						}
					}
					
					break;
				case "4":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getOp_anti_rate().equals("2")) {
							end.add(newlist.get(j));
						}
					}
					
					break;

				default:
					break;
				}
				break;
			case "3":
				switch (subject) {
				case "1":
					System.out.println("3-1");
					for(int j =0; j<newlist.size();j++) {
					if(newlist.get(j).getInjection_rate().equals("3")) {
						end.add(newlist.get(j));
					}
					}
					break;
				case "2":
					System.out.println("3-2");
					for(int j =0; j<newlist.size();j++) {
					if(newlist.get(j).getAnti_rate().equals("3")) {
						end.add(newlist.get(j));
					}
					}
					break;
				case "3":
					for(int j =0; j<newlist.size();j++) {
					if(newlist.get(j).getMedi_cost_rate().equals("3")) {
						end.add(newlist.get(j));
					}
					}
				case "4":
					for(int j =0; j<newlist.size();j++) {
					if(newlist.get(j).getOp_anti_rate().equals("3")) {
						end.add(newlist.get(j));
					}
					}
					
					break;

				default:
					break;
				}
				break;
			case "4":
				switch (subject) {
				case "1":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getInjection_rate().equals("4")) {
							end.add(newlist.get(j));
						}
					}
					
					break;
				case "2":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getAnti_rate().equals("4")) {
							end.add(newlist.get(j));
						}
					}
					
					break;
				case "3":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getMedi_cost_rate().equals("4")) {
							end.add(newlist.get(j));
						}
					}
					
					break;
				case "4":
					for(int j =0; j<newlist.size();j++) {
						if(newlist.get(j).getOp_anti_rate().equals("4")) {
							end.add(newlist.get(j));
						}
					}
					
					break;

				default:
					break;
				}
				
				break;

			default:
				break;
			}
			System.out.println(end);
				param.put("newlist", end);
			
			}
			else
				param.put("newlist", newlist);
		}
		
		param.put("key", subject);
		return param;
		
	}
	//주소 얻어오기
	@RequestMapping("getaddress.do")
	public @ResponseBody HashSet<List<String>> test(@RequestParam(required=false) String code1) {
		HashSet<List<String>>set = new YkihoGet1().getadrress(code1);
		
		for(List<String> s : set) {
			System.out.println(s +": 결과출력");
		}
		
	return set;
	}
		
}
