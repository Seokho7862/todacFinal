package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.HospitalInfo;

public interface IHospitalInfoDao {
	public List<HospitalInfo> selectAllMarker();
	public List<HashMap<String,Object>> getMarkers();
	public List<HashMap<String,Object>> searchKeyword(HashMap<String,Object> params);
	public List<HashMap<String,Object>> getFirstMarker(HashMap<String,Object> params);
	public List<HashMap<String,Object>> getMarkerByKeyword_GHosp(HashMap<String,Object> params);
	public List<HashMap<String,Object>> getMarkerByKeyword_SHosp(HashMap<String,Object> params);
	public List<HashMap<String,Object>> getMarkerByKeyword_Diag(HashMap<String,Object> params);
	public HospitalInfo HospitalInfo_InfoForm(HashMap<String,String> params);
	public ArrayList<HospitalInfo> searchByHname (HashMap<String, String> params);
	public HospitalInfo SelectOneHospital(String hpid);
}
