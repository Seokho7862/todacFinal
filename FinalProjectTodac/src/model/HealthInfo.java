package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class HealthInfo {

//	IID	number	PK
//	MUID	varchar2[50]	FK
//	WRITER	VARCHAR2	
//	IDATE	date	Def(sysdate)
//	TITLE	varchar2[70]	NN
//	CONTENT	varchar2[4000]	
//	hfile	varchar2[200]	
//	READCOUNT	number	Def(1)

	int iid;
	String muid;
	String writer;
	Date iDate;
	String title;
	String content;
	String hfile;
	int readcount;
	




	public HealthInfo(int iid, String title, String content, String hfile) {
		this.iid = iid;
		this.title = title;
		this.content = content;
		this.hfile = hfile;
	}


	public HealthInfo(int iid, String muid, String writer, Date iDate, String title, String content, String hfile,
			int readcount) {
		this.iid = iid;
		this.muid = muid;
		this.writer = writer;
		this.iDate = iDate;
		this.title = title;
		this.content = content;
		this.hfile = hfile;
		this.readcount = readcount;
	}
	
	
	public HealthInfo(String muid, String writer, String title, String content, String hfile) {
		this.muid = muid;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.hfile = hfile;
	}

	

	public HealthInfo () {}
	@Override
	public String toString() {
		return "HealthInfo [iid=" + iid + ", muid=" + muid + ", writer=" + writer + ", iDate=" + iDate + ", title="
				+ title + ", content=" + content + ", hfile=" + hfile + ", readcount=" + readcount + "]";
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public String getMuid() {
		return muid;
	}
	public void setMuid(String muid) {
		this.muid = muid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getiDate() {
		return iDate;
	}
	public void setiDate(Date iDate) {
		this.iDate = iDate;
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
	public String gethfile() {
		return hfile;
	}
	public void sethfile(String hfile) {
		this.hfile = hfile;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	public HealthInfo(int iid, String muid, String writer, Date iDate, String title, String content, String hfile,
			int readcount, int rnum) {
		this.iid = iid;
		this.muid = muid;
		this.writer = writer;
		this.iDate = iDate;
		this.title = title;
		this.content = content;
		this.hfile = hfile;
		this.readcount = readcount;
	};
	
	
	
	
	
}
