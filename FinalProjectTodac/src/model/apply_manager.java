package model;

public class apply_manager {

	
	String aid;
	String hid;
	String muid;
	String bisunessNumber;
	String relFile;//(상대 주소)
	String absFile; //(절대주소)
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
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

	public apply_manager() {
	}
	
	public apply_manager(String aid, String hid, String muid, String bisunessNumber, String relFile, String absFile) {
		this.aid = aid;
		this.hid = hid;
		this.muid = muid;
		this.bisunessNumber = bisunessNumber;
		this.relFile = relFile;
		this.absFile = absFile;
	}
	
	public apply_manager(String hid, String muid, String bisunessNumber) {
		this.hid = hid;
		this.muid = muid;
		this.bisunessNumber = bisunessNumber;
	}

	

}
