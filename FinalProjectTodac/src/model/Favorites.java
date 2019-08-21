package model;

public class Favorites {
	private int lid;
	private String muid;
	private String hpid;
	private String dutyName;
	private String dutyAddr;
	
	public Favorites() {}
	

	public Favorites(int lid, String muid, String hpid, String dutyName, String dutyAddr) {
		this.lid = lid;
		this.muid = muid;
		this.hpid = hpid;
		this.dutyName = dutyName;
		this.dutyAddr = dutyAddr;
	}


	public int getLid() {
		return lid;
	}


	public void setLid(int lid) {
		this.lid = lid;
	}


	public String getMuid() {
		return muid;
	}


	public void setMuid(String muid) {
		this.muid = muid;
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


	public String getDutyAddr() {
		return dutyAddr;
	}


	public void setDutyAddr(String dutyAddr) {
		this.dutyAddr = dutyAddr;
	}


	@Override
	public String toString() {
		return "Favorites [lid=" + lid + ", muid=" + muid + ", hpid=" + hpid + ", dutyName=" + dutyName + ", dutyAddr="
				+ dutyAddr + "]";
	}
	

	
}
