package model;



public class HospitalInfo {
	private String hpid;
	private String dutyName;
	private String postCdn1;
	private String postCdn2;
	private String dutyAddr;
	private String dutyTel1;
	private String dutyTel3;
	
	private String dutyTime1c; //진료시간 월요일  끝
	private String dutyTime2c; //진료시간 화요일 
	private String dutyTime3c; //진료시간 수요일 
	private String dutyTime4c; //진료시간 목요일 
	private String dutyTime5c; //진료시간 금요일 
	private String dutyTime6c; //진료시간 토요일 
	private String dutyTime7c; //진료시간 일요일 
	private String dutyTime8c; //진료시간 공휴일 
	
	private String dutyTime1s; //진료시간 월요일 시작
	private String dutyTime2s; //진료시간 화요일
	private String dutyTime3s; //진료시간 수요일
	private String dutyTime4s; //진료시간 목요일
	private String dutyTime5s; //진료시간 금요일
	private String dutyTime6s; //진료시간 토요일
	private String dutyTime7s; //진료시간 일요일
	private String dutyTime8s; //진료시간 공휴일
	
	private String dgidldName; //진료과목
	
	private double wgs84Lon; // 경도
	private double wgs84Lat; // 위도
	
	public HospitalInfo() {}
	
	
	public HospitalInfo(String hpid, String dutyName, String postCdn1, String postCdn2, String dutyAddr,
			String dutyTel1, String dutyTel3, String dutyTime1c, String dutyTime2c, String dutyTime3c,
			String dutyTime4c, String dutyTime5c, String dutyTime6c, String dutyTime7c, String dutyTime8c,
			String dutyTime1s, String dutyTime2s, String dutyTime3s, String dutyTime4s, String dutyTime5s,
			String dutyTime6s, String dutyTime7s, String dutyTime8s, String dgidldName, double wgs84Lon,
			double wgs84Lat) {
		this.hpid = hpid;
		this.dutyName = dutyName;
		this.postCdn1 = postCdn1;
		this.postCdn2 = postCdn2;
		this.dutyAddr = dutyAddr;
		this.dutyTel1 = dutyTel1;
		this.dutyTel3 = dutyTel3;
		this.dutyTime1c = dutyTime1c;
		this.dutyTime2c = dutyTime2c;
		this.dutyTime3c = dutyTime3c;
		this.dutyTime4c = dutyTime4c;
		this.dutyTime5c = dutyTime5c;
		this.dutyTime6c = dutyTime6c;
		this.dutyTime7c = dutyTime7c;
		this.dutyTime8c = dutyTime8c;
		this.dutyTime1s = dutyTime1s;
		this.dutyTime2s = dutyTime2s;
		this.dutyTime3s = dutyTime3s;
		this.dutyTime4s = dutyTime4s;
		this.dutyTime5s = dutyTime5s;
		this.dutyTime6s = dutyTime6s;
		this.dutyTime7s = dutyTime7s;
		this.dutyTime8s = dutyTime8s;
		this.dgidldName = dgidldName;
		this.wgs84Lon = wgs84Lon;
		this.wgs84Lat = wgs84Lat;
	}


	public String getHpid() {
		return hpid;
	}
	public void setHpid(String hpid) {
		this.hpid = hpid;
	}
	public String getDutyName() {
		return dutyName;
	}
	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}
	public String getPostCdn1() {
		return postCdn1;
	}
	public void setPostCdn1(String postCdn1) {
		this.postCdn1 = postCdn1;
	}
	public String getPostCdn2() {
		return postCdn2;
	}
	public void setPostCdn2(String postCdn2) {
		this.postCdn2 = postCdn2;
	}
	public String getDutyAddr() {
		return dutyAddr;
	}
	public void setDutyAddr(String dutyAddr) {
		this.dutyAddr = dutyAddr;
	}
	public String getDutyTel1() {
		return dutyTel1;
	}
	public void setDutyTel1(String dutyTel1) {
		this.dutyTel1 = dutyTel1;
	}
	public String getDutyTel3() {
		return dutyTel3;
	}
	public void setDutyTel3(String dutyTel3) {
		this.dutyTel3 = dutyTel3;
	}
	public String getDutyTime1c() {
		return dutyTime1c;
	}
	public void setDutyTime1c(String dutyTime1c) {
		this.dutyTime1c = dutyTime1c;
	}
	public String getDutyTime2c() {
		return dutyTime2c;
	}
	public void setDutyTime2c(String dutyTime2c) {
		this.dutyTime2c = dutyTime2c;
	}
	public String getDutyTime3c() {
		return dutyTime3c;
	}
	public void setDutyTime3c(String dutyTime3c) {
		this.dutyTime3c = dutyTime3c;
	}
	public String getDutyTime4c() {
		return dutyTime4c;
	}
	public void setDutyTime4c(String dutyTime4c) {
		this.dutyTime4c = dutyTime4c;
	}
	public String getDutyTime5c() {
		return dutyTime5c;
	}
	public void setDutyTime5c(String dutyTime5c) {
		this.dutyTime5c = dutyTime5c;
	}
	public String getDutyTime6c() {
		return dutyTime6c;
	}
	public void setDutyTime6c(String dutyTime6c) {
		this.dutyTime6c = dutyTime6c;
	}
	public String getDutyTime7c() {
		return dutyTime7c;
	}
	public void setDutyTime7c(String dutyTime7c) {
		this.dutyTime7c = dutyTime7c;
	}
	public String getDutyTime8c() {
		return dutyTime8c;
	}
	public void setDutyTime8c(String dutyTime8c) {
		this.dutyTime8c = dutyTime8c;
	}
	public String getDutyTime1s() {
		return dutyTime1s;
	}
	public void setDutyTime1s(String dutyTime1s) {
		this.dutyTime1s = dutyTime1s;
	}
	public String getDutyTime2s() {
		return dutyTime2s;
	}
	public void setDutyTime2s(String dutyTime2s) {
		this.dutyTime2s = dutyTime2s;
	}
	public String getDutyTime3s() {
		return dutyTime3s;
	}
	public void setDutyTime3s(String dutyTime3s) {
		this.dutyTime3s = dutyTime3s;
	}
	public String getDutyTime4s() {
		return dutyTime4s;
	}
	public void setDutyTime4s(String dutyTime4s) {
		this.dutyTime4s = dutyTime4s;
	}
	public String getDutyTime5s() {
		return dutyTime5s;
	}
	public void setDutyTime5s(String dutyTime5s) {
		this.dutyTime5s = dutyTime5s;
	}
	public String getDutyTime6s() {
		return dutyTime6s;
	}
	public void setDutyTime6s(String dutyTime6s) {
		this.dutyTime6s = dutyTime6s;
	}
	public String getDutyTime7s() {
		return dutyTime7s;
	}
	public void setDutyTime7s(String dutyTime7s) {
		this.dutyTime7s = dutyTime7s;
	}
	public String getDutyTime8s() {
		return dutyTime8s;
	}
	public void setDutyTime8s(String dutyTime8s) {
		this.dutyTime8s = dutyTime8s;
	}
	public String getDgidldName() {
		return dgidldName;
	}
	public void setDgidldName(String dgidldName) {
		this.dgidldName = dgidldName;
	}
	public double getWgs84Lon() {
		return wgs84Lon;
	}
	public void setWgs84Lon(double wgs84Lon) {
		this.wgs84Lon = wgs84Lon;
	}
	public double getWgs84Lat() {
		return wgs84Lat;
	}
	public void setWgs84Lat(double wgs84Lat) {
		this.wgs84Lat = wgs84Lat;
	}


	@Override
	public String toString() {
		return "HospitalInfo [hpid=" + hpid + ", dutyName=" + dutyName + ", postCdn1=" + postCdn1 + ", postCdn2="
				+ postCdn2 + ", dutyAddr=" + dutyAddr + ", dutyTel1=" + dutyTel1 + ", dutyTel3=" + dutyTel3
				+ ", dutyTime1c=" + dutyTime1c + ", dutyTime2c=" + dutyTime2c + ", dutyTime3c=" + dutyTime3c
				+ ", dutyTime4c=" + dutyTime4c + ", dutyTime5c=" + dutyTime5c + ", dutyTime6c=" + dutyTime6c
				+ ", dutyTime7c=" + dutyTime7c + ", dutyTime8c=" + dutyTime8c + ", dutyTime1s=" + dutyTime1s
				+ ", dutyTime2s=" + dutyTime2s + ", dutyTime3s=" + dutyTime3s + ", dutyTime4s=" + dutyTime4s
				+ ", dutyTime5s=" + dutyTime5s + ", dutyTime6s=" + dutyTime6s + ", dutyTime7s=" + dutyTime7s
				+ ", dutyTime8s=" + dutyTime8s + ", dgidldName=" + dgidldName + ", wgs84Lon=" + wgs84Lon + ", wgs84Lat="
				+ wgs84Lat + "]";
	}
	
	
	
}
