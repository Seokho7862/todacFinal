package model;

import java.sql.Date;

public class search {

	private String keyword;
	private int age;
	private Date sdate;

	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	
	@Override
	public String toString() {
		return "search [keyword=" + keyword + ", age=" + age + ", sdate=" + sdate + "]";
	}
	public search(String keyword, int age) {
		this.keyword = keyword;
		this.age = age;
	}
	
	public search(String keyword) {
		this.keyword=keyword;
	}
	
	public search() {}
	
}
