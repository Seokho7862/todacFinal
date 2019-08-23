package model;

import java.sql.Date;

public class Report {
	private int reportid;
	private int rid;
	private String reportreason;
	private Date reportdate;
	
	public Report() {}

	public Report(int reportid, int rid, String reportreason, Date reportdate) {
		this.reportid = reportid;
		this.rid = rid;
		this.reportreason = reportreason;
		this.reportdate = reportdate;
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
	@Override
	public String toString() {
		return "Report [reportid=" + reportid + ", rid=" + rid + ", reportreason=" + reportreason + ", reportdate="
				+ reportdate + "]";
	}
	
	
	
}
