package service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
	public static String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}	
	
	public void reviewWrite(Review r, MultipartFile file) {
		if(file.getSize()>0) {
			String savepath = "C:\\Users\\student\\git\\todacFinal\\FinalProjectTodac\\WebContent\\ReviewImg";
			String loadpath = "ReviewImg";
			File dir = new File(savepath);
			if(!dir.exists()) dir.mkdir();
			
			String fileName = file.getOriginalFilename();
			String onlyFileName = fileName.substring(0, fileName.indexOf("."));
			String extension = fileName.substring(fileName.indexOf("."));
			String newFileName = onlyFileName+"_"+ getCurrentDayTime()+extension;
			
			File attachFile = new File(savepath+"\\"+newFileName);
			try {
				file.transferTo(attachFile);
			}catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			r.setRfile(loadpath+"\\"+newFileName);
		}
		System.out.println("서비스 단 : "+r);
		rdao.reviewWrite(r);
	}
	
	public void ReportInsert(String sessionId ,String rid, String reportreason) {
		Report r = new Report();
		r.setRid(Integer.valueOf(rid));
		r.setReportreason(reportreason);
		r.setMuid(sessionId);
		
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
	
	public void Reviewdelete(String rid) {
		rdao.Reviewdelete(Integer.valueOf(rid));
	}
}
