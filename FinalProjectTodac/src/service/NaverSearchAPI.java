package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import model.disease_web;

public class NaverSearchAPI {

	public static void main(String[] args) {
		diseaseSearch("감기");
	}

	public static ArrayList<disease_web> diseaseSearch(String keywords) {
		String clientId = "iY31JF8kjme9wxA_0BZ0";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "NRCOIJnSG8";// 애플리케이션 클라이언트 시크릿값";
		ArrayList<disease_web> searchList = new ArrayList<>();

		try {
			String text = URLEncoder.encode(keywords, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/encyc?query=" + text + "&display=5&start=1&sort=sim"; // json
																														// 결과
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			searchList = jsonParsing(response.toString());
			

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return searchList;
	}

	public static ArrayList<disease_web> jsonParsing(String jsonData) {

		ArrayList<disease_web> searchList = new ArrayList<>();

		try {
			JSONParser jsonParse = new JSONParser(); // JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			JSONObject jsonObj;
			jsonObj = (JSONObject) jsonParse.parse(jsonData);
			JSONArray personArray = (JSONArray) jsonObj.get("items");

			for (int i = 0; i < personArray.size(); i++) {
				disease_web dis = new disease_web();
				JSONObject personObject = (JSONObject) personArray.get(i);

				dis.setTitle((String) personObject.get("title"));
				dis.setDescription((String) personObject.get("description"));
				dis.setLink((String) personObject.get("link"));
				if (personObject.get("thumbnail") != null) {
					dis.setThumbnail((String) personObject.get("thumbnail"));
				}
				searchList.add(dis);
				
				
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
		return searchList;
	}

}