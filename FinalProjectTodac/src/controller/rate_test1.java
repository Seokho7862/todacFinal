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

import model.Rate;

import java.io.BufferedReader;
import java.io.IOException;

public class rate_test1 {
	
	private String ykiho;
	private List<Rate> rList = null;
	
	
    public List<Rate> showRate (List<String> yList){
    	rList = new ArrayList<Rate>();
    	for(int i =0; i<yList.size();i++) {
    		
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospAsmRstInfoService/getHospWhlAsmRstList"); /*URL*/
        try {
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=P6WiytSwjecJ9Xc3948rlZ9HNqdUFVZafMD6PiuQAT0XrcVOAy5MMaDyudgW9AzuNB9a5kpTaSY6%2BFcTJVrBBw%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("ykiho","UTF-8") + "="+yList.get(i)+
        "&"+URLEncoder.encode("numOfRows", "UTF-8")+"=1"+"&"+URLEncoder.encode("pageNo", "UTF-8")+"=1"); /*파라미터설명*/
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
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        XmlPullParserFactory factory;
	
			factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser();
		
		parser.setInput(new StringReader(sb.toString())); //파서에 데이터 인풋 
		int eventType = parser.getEventType(); //int 리턴
		Rate r = null; //담을 책 객체 
    	
    	
    	// 문서가 끝날때 까지 while문 실행
    	while(eventType!=XmlPullParser.END_DOCUMENT) {
    		
    		switch (eventType) {
    		
    		case XmlPullParser.START_DOCUMENT:
//    			rList = new ArrayList<Rate>();
    			break;
    		case XmlPullParser.END_DOCUMENT:
    			break;
    		case XmlPullParser.END_TAG:
    			if(parser.getName().equals("items")) {
    				rList.add(r);
    				r=null; 
    			}
    			break;
    		case XmlPullParser.START_TAG:
    			//이중스위치를 써도 좋음 
    			
    			switch(parser.getName()){
    			case"item" : 
    				r= new Rate();
    				break;
    			case "yadmNm" :
    				//null값 예외처리
    				if(r!=null)
    					r.setYadmNm(parser.nextText());
    				break;
    			case "addr" :
    				//null값 예외처리
    				if(r!=null)
    					r.setAddr(parser.nextText());
    				break;
    			case "asmGrd17" :
    				//항생제처방률
    				//null값 예외처리
    				if(r!=null)
    					r.setAnti_rate(parser.nextText());
    				break;
    			case "asmGrd18" :
    				//주사제처방률
    				//null값 예외처리
    				if(r!=null)
    					r.setInjection_rate(parser.nextText());
    				break;
    			case "asmGrd21" :
    				//처방약품비
    				//null값 예외처리
    				if(r!=null)
    					r.setMedi_cost_rate(parser.nextText());
    				break;
    			
    			case "asmGrd6" :
    				//수술항생제사용률
    			//null값 예외처리
	    			if(r!=null)
	    				r.setOp_anti_rate(parser.nextText());
	    			break;
    		}
    			
    		default:
    			break;
    		}
    		
    		eventType= parser.next(); //다음 이벤트를 가져오기
    	}
        
    	
    	for(Rate r1: rList) {
    		System.out.println(r1+" chk");
    	}
    	
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	}
		
        return rList;
        }
    
}