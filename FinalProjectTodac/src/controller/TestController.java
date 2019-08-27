package controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import model.HealthInfo;
import model.HospitalInfo;
import model.MEMBER_USER;
import model.apply_manager;
import model.disease_web;
import model.notice;
import model.search;
import oracle.net.aso.s;
import service.HealthInfoFileUploadClass;
import service.ManagerApplyFileUploadClass;
import service.MemberService;
import service.NaverSearchAPI;
import service.TestService;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.swing.plaf.multi.MultiFileChooserUI;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;;

@Controller
public class TestController {
	@Autowired
	private TestService tservice;
	@Autowired
	private MemberService ms;

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

	// 여기부터 맨 밑까지 작업함. 합칠 때 임포트 한 것들도 합쳐주세요.

	@RequestMapping("TestStartForm.do")
	public void TestStartForm() {
	}

	@RequestMapping("healthInfoList.do")
	public ModelAndView healthInfoList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int searchType,
			@RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> pageinfo = new HashMap<String, Object>();
		pageinfo.put("page", page);
		ArrayList<HealthInfo> hi = new ArrayList<HealthInfo>();
		int num = 0;

		if (keyword == null || keyword.equals("")) {
			hi = (tservice.selectHealthInfoList(pageinfo));
			num = tservice.getNumberOfHealthInfo2(pageinfo);
			pageinfo.put("num", num);

		}

		else if (keyword != null && !keyword.equals("")) {
			pageinfo.put("searchType", searchType);
			pageinfo.put("keyword", keyword);
			hi = tservice.searchHealthInfoList(pageinfo);
			num = tservice.getNumberOfHealthInfo(pageinfo);
			pageinfo.put("num", num);
		}
		int endPage = 0;

		int startPage = (((page - 1) / 10) * 10) + 1;
		int lastPage = ((num - 1) / 10) + 1;
		if (lastPage >= startPage + 9) {
			endPage = startPage + 9;
		} else {
			endPage = lastPage;
		}
		pageinfo.put("startPage", startPage);
		pageinfo.put("lastPage", lastPage);
		pageinfo.put("endPage", endPage);
		mav.setViewName("healthInfoListForm");
		mav.addObject("top3", tservice.getListOfTop3(1));
		mav.addObject("healThInfoList", hi);
		mav.addObject("pageinfo", pageinfo);

		return mav;
	}

	public ModelAndView healthInfoRead(int iid) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Integer> iidVal = new HashMap<String, Integer>();
		iidVal.put("iid", iid);

		return mav;
	}

	@RequestMapping("healthInfoWriteForm.do")
	public ModelAndView healthInfoWriteForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int status = 0;
		String muid = null;
		if (session.getAttribute("status") == null) {
			status = 0;
		} else if (session.getAttribute("status") != null) {
			muid = (String) session.getAttribute("muid");
			status = (int) session.getAttribute("status");
		}
		if (status == 2) {
			mav.addObject("writer", ms.selectOwnHos(muid).get("DUTYNAME"));
			mav.setViewName("healthInfoWriteForm");
		} else {
			mav.setViewName("healthInfoDenyForm");
		}

		return mav;
	}

	public String getCurrentDayTime() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
		return dayTime.format(new Date(time));
	}

	@RequestMapping("healthInfoWrite.do")
	public String healthInfoWrite(HealthInfo healthInfo,
			@RequestParam(value = "infoFile", required = false) MultipartFile file) {

		if (file.getSize() > 0) {
			ArrayList<String> result = HealthInfoFileUploadClass.FileUpload(file);
			healthInfo.sethfile(result.get(0));
		}
		System.out.println(healthInfo.toString());
		tservice.healthInfoWrite(healthInfo);
		return "redirect: healthInfoList.do";
	}

	@RequestMapping("healthInfoReadForm.do")
	public ModelAndView healthInfoReadForm(int iid, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int searchType,
			@RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		HashMap<String, Object> iid2 = new HashMap<String, Object>();
		iid2.put("iid", iid);
		HealthInfo hi = tservice.selecthealthInfo(iid2);
		pageInfo.put("page", page);
		pageInfo.put("searchType", searchType);
		pageInfo.put("keyword", keyword);

		mav.addObject("healthInfo", hi);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName("healthInfoReadForm");

		return mav;
	}

	@RequestMapping("deleteHealthInfo.do")
	public ModelAndView deleteHealthInfo(int iid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int status = 0;
		String muid = null;
		muid = (String) session.getAttribute("muid");
		HashMap<String, Object> iid2 = new HashMap<String, Object>();
		iid2.put("iid", iid);
		HealthInfo hi = tservice.selecthealthInfo(iid2);

		if (session.getAttribute("status") == null) {
			status = 0;
		} else if (session.getAttribute("status") != null) {
			status = (int) session.getAttribute("status");
		}
		if ((status == 2 && muid.equals(hi.getMuid())) || status == 7) {
			tservice.deleteHealthInfo(iid2);
			mav.setViewName("healthInfo");
		} else {
			mav.setViewName("healthInfoDenyForm");
		}
		return mav;
	}

	@RequestMapping("updateHealthInfo.do")
	public ModelAndView updateHealthInfo(HealthInfo healthInfo, int iid, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int searchType,
			@RequestParam(required = false) String keyword) {

		tservice.updateHealthInfo(healthInfo);
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		HashMap<String, Object> iid2 = new HashMap<String, Object>();
		iid2.put("iid", iid);
		HealthInfo hi = tservice.selecthealthInfo(iid2);
		pageInfo.put("page", page);
		pageInfo.put("searchType", searchType);
		pageInfo.put("keyword", keyword);

		mav.addObject("healthInfo", hi);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName("healthInfoReadForm");

		return mav;
	}

	@RequestMapping("updateHealthInfoForm.do")
	public ModelAndView updateHealthInfoForm(int iid, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int searchType,
			@RequestParam(required = false) String keyword, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		int status = 0;
		String muid = null;
		muid = (String) session.getAttribute("muid");

		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		pageInfo.put("searchType", searchType);
		pageInfo.put("keyword", keyword);

		HashMap<String, Object> iid2 = new HashMap<String, Object>();
		iid2.put("iid", iid);
		HealthInfo hi = tservice.selecthealthInfo(iid2);

		if (session.getAttribute("status") == null) {
			status = 0;
		} else if (session.getAttribute("status") != null) {
			status = (int) session.getAttribute("status");
		}
		if ((status == 2 && muid.equals(hi.getMuid())) || status == 7) {
			mav.setViewName("healthInfoUpdateForm");
			mav.addObject("healthInfo", hi);
			mav.addObject("pageInfo", pageInfo);
		} else {
			mav.setViewName("healthInfoDenyForm");
		}

		return mav;
	}

	// 여기까진 건강정보 게시판
	@RequestMapping("diseaseSearchForm.do")
	public void diseaseSearchForm() {
	}

	@RequestMapping("diseaseSearch.do")
	public @ResponseBody HashMap<String, Object> diseaseSearch(String keyword, HttpSession session) {
		System.out.println("확인 작업:"+keyword);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, String> dis = new HashMap<String, String>();
		dis.put("disease", keyword);
		result.put("data", NaverSearchAPI.diseaseSearch(keyword));
		result.put("subjects", tservice.getSubjectList(dis));
		search s = new search(keyword);
		String id = (String) session.getAttribute("muid");
		if (id != null) {
			System.out.println(id);
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("muid", id);
			s.setAge(ms.findUserById(id).getAge());
		}
		if(!keyword.isEmpty()) {
		tservice.Search(s);
		}
		return result;
	}

	@RequestMapping("signUpForm.do")
	public void signUpForm() {
	}

	@RequestMapping("signUp.do")
	public String signUp(String muid, String pwd, String name, String birth, String email, String phone, String latitude,
			String longitude, String sample4_postcode, String sample4_detailAddress,
			@RequestParam(defaultValue = "") String sample4_jibunAddress, String sample4_roadAddress) {

		int age = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date birthDay = format.parse(birth);
			Date today = format.parse(format.format(System.currentTimeMillis()));
			System.out.println(birthDay);
			System.out.println(today);
			age = (int) ((((-birthDay.getTime() + today.getTime()) / (24 * 60 * 60 * 1000)) / 365));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		StringTokenizer tk = new StringTokenizer(sample4_jibunAddress, " ");
		String add_base = "";

		add_base = add_base + tk.nextToken() + " ";
		add_base = add_base + tk.nextToken();
		int realAge=0;
		realAge=age/10;
		java.sql.Date birthd = java.sql.Date.valueOf(birth);

		MEMBER_USER member = new MEMBER_USER(muid, pwd, name, birthd, realAge, email, phone, Double.parseDouble(latitude),
				Double.parseDouble(longitude), sample4_postcode, sample4_jibunAddress, add_base, sample4_roadAddress);

		System.out.println(member);
		tservice.createMember_user(member);
		System.out.println("회원 삽입");
		
		return "redirect: service_info.do";
	}

	@RequestMapping("idCheck.do")
	public @ResponseBody int idCheck(String muid) {
		int result = 0;
		System.out.println(muid);
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("muid", muid);
		result = tservice.idCheck(param);

		return result;
	}

	@RequestMapping("getListOfTop3.do")
	public @ResponseBody ArrayList<HealthInfo> getListOfTop3(int getType) {

		return tservice.getListOfTop3(getType);
	}

	@RequestMapping("managerApplyForm.do")
	public void managerApplyForm() {
	}

	@RequestMapping("hospitalSearch.do")
	public @ResponseBody ArrayList<HospitalInfo> hospitalSearch(String keyword, String searchType) {

		return tservice.hospitalSearch(keyword, searchType);

	}

	@RequestMapping("managerApply.do")
	public void managerApply(apply_manager apply, MultipartFile file) {

		if (!file.isEmpty()) {
			ArrayList<String> fileResult = ManagerApplyFileUploadClass.FileUpload(file);
			String absLoc = fileResult.get(1);
			String relLoc = fileResult.get(0);
			apply.setAbsFile(absLoc);
			apply.setRelFile(relLoc);
		}
		tservice.ApplyManager(apply);
	}

	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm(HttpSession session) {
		int status = 0;
		if (session.getAttribute("status") == null) {
			status = 0;
		} else if (session.getAttribute("status") != null) {
			status = (int) session.getAttribute("status");
		}
		if (status == 7) {
			return "redirect: jsp/noticeWritForm.jsp";
		} else {
			return "redirect: jsp/healthInfoDenyForm.jsp";
		}

	}

	@RequestMapping("noticeWirte.do")
	public String noticeWrite(notice notice) {
		tservice.noticeWrite(notice);
		return "redirect: noticeListForm.do";
	}

	@RequestMapping("noticeListForm.do")
	public ModelAndView noticeListForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList", tservice.getNoticeList());
		mav.setViewName("noticeListForm");

		return mav;
	}

	@RequestMapping("noticeReadForm.do")
	public ModelAndView noticeReadForm(int nid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", tservice.getNotice(nid));
		mav.setViewName("noticeReadForm");
		return mav;
	}

	@RequestMapping("noticeModifyForm.do")
	public ModelAndView noticeModifyForm(int nid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int status = 0;
		if (session.getAttribute("status") == null) {
			status = 0;
		} else if (session.getAttribute("status") != null) {
			status = (int) session.getAttribute("status");
		}
		if (status == 7) {
			mav.addObject("notice", tservice.getNotice(nid));
			mav.setViewName("noticeModifyForm");
		} else {
			mav.setViewName("healthInfoDenyForm");
		}
		return mav;
	}

	@RequestMapping("noticeModify.do")
	public String noticeModify(notice notice) {
		tservice.noticeModify(notice);
		return "redirect: noticeReadForm.do?nid=" + notice.getNid();
	}

	@RequestMapping("noticeDelete.do")
	public String noticeDelete(int nid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int status = 0;
		if (session.getAttribute("status") == null) {
			status = 0;
		} else if (session.getAttribute("status") != null) {
			status = (int) session.getAttribute("status");
		}
		if (status == 7) {
			tservice.noticeDelete(nid);
			return "redirect: noticeListForm.do";
		} else {
			return "redirect: jsp/healthInfoDenyForm.jsp";
		}
	}
	
	@RequestMapping("get10Disease.do")
	public @ResponseBody ArrayList<search> getListOfSearch(HttpSession session) {
		String id = (String) session.getAttribute("muid");
		ArrayList<search> sList = new ArrayList<search>();
		int age = 0;
		System.out.println(id);

		if (id != null) {
			MEMBER_USER m = ms.findUserById(id);
			if (m != null) {
				System.out.println(m);
				age = m.getAge();
			}
		}
		sList = tservice.getListOfSearch(age);

		return sList;
	}

	@RequestMapping("getSessionId.do")
	public @ResponseBody String getSessionId(HttpSession session) {
		String id = "";
		id = (String) session.getAttribute("muid");
		return id;
	}
	@RequestMapping("getSessionStatus.do")
	public @ResponseBody int getSessionStatus(HttpSession session) {
		int status=0;
		if(session.getAttribute("status")!=null) {
		status = (int) session.getAttribute("status");}
		return status;
	}


	@RequestMapping("todacMainForm.do")
	public void todacMain() {
	}

	@RequestMapping("todacIntroForm.do")
	public void todacIntroForm() {
	}

	@RequestMapping("noticeForDoctors.do")
	public void noticeForDoctors() {
	}

	@RequestMapping("todacTeamIntroduce.do")
	public void todacTeamIntroduce() {
	}

}
