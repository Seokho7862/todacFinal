package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("apply_list.do")
	public String hosApplyList() {
		return "applylist2";
	}
}
