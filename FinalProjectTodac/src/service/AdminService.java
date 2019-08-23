package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IAdminDao;
import dao.IApplyManagerDao;
import model.apply_manager;

@Service
public class AdminService {
	
	
	@Autowired
	private IApplyManagerDao dao;
	
	@Autowired
	private IAdminDao addao;
	
	public List<apply_manager> selectAllapply(){
		return dao.selectAllApply();
	}
	
	//사업자등록 사진가져오기
	public File getFile(int aid) {
		apply_manager a =  dao.selectOne(aid);
		
		String fileName = a.getAbsFile();
		String path = "C:/Temp/attach/";
		 
		return new File(fileName);
	}
	//승인하기
	public void updateAccept(String muid, String hpid) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("hpid", hpid);
		param.put("chk","");
		param.put("muid",muid);
		dao.insertManager(param);
		System.out.println(param);
		dao.updateAccept(param);
	}
	
	//관리자로그인
	public int adminLogin(HashMap<String, Object>param) {
		String maid=(String) param.get("maid");
		String pwd = (String) param.get("pwd");
		System.out.println("ㅅㅂ");
		HashMap<String, Object> result = addao.selectAdminById(maid);
		System.out.println(result);
		String pw = (String)result.get("PW");
		if(result!=null) {
			if(pw.equals(pwd)) {
				return 1;
			}else {
			return 0;}
		}
		else 
		return 0;
	}
	
	
}
