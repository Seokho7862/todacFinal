package dao;

import java.util.List;

import model.apply_manager;

public interface IApplyManagerDao {

	public List<apply_manager> selectAllApply();
	public apply_manager selectOne(int aid);
	public void applyManager(apply_manager apply);
	}
	
