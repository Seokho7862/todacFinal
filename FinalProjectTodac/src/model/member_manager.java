package model;

public class member_manager {
	private int chk;
	private String hpid;
	
	public member_manager() {}
	public member_manager(int chk, String hpid) {
		this.chk = chk;
		this.hpid = hpid;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public String getHpid() {
		return hpid;
	}
	public void setHpid(String hpid) {
		this.hpid = hpid;
	}
	@Override
	public String toString() {
		return "member_manager [chk=" + chk + ", hpid=" + hpid + "]";
	}
	
	

}
