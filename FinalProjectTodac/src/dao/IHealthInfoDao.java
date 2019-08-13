package dao;

import java.util.ArrayList;
import java.util.HashMap;

import model.HealthInfo;

public interface IHealthInfoDao {

	public ArrayList<HealthInfo> selectHealthInfoList(HashMap<String, Object> pageinfo);
	public ArrayList<HealthInfo> searchHealthInfoList(HashMap<String, Object> pageinfo);
	public int getNumberOfHealthInfo(HashMap<String, Object> pageinfo);
	public int getNumberOfHealthInfo2(HashMap<String, Object> pageinfo);
	public HealthInfo selectHealthInfo(HashMap<String, Object> iid2);
	public void deleteHealthInfo(HashMap<String, Object> iid2);
	public void updateHealthInfo(HealthInfo healthInfo);
	public void readcountUp(HashMap<String, Object> iid2);
	public void writeHealthInfo(HealthInfo healthInfo);
	public  ArrayList<HealthInfo> getListOfTop3(HashMap<String, Object> pageinfo);
}
