package controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import service.TestService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;;

@Controller
public class TestController {
	@Autowired
	private TestService tservice;
	
	@RequestMapping("Map.do")
	public String Map() {
		return "kakaomap";
	}
	
	@RequestMapping("insertDB.do")
	public String insertDb(int page) {
		System.out.println(page);
		tservice.insertHospitalInfo(page);
		return "kakaomap";
	}
	
	
}
