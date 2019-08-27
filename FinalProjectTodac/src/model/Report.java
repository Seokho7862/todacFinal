package model;

import java.sql.Date;

public class Report {
	private int reportid;
	private int rid;
	private String reportreason;
	private Date reportdate;
	private String muid;
	
	public Report() {}
	

	public Report(int reportid, int rid, String reportreason, Date reportdate, String muid) {
		this.reportid = reportid;
		this.rid = rid;
		this.reportreason = reportreason;
		this.reportdate = reportdate;
		this.muid = muid;
	}


	public int getReportid() {
		return reportid;
	}

	public void setReportid(int reportid) {
		this.reportid = reportid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getReportreason() {
		return reportreason;
	}

	public void setReportreason(String reportreason) {
		this.reportreason = reportreason;
	}

	public Date getReportdate() {
		return reportdate;
	}

	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}

	public String getMuid() {
		return muid;
	}

	public void setMuid(String muid) {
		this.muid = muid;
	}


	@Override
	public String toString() {
		return "Report [reportid=" + reportid + ", rid=" + rid + ", reportreason=" + reportreason + ", reportdate="
				+ reportdate + ", muid=" + muid + "]";
	}
	
	
	
	
	
}
