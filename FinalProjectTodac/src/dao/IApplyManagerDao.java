package dao;

import java.util.HashMap;
import java.util.List;

import model.apply_manager;

public interface IApplyManagerDao {

	public List<apply_manager> selectAllApply();
	public apply_manager selectOne(int aid);
	
	//승인하기
	public void insertManager(HashMap<String, Object> param);
	public void updateAccept(HashMap<String, Object> param);
	
	//승인 완료 or 거부 후  신청리스트에서 삭제하기
	public void deleteApply(int aid);
	
	public void applyManager(apply_manager apply);
	}
	
