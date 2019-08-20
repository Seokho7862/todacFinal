package service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.springframework.web.multipart.MultipartFile;

public class ManagerApplyFileUploadClass {

	public static String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}	
	
	public static ArrayList<String> FileUpload(MultipartFile file){
		ArrayList<String> result = new ArrayList<String>();
		String savePath = "C:\\Users\\student\\git\\todacFinal\\FinalProjectTodac\\WebContent\\ApplyTempFileFolder";
		System.out.println(file.getSize());
		if(file.getSize()!=0) {
		String originalFilename = file.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf("."));
		String extension = originalFilename.substring(originalFilename.indexOf("."));
		String rename = onlyFileName + "_" + getCurrentDayTime() + extension;
		String fullPath = savePath + "\\" + rename;
		String relatePath = "ApplyTempFileFolder"+"\\" +rename;
		
		if (!file.isEmpty()) {
	        try {
	            byte[] bytes = file.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	           
	        } catch (Exception e) {
	           
	        }
	    } 
		result.add(relatePath);
		result.add(fullPath);
		}
		
		
		return result;
	}
}
