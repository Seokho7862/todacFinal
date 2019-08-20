package model;

import java.sql.Date;

public class notice {

	private int nid;
	private String maid;
	private Date ndate;
	private String title;
	private String content;
	private int readcount;

	public notice(String maid, String title, String content) {
		this.maid = maid;
		this.title = title;
		this.content = content;
	}

	public notice(int nid, String maid, Date ndate, String title, String content, int readcount) {
		this.nid = nid;
		this.maid = maid;
		this.ndate = ndate;
		this.title = title;
		this.content = content;
		this.readcount = readcount;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getMaid() {
		return maid;
	}

	public void setMaid(String maid) {
		this.maid = maid;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public notice() {
	}

}
