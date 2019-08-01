package dao;

import java.util.Scanner;

import model.HospitalInfo;

public interface ITestDao {
	Scanner sc = new Scanner(System.in);
	public int insertHostpital(HospitalInfo hinfo);
	public int insertHostpital1(HospitalInfo hinfo);
	public HospitalInfo selectHostpital1(String hpid);
}
