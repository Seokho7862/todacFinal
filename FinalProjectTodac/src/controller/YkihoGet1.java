package controller;

import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.BufferedReader;
import java.io.IOException;
public class YkihoGet1 {
		
		private	StringBuilder urlBuilder;
		private StringBuilder sb;
		private List<String> ykiList = null;
    
		public List<String> getYkiho(String code1,String code2,String hname) {
        urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /*URL*/
        try {
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=P6WiytSwjecJ9Xc3948rlZ9HNqdUFVZafMD6PiuQAT0XrcVOAy5MMaDyudgW9AzuNB9a5kpTaSY6%2BFcTJVrBBw%3D%3D");
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode(code1, "UTF-8")); /*시도코드*/
        urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode(code2, "UTF-8")); /*시군구코드*/
//        urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode("신내동", "UTF-8")); /*읍면동명*/
        urlBuilder.append("&" + URLEncoder.encode("yadmNm","UTF-8") + "=" + URLEncoder.encode(hname, "UTF-8")); /*병원명 (UTF-8 인코딩 필요)*/
//        urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode("2010", "UTF-8")); /*2010:종합병원, 2030:병원, 2040:요양병원, 2050:치과, 2060:한방, 2070:의원, 2080:보건기관, 2090:조산원*/
//        urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*종별코드*/
//        urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*진료과목코드*/
//        urlBuilder.append("&" + URLEncoder.encode("xPos","UTF-8") + "=" + URLEncoder.encode("127.09854004628151", "UTF-8")); /*x좌표(소수점 15)*/
//        urlBuilder.append("&" + URLEncoder.encode("yPos","UTF-8") + "=" + URLEncoder.encode("37.6132113197367", "UTF-8")); /*y좌표(소수점 15)*/
//        urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode("3000", "UTF-8")); /*단위 : 미터(m)*/
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
        sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        XmlPullParserFactory factory;
		
			factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser();
		
		parser.setInput(new StringReader(sb.toString())); //파서에 데이터 인풋 
		int eventType = parser.getEventType(); //int 리턴
		String ykiho = null; //담을 책 객체 
    	
    	
    	// 문서가 끝날때 까지 while문 실행
    	while(eventType!=XmlPullParser.END_DOCUMENT) {
    		
    		switch (eventType) {
    		
    		case XmlPullParser.START_DOCUMENT:
    			ykiList = new ArrayList<String>();
    			break;
    		case XmlPullParser.END_DOCUMENT:
    			break;
    		case XmlPullParser.END_TAG:
    			if(parser.getName().equals("item")) {
    				ykiList.add(ykiho);
//    				ykiho=null; 
    			}
    			break;
    		case XmlPullParser.START_TAG:
    			//이중스위치를 써도 좋음 
    			
    			switch(parser.getName()){
    			case"item" : 
    				break;
    			case "ykiho" :
    				//null값 예외처리
//    				if(ykiho!=null)
    					ykiho=parser.nextText();
    				break;
    			
    		}
    			
    		default:
    			break;
    		}
    		
    		eventType= parser.next(); //다음 이벤트를 가져오기
    	}
    	
    	for(String y: ykiList) {
    		System.out.println(y+" api쪽");
    	}
        
        
        
        
        
        
        } catch (UnsupportedEncodingException e) {
        	// TODO Auto-generated catch block
        	e.printStackTrace();
        } catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

        return ykiList;
		}
}
