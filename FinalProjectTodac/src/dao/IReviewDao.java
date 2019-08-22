package dao;

import java.util.List;

import model.Report;
import model.Review;

public interface IReviewDao {
	public List<Review> selectOneHospitalReview(String hpid);
	public Review selectOneReviewBoard(String rid);
	public Review selectAroundReview(String rid);
	public void reviewWrite(Review r);
	public void ReportInsert(Report r);
	public void updateReivewStatus(int rid);
	
}
