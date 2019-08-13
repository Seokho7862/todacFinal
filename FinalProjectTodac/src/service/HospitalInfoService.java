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
		System.out.println("서비스 : " + hdao.searchKeyword(params));
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
	
	public HospitalInfo HospitalInfo_InfoForm(String hpid) {
		HashMap<String,String> params = new HashMap<String, String>();
		params.put("hpid", hpid);
		System.out.println("서비스단");
		System.out.println(hpid);
		System.out.println(hdao.HospitalInfo_InfoForm(params));
		System.out.println("서비스단");
		return hdao.HospitalInfo_InfoForm(params);
	}
}

