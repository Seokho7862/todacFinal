package dao;

import java.util.HashMap;
import java.util.List;

import model.Favorites;
import model.MEMBER_USER;
import model.reviewTest;

public interface IMemberDao {
	
	//사용자 로그인시 확인하기
	public MEMBER_USER selectUserById(String muid);
	public MEMBER_USER selectUserByNamePhone(HashMap<String, String> param);
	public void updatePwd(HashMap<String, String>param);
	
	//관계자 로그인시 확인하기
	public MEMBER_USER selectManagerById(String muid);
	
	public int updateMember(MEMBER_USER m);
	
	//마이페이지 리뷰 목록불러오기 나중에 리뷰쪽으로 옮기기
	public List<reviewTest> selectAllReview(String muid);
	
	//즐겨찾기 불러오기
	public List<Favorites> selectAllLike(String muid);
	
	//자신의 병원불러오기
	public HashMap<String, Object> selectOwnHos(String muid);
}
