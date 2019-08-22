package model;

import java.util.Date;

public class reviewTest {
	private int rid;
	private String title;
	private String content;
	private Date rdate;
	private String rfile;
	private int readcount;
	private int grade;
	private String hpid;
	private String muid;
	private String dutyName;
	private String dutyAddr;
	
	public reviewTest() {}
	
	public reviewTest(int rid, String title, String content, Date rdate, String rfile, int readcount, int grade,
			String hpid, String muid, String dutyName, String dutyAddr) {
		this.rid = rid;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.rfile = rfile;
		this.readcount = readcount;
		this.grade = grade;
		this.hpid = hpid;
		this.muid = muid;
		this.dutyName = dutyName;
		this.dutyAddr = dutyAddr;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getRfile() {
		return rfile;
	}

	public void setRfile(String rfile) {
		this.rfile = rfile;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getHpid() {
		return hpid;
	}

	public void setHpid(String hpid) {
		this.hpid = hpid;
	}

	public String getMuid() {
		return muid;
	}

	public void setMuid(String muid) {
		this.muid = muid;
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
		return "reviewTest [rid=" + rid + ", title=" + title + ", content=" + content + ", rdate=" + rdate + ", rfile="
				+ rfile + ", readcount=" + readcount + ", grade=" + grade + ", hpid=" + hpid + ", muid=" + muid
				+ ", dutyName=" + dutyName + ", dutyAddr=" + dutyAddr + "]";
	}
	
	
}
