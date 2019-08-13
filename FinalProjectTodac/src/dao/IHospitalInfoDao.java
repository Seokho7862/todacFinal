package dao;

import java.util.HashMap;
import java.util.List;

import model.HospitalInfo;

public interface IHospitalInfoDao {
	public List<HospitalInfo> selectAllMarker();
	public List<HashMap<String,Object>> getMarkers();
	public List<HashMap<String,Object>> searchKeyword(HashMap<String,Object> params);
	public List<HashMap<String,Object>> getFirstMarker(HashMap<String,Object> params);
}
