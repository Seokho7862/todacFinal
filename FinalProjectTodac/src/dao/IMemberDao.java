package dao;

import java.util.HashMap;

import model.MEMBER_USER;

public interface IMemberDao {
	
	
	public MEMBER_USER selectUserById(String muid);
	public MEMBER_USER selectUserByNamePhone(HashMap<String, String> param);
	public void updatePwd(HashMap<String, String>param);
	
	
	public MEMBER_USER selectManagerById(String muid);
	
	public int updateMember(MEMBER_USER m);
}
