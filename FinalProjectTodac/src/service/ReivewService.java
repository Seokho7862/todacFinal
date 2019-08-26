package service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.IReviewDao;
import model.Favorites;
import model.Report;
import model.Review;

@Service
public class ReivewService {
	@Autowired
	private IReviewDao rdao;
	
	public List<Review> selectOneHospitalInfo(String hpid){
		return rdao.selectOneHospitalReview(hpid);
	}
	
	public Review selectOneReviewBoard(String rid) {
		return rdao.selectOneReviewBoard(rid);
	}
	
	public Review selectAroundReview(String rid, String flag) {
		if(flag.equals("prev")) {
			rid = String.valueOf(Integer.valueOf(rid)-1);
		}else {
			rid = String.valueOf(Integer.valueOf(rid)+1);			
		}
		System.out.println("flag:"+flag +"/"+ rid);
		return rdao.selectAroundReview(rid);
	}
	
	public void reviewWrite(Review r, MultipartFile file) {
		String path = "C:/temp/todocFile/";
		File dir = new File(path);
		if(!dir.exists()) dir.mkdir();
		String fileName = file.getOriginalFilename();
		File attachFile = new File(path+fileName);
		try {
			file.transferTo(attachFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		r.setRfile(path+fileName);
		System.out.println(r);
		rdao.reviewWrite(r);
	}
	public void ReportInsert(String rid, String reportreason) {
		Report r = new Report();
		r.setRid(Integer.valueOf(rid));
		r.setReportreason(reportreason);
		
		rdao.ReportInsert(r);
		rdao.updateReivewStatus(Integer.valueOf(rid));
	}
	
	public void ClickFavorite(Favorites f, String status) {
		int stat = Integer.valueOf(status);
		System.out.println("서비스단"+f);
		//좋아요를 하지 않았을 때 insert
		if(stat == 0) {
			System.out.println();
			rdao.insertClickFavorite(f);
		}else {
			rdao.deleteClickFavorite(f);
		}
	}
	public Favorites findLidByFavoritesModel(String hpid, String muid) {
		Favorites f = new Favorites();
		f.setHpid(hpid); f.setMuid(muid);
		return rdao.findLidByFavoritesModel(f);
	}
	
	public Double averageRate(String hpid) {
		return rdao.averageRate(hpid);
	}
}
