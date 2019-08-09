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
		System.out.println(hdao.selectAllMarker().size());
		return hdao.selectAllMarker();
	}
	
	public List<HashMap<String,Object>> getMarker(){
		return hdao.getMarkers();
	}
	
	public List<HashMap<String,Object>> searchKeyword(String keyword){
		HashMap<String,Object> params = new HashMap<String, Object>();
		params.put("keyword", keyword);
		System.out.println("¼­ºñ½º : " + hdao.searchKeyword(params));
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
}

