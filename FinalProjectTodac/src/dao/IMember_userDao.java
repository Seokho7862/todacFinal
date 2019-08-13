package dao;

import java.util.HashMap;

import model.MEMBER_USER;

public interface IMember_userDao {


		public void createMember_user(MEMBER_USER member);
		public MEMBER_USER searchMemberByID(HashMap<String ,Object>param);


}
