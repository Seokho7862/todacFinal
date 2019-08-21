package model;

import java.sql.Date;

public class Review {
	private int rid;
	private String title;
	private String content;
	private Date rdate;
	private String rfile;
	private int readcount;
	private int grade;
	private String hpid;
	private String muid;
	
	public Review() {}
	public Review(int rid, String title, String content, Date rdate, String rfile, int readcount, int grade,
			String hpid, String muid) {
		this.rid = rid;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.rfile = rfile;
		this.readcount = readcount;
		this.grade = grade;
		this.hpid = hpid;
		this.muid = muid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = Integer.valueOf(rid);
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = String.valueOf(title);
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = String.valueOf(content);
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
		this.rfile = String.valueOf(rfile);
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = Integer.valueOf(readcount);
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = Integer.valueOf(grade);
	}

	public String getHpid() {
		return hpid;
	}

	public void setHpid(String hpid) {
		this.hpid = String.valueOf(hpid);
	}

	public String getMuid() {
		return muid;
	}

	public void setMuid(String muid) {
		this.muid = String.valueOf(muid);
	}

	@Override
	public String toString() {
		return "Review [rid=" + rid + ", title=" + title + ", content=" + content + ", rdate=" + rdate + ", rfile="
				+ rfile + ", readcount=" + readcount + ", grade=" + grade + ", hpid=" + hpid + ", muid=" + muid + "]";
	}
	
	
}
