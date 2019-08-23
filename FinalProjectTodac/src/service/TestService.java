package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import dao.IApplyManagerDao;
import dao.IDisease_dbDao;
import dao.IHealthInfoDao;
import dao.IHospitalInfoDao;
import dao.IMember_userDao;
import dao.INoticeDao;
import dao.ISearchDao;
import dao.ITestDao;
import model.HealthInfo;
import model.HospitalInfo;
import model.MEMBER_USER;
import model.apply_manager;
import model.disease_db;
import model.notice;
import model.search;

@Service
public class TestService {
	@Autowired
	private IHealthInfoDao hDao;
	@Autowired
	private ITestDao tdao;
	@Autowired
	private IDisease_dbDao disDao;
	@Autowired
	private IMember_userDao muDao;
	@Autowired
	private IHospitalInfoDao hosDao;
	@Autowired
	private IApplyManagerDao applyDao;
	@Autowired
	private INoticeDao noticeDao;
	@Autowired
	private ISearchDao sDao;
	
	private static String ServiceKey = "=lVxTWoXqXosjGsm%2BJEUMoOlm%2BMCgvW%2FwNcb4I54miUQc9K5DAbBPOwOQAP3ZhGsNLHxtWZev2W2HxL92vNMrbg%3D%3D";
	public void insertHospitalInfo1() {
		HospitalInfo h = new HospitalInfo();
		h.setHpid("A1200021");
		h.setDutyName("�����λ꺴��");
		h.setPostCdn1("492");
		h.setPostCdn2("30");
		h.setDutyAddr("�λ걤���� ���� ��Ƽ�� 170 (����ŵ�2��)");
		h.setDutyTel1("051-242-9751");
		h.setDutyTel3("051-600-7750");
		h.setDutyTime1c("1730");
		h.setDutyTime2c("1730");
		h.setDutyTime3c("1730");
		h.setDutyTime4c("1730");
		h.setDutyTime5c("1730");
		h.setDutyTime6c("1730");
		h.setDutyTime7c("1730");
		h.setDutyTime8c(null);
		h.setDutyTime1s("0830");
		h.setDutyTime2s("0830");
		h.setDutyTime3s("0830");
		h.setDutyTime4s("0830");
		h.setDutyTime5s("0830");
		h.setDutyTime6s("0830");
		h.setDutyTime7s("0830");
		h.setDutyTime8s(null);
		h.setDgidldName("�������а�,��������,����������,�����Ǿȸ��缱��,����,�����������а�,��缱�����а�,������,����(�Ƿ��)��,�񴢱��,����ΰ�,�Ҿ�û�ҳ��,�Ҿ�ġ��,�Ű��,�Ű�ܰ�,�Ȱ�,�������а�,����ġ��,�ܰ�,�������а�,�̺����İ�,��Ȱ���а�,���Űǰ����а�,�����ܰ�,�����,���ܰ˻����а�,ġ��������,ġ��������,ġ����ö��,ġ�ְ�");
		h.setWgs84Lon(129.01074979097717);
		h.setWgs84Lat(35.11177720675051);
		System.out.println("error1");
		System.out.println(h);
		tdao.insertHostpital1(h);
		System.out.println("error2");
	}
	public void insertHospitalInfo(int page) {
		List<HospitalInfo> hospList = null;
        HospitalInfo h = null;
        
		try {
	    	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + ServiceKey); /*Service Key*/
	        //urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode("A1105950", "UTF-8")); /*���ID*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*������ ��ȣ*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10000", "UTF-8")); /*��� �Ǽ�*/
	        URL url = new URL(urlBuilder.toString());
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
		        
		    parser.setInput(new InputStreamReader(conn.getInputStream()));
		    
		    int eventType = parser.getEventType();
		    
		    while(eventType != XmlPullParser.END_DOCUMENT) {
		    	switch(eventType) {
		    	case 0 : hospList = new ArrayList<HospitalInfo>(); break;
		    	
		    	case 1 : break;
		    	
		    	case 2: //�±��� ����
		    		if(parser.getText().equals("<item>")) {
		    			h = new HospitalInfo();
		    			while(eventType != 1 && !(parser.getText().equals("</item>"))){
		    				if(parser.getText().equals("<hpid>")) {parser.next(); h.setHpid(parser.getText());}
		    				else if(parser.getText().equals("<dutyName>")) {parser.next();h.setDutyName(parser.getText());}
		    				else if(parser.getText().equals("<postCdn1>")) {parser.next();h.setPostCdn1(parser.getText());}
		    				else if(parser.getText().equals("<postCdn2>")) {parser.next();h.setPostCdn2(parser.getText());}
		    				else if(parser.getText().equals("<dutyAddr>")) {parser.next();h.setDutyAddr(parser.getText());}
		    				else if(parser.getText().equals("<dutyTel1>")) {parser.next();h.setDutyTel1(parser.getText());}
		    				else if(parser.getText().equals("<dutyTel3>")) {parser.next();h.setDutyTel3(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime1c>")) {parser.next();h.setDutyTime1c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime2c>")) {parser.next();h.setDutyTime2c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime3c>")) {parser.next();h.setDutyTime3c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime4c>")) {parser.next();h.setDutyTime4c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime5c>")) {parser.next();h.setDutyTime5c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime6c>")) {parser.next();h.setDutyTime6c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime7c>")) {parser.next();h.setDutyTime7c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime8c>")) {parser.next();h.setDutyTime8c(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime1s>")) {parser.next();h.setDutyTime1s(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime2s>")) {parser.next();h.setDutyTime2s(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime3s>")) {parser.next();h.setDutyTime3s(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime4s>")) {parser.next();h.setDutyTime4s(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime5s>")) {parser.next();h.setDutyTime5s(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime6s>")) {parser.next();h.setDutyTime6s(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime7s>")) {parser.next();h.setDutyTime7s(parser.getText());}
		    				else if(parser.getText().equals("<dutyTime8s>")) {parser.next();h.setDutyTime8s(parser.getText());}
		    				else if(parser.getText().equals("<dgidIdName>")) {parser.next();h.setDgidldName(parser.getText().replaceAll(",","/"));}
		    				else if(parser.getText().equals("<wgs84Lon>")) {parser.next();h.setWgs84Lon(Double.parseDouble(parser.getText()));}
		    				else if(parser.getText().equals("<wgs84Lat>")) {parser.next();h.setWgs84Lat(Double.parseDouble(parser.getText()));}
		    				eventType = parser.next();
		    			}hospList.add(h);
		    		}
		    	}eventType = parser.next();
		    }
		    int i=0;
		    for(HospitalInfo hh:hospList) {
		    	if(tdao.selectHostpital1(hh.getHpid())!=null) { //�����Ҷ�
		    		//Thread.sleep(50);
		    		if((tdao.selectHostpital1(hh.getHpid()).getHpid()).equals(hh.getHpid())) {
			    		System.out.println("�ߺ��� hpid :" + tdao.selectHostpital1(hh.getHpid()).getHpid() +" gethpid" + hh.getHpid());
			    		//Thread.sleep(50);
			    		continue;
		    		}
		    	}else {
		    		System.out.println(hh);
			    	tdao.insertHostpital(hh);
			    	//Thread.sleep(50);
		    	}
		    	//Thread.sleep(50);
		    }
		} catch (XmlPullParserException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
//		catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		System.out.println("����Ʈ ����" + hospList.size());
	}
	
	public ArrayList<HealthInfo> selectHealthInfoList(HashMap<String, Object> pageinfo) {
		
	return hDao.selectHealthInfoList(pageinfo);	
	}
	
	public ArrayList<HealthInfo> searchHealthInfoList(HashMap<String, Object> pageinfo){
		return hDao.searchHealthInfoList(pageinfo);
	}
	
	
	public void healthInfoWrite(HealthInfo healthInfo) {
		hDao.writeHealthInfo(healthInfo);
		
	}
	
	public HealthInfo selecthealthInfo(HashMap<String, Object> iid2){
		
		iid2.put("rc", hDao.selectHealthInfo(iid2).getReadcount());
		hDao.readcountUp(iid2);
		return hDao.selectHealthInfo(iid2);
	}
	public int getNumberOfHealthInfo(HashMap<String, Object> pageinfo){
		return hDao.getNumberOfHealthInfo(pageinfo);
	}
	
	public int getNumberOfHealthInfo2(HashMap<String, Object> pageinfo){
		return hDao.getNumberOfHealthInfo2(pageinfo);
	}
	
	public void deleteHealthInfo(HashMap<String, Object> iid2) {
		hDao.deleteHealthInfo(iid2);
	} 
	
	public void updateHealthInfo(HealthInfo hi) {
		hDao.updateHealthInfo(hi);
	};
	
	public ArrayList<String> getSubjectList(HashMap<String, String> dis){
	
		ArrayList<disease_db> dise=disDao.getSubjectList(dis);
		ArrayList<String> subjects = new ArrayList<String>();
		for(int i=0;i<dise.size();i++) {
			subjects.add(dise.get(i).getSubject());
		}
		
		return subjects;
	}
	
	public void createMember_user(MEMBER_USER member) {
		muDao.createMember_user(member);
	}
	public int idCheck(HashMap<String, Object>param) {
		if(muDao.searchMemberByID(param)==null) {
			return 0;
		}
		else {
			return 1;
		}
	}
	public  ArrayList<HealthInfo> getListOfTop3(int getType){
		HashMap<String,Object > pageinfo= new HashMap<String, Object>();
		pageinfo.put("getType", getType);		
		return hDao.getListOfTop3(pageinfo);
	}
	public ArrayList<HospitalInfo> hospitalSearch(String keyword, String searchType){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("keyword", keyword);
		params.put("searchType", searchType);
		
		return hosDao.searchByHname(params);
	}
	public void ApplyManager(apply_manager apply) {
		applyDao.applyManager(apply);
	}
	
	//여기부터 공지사항
	public void noticeWrite(notice notice) {
		noticeDao.noticeWrite(notice);
	}
	public ArrayList<notice> getNoticeList(){
		return noticeDao.getNoticeList();
	}
	public notice getNotice(int nid) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("nid", nid);	
		return noticeDao.getNotice(param);
	}
	
	public void noticeModify(notice notice) {
		noticeDao.modifyNotice(notice);
	}

	public void noticeDelete(int nid) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("nid", nid);	
		noticeDao.deleteNotice(param);		
	}
	public void Search(search s) {
		sDao.Search(s);
	}
	public ArrayList<search> getListOfSearch(int age){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("age", age);
		ArrayList<search> sl = sDao.getListOfSearch(param);
		ArrayList<search> rl = new ArrayList<search>();
		
		for(int i=0;i<sl.size();i++) {
			if(i==10) {break;}
			rl.add(sl.get(i));
		}
		return rl;
	}
	
	
}
