package service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IApplyManagerDao;
import model.apply_manager;

@Service
public class ApplyService {
	
	@Autowired
	private IApplyManagerDao dao;
	
	public List<apply_manager> selectAllapply(){
		System.out.println(dao.selectAllApply());
		return dao.selectAllApply();
	}
	
	public File getFile(int aid) {
		apply_manager a =  dao.selectOne(aid);
		String fileName = a.getRelFile();
		String path = "C:/Temp/attach/";
		
		return new File(path+fileName);
	}
	
}
