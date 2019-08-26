package dao;

import java.util.HashMap;
import java.util.List;

public interface IAdminDao {
	
	public HashMap<String, Object> selectAdminById(String maid);
	
	
	//모든 신고리스트 불러오기
	public List<HashMap<String, Object>> selectAllReport();
	
	//신고확정
	public int updateReport(String muid);
}
