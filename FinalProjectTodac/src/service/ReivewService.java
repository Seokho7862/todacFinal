package service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.IReviewDao;
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
}
