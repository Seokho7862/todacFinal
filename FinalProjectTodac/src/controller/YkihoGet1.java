package controller;

import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
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
		private HashSet<List<String>> set;
		public List<String> getYkiho(String code1,String code2,String hname) {
        urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /*URL*/
        try {
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=P6WiytSwjecJ9Xc3948rlZ9HNqdUFVZafMD6PiuQAT0XrcVOAy5MMaDyudgW9AzuNB9a5kpTaSY6%2BFcTJVrBBw%3D%3D");
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*�럹�씠吏�踰덊샇*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*�븳 �럹�씠吏� 寃곌낵 �닔*/
        urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode(code1, "UTF-8")); /*�떆�룄肄붾뱶*/
        urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode(code2, "UTF-8")); /*�떆援곌뎄肄붾뱶*/
//        urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode("�떊�궡�룞", "UTF-8")); /*�쓭硫대룞紐�*/
        urlBuilder.append("&" + URLEncoder.encode("yadmNm","UTF-8") + "=" + URLEncoder.encode(hname, "UTF-8")); /*蹂묒썝紐� (UTF-8 �씤肄붾뵫 �븘�슂)*/
//        urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode("2010", "UTF-8")); /*2010:醫낇빀蹂묒썝, 2030:蹂묒썝, 2040:�슂�뼇蹂묒썝, 2050:移섍낵, 2060:�븳諛�, 2070:�쓽�썝, 2080:蹂닿굔湲곌�, 2090:議곗궛�썝*/
//        urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*醫낅퀎肄붾뱶*/
//        urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*吏꾨즺怨쇰ぉ肄붾뱶*/
//        urlBuilder.append("&" + URLEncoder.encode("xPos","UTF-8") + "=" + URLEncoder.encode("127.09854004628151", "UTF-8")); /*x醫뚰몴(�냼�닔�젏 15)*/
//        urlBuilder.append("&" + URLEncoder.encode("yPos","UTF-8") + "=" + URLEncoder.encode("37.6132113197367", "UTF-8")); /*y醫뚰몴(�냼�닔�젏 15)*/
//        urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode("3000", "UTF-8")); /*�떒�쐞 : 誘명꽣(m)*/
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
		
		parser.setInput(new StringReader(sb.toString())); //�뙆�꽌�뿉 �뜲�씠�꽣 �씤�뭼 
		int eventType = parser.getEventType(); //int 由ы꽩
		String ykiho = null; //�떞�쓣 梨� 媛앹껜 
    	
    	
    	// 臾몄꽌媛� �걹�궇�븣 源뚯� while臾� �떎�뻾
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
    			//�씠以묒뒪�쐞移섎�� �뜥�룄 醫뗭쓬 
    			
    			switch(parser.getName()){
    			case"item" : 
    				break;
    			case "ykiho" :
    				//null媛� �삁�쇅泥섎━
//    				if(ykiho!=null)
    					ykiho=parser.nextText();
    				break;
    			
    		}
    			
    		default:
    			break;
    		}
    		
    		eventType= parser.next(); //�떎�쓬 �씠踰ㅽ듃瑜� 媛��졇�삤湲�
    	}
    	
    	for(String y: ykiList) {
    		System.out.println(y+" api履�");
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
		
		public HashSet<List<String>> getadrress(String code1) {
			urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /*URL*/
			try {
				urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=P6WiytSwjecJ9Xc3948rlZ9HNqdUFVZafMD6PiuQAT0XrcVOAy5MMaDyudgW9AzuNB9a5kpTaSY6%2BFcTJVrBBw%3D%3D");
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*�럹�씠吏�踰덊샇*/
				urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*�븳 �럹�씠吏� 寃곌낵 �닔*/
				urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode(code1, "UTF-8")); /*�떆�룄肄붾뱶*/
//				urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode(code2, "UTF-8")); /*�떆援곌뎄肄붾뱶*/
//        urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode("�떊�궡�룞", "UTF-8")); /*�쓭硫대룞紐�*/
//				urlBuilder.append("&" + URLEncoder.encode("yadmNm","UTF-8") + "=" + URLEncoder.encode(hname, "UTF-8")); /*蹂묒썝紐� (UTF-8 �씤肄붾뵫 �븘�슂)*/
//        urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode("2010", "UTF-8")); /*2010:醫낇빀蹂묒썝, 2030:蹂묒썝, 2040:�슂�뼇蹂묒썝, 2050:移섍낵, 2060:�븳諛�, 2070:�쓽�썝, 2080:蹂닿굔湲곌�, 2090:議곗궛�썝*/
//        urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*醫낅퀎肄붾뱶*/
//        urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*吏꾨즺怨쇰ぉ肄붾뱶*/
//        urlBuilder.append("&" + URLEncoder.encode("xPos","UTF-8") + "=" + URLEncoder.encode("127.09854004628151", "UTF-8")); /*x醫뚰몴(�냼�닔�젏 15)*/
//        urlBuilder.append("&" + URLEncoder.encode("yPos","UTF-8") + "=" + URLEncoder.encode("37.6132113197367", "UTF-8")); /*y醫뚰몴(�냼�닔�젏 15)*/
//        urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode("3000", "UTF-8")); /*�떒�쐞 : 誘명꽣(m)*/
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
				
				parser.setInput(new StringReader(sb.toString())); //�뙆�꽌�뿉 �뜲�씠�꽣 �씤�뭼 
				int eventType = parser.getEventType(); //int 由ы꽩
				String sgName = null; //�떆援곌뎄 �씠由�
				String code=null; //�떆援곌뎄 肄붾뱶
				ArrayList<String> list =null;
				set = new HashSet<List<String>>();
				
				// 臾몄꽌媛� �걹�궇�븣 源뚯� while臾� �떎�뻾
				while(eventType!=XmlPullParser.END_DOCUMENT) {
					
					switch (eventType) {
					
					case XmlPullParser.START_DOCUMENT:
						break;
					case XmlPullParser.END_DOCUMENT:
						break;
					case XmlPullParser.END_TAG:
						if(parser.getName().equals("item")) {
							list.add(code);
							list.add(sgName);
							set.add(list);
							list =null;
//    				ykiho=null; 
						}
						break;
					case XmlPullParser.START_TAG:
						//�씠以묒뒪�쐞移섎�� �뜥�룄 醫뗭쓬 
						
						switch(parser.getName()){
						case"item" : 
							list = new ArrayList<String>();
							break;
						case "sgguCd" :
							//null媛� �삁�쇅泥섎━
//    				if(ykiho!=null)
							code=parser.nextText();
							break;
						case "sgguCdNm" :
							//null媛� �삁�쇅泥섎━
							sgName=parser.nextText();
							break;
							
						}
						
					default:
						break;
					}
					
					eventType= parser.next(); //�떎�쓬 �씠踰ㅽ듃瑜� 媛��졇�삤湲�
				}
				
				for(List<String> l: set) {
					System.out.println(l+" api履�");
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
			
			return set;
		}
}
