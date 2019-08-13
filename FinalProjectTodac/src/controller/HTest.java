package controller;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import dao.IDisease_dbDao;
import dao.IHealthInfoDao;
import dao.IMember_userDao;
import model.HealthInfo;
import model.MEMBER_USER;

public class HTest {
public static void main(String[] args) {

	ApplicationContext context = new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
	
	IHealthInfoDao hDao = context.getBean(IHealthInfoDao.class);
	IDisease_dbDao dDao = context.getBean(IDisease_dbDao.class);
	IMember_userDao mDao = context.getBean(IMember_userDao.class);
	HashMap<String, Object> pageinfo = new HashMap<String, Object>();
	pageinfo.put("page", 1);
	pageinfo.put("searchType", 1);
	pageinfo.put("keyword", "테스트");
	pageinfo.put("getType", 3);
	
	for(int i=0;i<3;i++)
	System.out.println(hDao.getListOfTop3(pageinfo).get(i).toString());

}
	
}
