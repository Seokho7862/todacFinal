package dao;

<<<<<<< HEAD
import java.util.List;

import model.apply_manager;

public interface IApplyManagerDao {

	public List<apply_manager> selectAllApply();
	public apply_manager selectOne(int aid);
=======
import model.apply_manager;

public interface IApplyManagerDao {

	public void applyManager(apply_manager apply);
	
>>>>>>> branch 'master' of https://github.com/Seokho7862/todacFinal
}
