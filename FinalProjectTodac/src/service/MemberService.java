package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IMemberDao;
import model.Favorites;
import model.MEMBER_USER;
import model.reviewTest;

@Service
public class MemberService {
	
	@Autowired
	private IMemberDao dao;
	
	public int loginUser(String muid, String pwd) {
		
		MEMBER_USER m = dao.selectUserById(muid);
		System.out.println(m);
		if(m!=null) {
			if(m.getPwd().equals(pwd)) {
				
				return 1;
			}
			else {
				return 0;
			}
		}
		else {
			return 0;
		}
		
	}
	//관계자 로그인 하기
	public int loginManager(String muid, String pwd) {
		MEMBER_USER m = dao.selectManagerById(muid);
		System.out.println(m+"�꽌鍮꾩뒪");
		if(m!=null) {
			if(m.getPwd().equals(pwd)) {
				return 1;
			}
			else
				return 0;
		}
		return 0;
	}
	
	
	public String getId(HashMap<String, String>param) {
		MEMBER_USER m = dao.selectUserByNamePhone(param);
		if(m!=null) {
			return m.getMuid();
		}
		else 
			return "0";
	}
	
	public int checkUser(HashMap<String, String>param) {
		MEMBER_USER m = dao.selectUserById(param.get("muid"));
		if(m!=null) {
			if(m.getName().equals(param.get("name"))&&m.getPhone().equals(param.get("phone"))) {
				return 1;
			}
			else
				return 0;
		}
		else
			return 0;
	}
	public int selectManager(String muid) {
		MEMBER_USER m =dao.selectManagerById(muid);
		if(m!=null) {
			return 1;
		}
		else
		return 0;
	}
	
	public void updatePwd(HashMap<String, String>param) {
		
		dao.updatePwd(param);
	}
	
	public MEMBER_USER findUserById(String muid) {
		MEMBER_USER m = dao.selectUserById(muid);
		return m;
	}
	
	//�쉶�썝 �닔�젙�븯湲�
	public int updateMember(MEMBER_USER m) {
		
		int i = dao.updateMember(m);
		System.out.println(i);
		return i;
	}
	
	public List<reviewTest> selectAllreview(String muid){
		return dao.selectAllReview(muid);
	}
	
	public List<Favorites> selectAllLike(String muid){
		return dao.selectAllLike(muid);
	}
	
	public HashMap<String, Object> selectOwnHos(String muid){
		
		return dao.selectOwnHos(muid);
	}
	
	//병원수정
	
	public int updateHosInfo(HashMap<String, String>param,String hfile) {
		if(param.get("dutyTime1s")=="") {
			param.put("dutyTime1s", null);
		} 
		if(param.get("dutyTime2s")=="") {
			param.put("dutyTime2s", null);
		} 
		if(param.get("dutyTime3s")=="") {
			param.put("dutyTime3s", null);
		} 
		if(param.get("dutyTime4s")=="") {
			param.put("dutyTime4s", null);
		} 
		if(param.get("dutyTime5s")=="") {
			param.put("dutyTime5s", null);
		} 
		if(param.get("dutyTime6s")=="") {
			param.put("dutyTime6s", null);
		} 
		if(param.get("dutyTime7s")=="") {
			param.put("dutyTime7s", null);
		} 
		if(param.get("dutyTime8s")=="") {
			param.put("dutyTime8s", null);
		} 
		if(param.get("dutyTime1c")=="") {
			param.put("dutyTime1c", null);
		} 
		if(param.get("dutyTime2c")=="") {
			param.put("dutyTime2c", null);
		} 
		if(param.get("dutyTime3c")=="") {
			param.put("dutyTime3c", null);
		} 
		if(param.get("dutyTime4c")=="") {
			param.put("dutyTime4c", null);
		} 
		if(param.get("dutyTime5c")=="") {
			param.put("dutyTime5c", null);
		} 
		if(param.get("dutyTime6c")=="") {
			param.put("dutyTime6c", null);
		} 
		if(param.get("dutyTime7c")=="") {
			param.put("dutyTime7c", null);
		} 
		if(param.get("dutyTime8c")=="") {
			param.put("dutyTime8c", null);
		} 
		String a =param.get("post_num");
		String postcdn1=a.substring(0,3);
		String postcdn2= a.substring(3,a.length());
		param.put("postcdn1", postcdn1);
		param.put("postcdn2", postcdn2);
		
		param.put("hfile", hfile);
		System.out.println(param);
		return dao.updateHosInfo(param);
	}

}
