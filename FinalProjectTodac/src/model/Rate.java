package model;

public class Rate {
	private String yadmNm;
	private String addr;
	private String anti_rate;
	private String injection_rate;
	private String medi_cost_rate;
	private String op_anti_rate;
	
	public Rate() {
		
	}
	
	public String getYadmNm() {
		return yadmNm;
	}
	public void setYadmNm(String yadmNm) {
		this.yadmNm = yadmNm;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAnti_rate() {
		return anti_rate;
	}
	public void setAnti_rate(String anti_rate) {
		this.anti_rate = anti_rate;
	}
	public String getInjection_rate() {
		return injection_rate;
	}
	public void setInjection_rate(String injection_rate) {
		this.injection_rate = injection_rate;
	}
	public String getMedi_cost_rate() {
		return medi_cost_rate;
	}
	public void setMedi_cost_rate(String medi_cost_rate) {
		this.medi_cost_rate = medi_cost_rate;
	}
	public String getOp_anti_rate() {
		return op_anti_rate;
	}
	public void setOp_anti_rate(String op_anti_rate) {
		this.op_anti_rate = op_anti_rate;
	}
	@Override
	public String toString() {
		return "Rate [yadmNm=" + yadmNm + ", addr=" + addr + ", anti_rate=" + anti_rate + ", injection_rate="
				+ injection_rate + ", medi_cost_rate=" + medi_cost_rate + ", op_anti_rate=" + op_anti_rate + "]";
	}
	
}
