package org.zerock.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
//파일 업로드용 클래스
public class UploadFileUtils {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(UploadFileUtils.class);
	
	
	
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+ cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath ,datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	
	private static void makeDir(String uploadPath ,  String...paths) {
		
		if(new File(paths[paths.length-1]).exists()) {
			return;
			
		}
		
		for (String path : paths) {
			
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()) {
				
				dirPath.mkdir();
			}
		}
	}
	
	//thumbnail
	private static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception{
		
		BufferedImage sourceImg = 
				ImageIO.read(new File(uploadPath + path , fileName));
		
		BufferedImage destImg = 
				Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT ,100);
		
		String thumbnailName = 
				uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = 
				fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase() , newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar , '/');
	}
	
	//파일 업로드 처리
	
	public static String uploadFile(String uploadPath, String originalName , byte[] fileData)throws Exception{
		
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		
		//저장할 경로 계산
		String savaedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savaedPath,savedName);
		
		//원본 파일 저장
		FileCopyUtils.copy(fileData, target);
		
		//원본파일 확장자
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savaedPath, savedName);
		}else {
			uploadedFileName = makeIcon(uploadPath , savaedPath , savedName);
		}
		
		return uploadedFileName;
		
	}
	
	//미디어 타입일 경우 아이콘 생성
	private static String makeIcon(String uploadPath, String path, String fileName)throws Exception{
		
		String iconName = 
				uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}
	
}
