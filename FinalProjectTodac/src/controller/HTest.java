package controller;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import dao.IDisease_dbDao;
import dao.IHealthInfoDao;
import dao.IHospitalInfoDao;
import dao.IMemberDao;
import dao.IMember_userDao;
import dao.INoticeDao;
import dao.ISearchDao;
import model.HealthInfo;
import model.HospitalInfo;
import model.MEMBER_USER;
import model.notice;
import model.search;

public class HTest {
public static void main(String[] args) {

	ApplicationContext context = new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
	
	IHealthInfoDao hDao = context.getBean(IHealthInfoDao.class);
	IDisease_dbDao dDao = context.getBean(IDisease_dbDao.class);
	IMember_userDao mDao = context.getBean(IMember_userDao.class);
	IMemberDao imDao = context.getBean(IMemberDao.class);
	IHospitalInfoDao hosDao = context.getBean(IHospitalInfoDao.class);
	ISearchDao sDao = context.getBean(ISearchDao.class);
	INoticeDao nDao = context.getBean(INoticeDao.class);
	HashMap<String, Object> pageinfo = new HashMap<String, Object>();
	
//	mDao.searchMemberByID(param)
	HashMap<String, Object> param = new HashMap<String, Object>();
	param.put("age", 0);
	System.out.println(sDao.getListOfSearch(param).size());
	
}
	
}
