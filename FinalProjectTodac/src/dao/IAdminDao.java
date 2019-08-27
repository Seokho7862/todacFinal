package dao;

import java.util.HashMap;
import java.util.List;

import model.MEMBER_USER;

public interface IAdminDao {
	
	public HashMap<String, Object> selectAdminById(String maid);
	
	
	//모든 신고리스트 불러오기
	public List<HashMap<String, Object>> selectAllReport();
	
	//신고확정
	public int updateReport(String muid);
	
	//신고삭제
	public int deleteReport(int reportid);
	
	//5회 이상 신고된 사용자
	public List<MEMBER_USER> selectOverReport();
	
	//사용자 탈퇴시키기
	public int deleteUser(String muid);
	
	//승인 혹은 거절 후 리스트에서 삭제하기
	public int denyApply(int aid);
}
