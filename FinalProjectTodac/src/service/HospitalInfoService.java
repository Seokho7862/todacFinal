package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IHospitalInfoDao;
import model.HospitalInfo;

@Service
public class HospitalInfoService {
	@Autowired
	private IHospitalInfoDao hdao;
	
	public List<HospitalInfo> selectAllMarker(){
		return hdao.selectAllMarker();
	}
	
	public List<HashMap<String,Object>> getMarker(){
		return hdao.getMarkers();
	}
	
	public List<HashMap<String,Object>> searchKeyword(String keyword){
		HashMap<String,Object> params = new HashMap<String, Object>();
		params.put("keyword", keyword);
		return hdao.searchKeyword(params);
	}
	
	public List<HashMap<String,Object>> getFirstMarker(String swLat,
			String swLng, String neLat, String neLng){
		
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("swLat", swLat);
		params.put("swLng", swLng);
		params.put("neLat", neLat);
		params.put("neLng", neLng);
		return hdao.getFirstMarker(params);
	}
	public List<HashMap<String,Object>> HospitalInfo_DiagnosisByName(String swLat,
			String swLng, String neLat, String neLng, String keyword){
		
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("swLat", swLat);
		params.put("swLng", swLng);
		params.put("neLat", neLat);
		params.put("neLng", neLng);
		
		if(keyword.equals("전체")) {
			params.put("keyword", keyword);
			return hdao.getFirstMarker(params);
		}
		//진료과 split했을때 10개 이상 되는 것만
		else if(keyword.equals("종합")) {
			params.put("keyword", keyword);
			return hdao.getMarkerByKeyword_GHosp(params);
		}
		//이름으로 검색
		else if(keyword.equals("요양")) {
			params.put("keyword", keyword);
			return hdao.getMarkerByKeyword_SHosp(params);
		}
		//진료과로 검색
		else {
			params.put("keyword", keyword);
			return hdao.getMarkerByKeyword_Diag(params);
		}
		
	}
	
	public HospitalInfo HospitalInfo_InfoForm(String hpid) {
		HashMap<String,String> params = new HashMap<String, String>();
		params.put("hpid", hpid);
		return hdao.HospitalInfo_InfoForm(params);
	}
	
	public HospitalInfo SelectOneHospital(String hpid) {
		return hdao.SelectOneHospital(hpid);
	}
	
	
}

