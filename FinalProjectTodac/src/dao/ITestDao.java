package dao;


import model.HospitalInfo;

public interface ITestDao {
	public int insertHostpital(HospitalInfo hinfo);
	public int insertHostpital1(HospitalInfo hinfo);
	public HospitalInfo selectHostpital1(String hpid);
}
