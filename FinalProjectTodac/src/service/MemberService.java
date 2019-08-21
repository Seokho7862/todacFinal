package service;

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
	
	public int loginManager(String muid, String pwd) {
		MEMBER_USER m = dao.selectManagerById(muid);
		System.out.println(m+"서비스");
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
	//관계자인지 아닌지 체크
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
	
	//회원 수정하기
	public int updateMember(MEMBER_USER m) {
		
		int i = dao.updateMember(m);
		System.out.println(i);
		return i;
	}
	
	//마이페이지 리뷰 목록 불러오기 나중에 리뷰 서비스로 옮기기
	public List<reviewTest> selectAllreview(String muid){
		return dao.selectAllReview(muid);
	}
	
	//마이페이지 즐겨찾기불러오기
	public List<Favorites> selectAllLike(String muid){
		return dao.selectAllLike(muid);
	}
	
	//마이페이지에서 자신의 병원 불러오기
	public HashMap<String, Object> selectOwnHos(String muid){
		
		return dao.selectOwnHos(muid);
	}

}
