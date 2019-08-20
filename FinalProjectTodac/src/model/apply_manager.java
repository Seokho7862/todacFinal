package model;

public class apply_manager {

	
	private int aid;
	private String name;
	private String hpid;
	private String dutyName;
	private String muid;
	private String bisunessNumber;
	private String relFile;//(상대 주소)
	private String absFile; //(절대주소)
	
	
	@Override
	public String toString() {
		return "apply_manager [aid=" + aid + ", name=" + name + ", hpid=" + hpid + ", dutyName=" + dutyName + ", muid="
				+ muid + ", bisunessNumber=" + bisunessNumber + ", relFile=" + relFile + ", absFile=" + absFile + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String gethpid() {
		return hpid;
	}
	public void sethpid(String hpid) {
		this.hpid = hpid;
	}
	public String getMuid() {
		return muid;
	}
	public void setMuid(String muid) {
		this.muid = muid;
	}
	public String getBisunessNumber() {
		return bisunessNumber;
	}
	public void setBisunessNumber(String bisunessNumber) {
		this.bisunessNumber = bisunessNumber;
	}
	public String getRelFile() {
		return relFile;
	}
	public void setRelFile(String relFile) {
		this.relFile = relFile;
	}
	public String getAbsFile() {
		return absFile;
	}
	public void setAbsFile(String absFile) {
		this.absFile = absFile;
	}
	
	public String getDutyName() {
		return dutyName;
	}
	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}
	public apply_manager() {}
	

	public apply_manager(int aid, String name, String hpid, String dutyName, String muid, String bisunessNumber,
			String relFile, String absFile) {
		this.aid = aid;
		this.name = name;
		this.hpid = hpid;
		this.dutyName = dutyName;
		this.muid = muid;
		this.bisunessNumber = bisunessNumber;
		this.relFile = relFile;
		this.absFile = absFile;
	}
	public apply_manager(String hpid, String muid, String bisunessNumber) {
		this.hpid = hpid;
		this.muid = muid;
		this.bisunessNumber = bisunessNumber;
	}

	

}
