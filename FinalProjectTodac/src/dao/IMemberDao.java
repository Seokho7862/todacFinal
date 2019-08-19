package dao;

import java.util.HashMap;

import model.MEMBER_USER;

public interface IMemberDao {
	
	//사용자 로그인시 확인하기
	public MEMBER_USER selectUserById(String muid);
	public MEMBER_USER selectUserByNamePhone(HashMap<String, String> param);
	public void updatePwd(HashMap<String, String>param);
	
	//관계자 로그인시 확인하기
	public MEMBER_USER selectManagerById(String muid);
}
