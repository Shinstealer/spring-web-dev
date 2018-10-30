package org.zerock.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.util.MediaUtils;
import org.zerock.util.UploadFileUtils;

@Controller
public class UploadController {
	//form tag로 업로드
	private static final Logger logger = 
			LoggerFactory.getLogger(UploadController.class);
	
	//파일저장 객체
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/uploadForm", method = RequestMethod.GET)
	public void uploadForm()  {
		
	}
	
	@RequestMapping(value="/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file , Model model ) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " +  file.getSize());
		logger.info("contentType : " + file.getContentType());
		
		String savedName = 
			uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName" ,savedName);
		
		return "uploadResult";
		
	}
	
	//원본 파일의 이름과 파일 데이터를 byte[]로 변환			
	private String uploadFile(String originalName , byte[] fileData) throws Exception{
		
		//고유한 키값 발행 
		UUID uid = UUID.randomUUID();
		
		//업로드된 파일 이름
		String savedName = uid.toString() + "_" + originalName;
		
		File target = new File(uploadPath , savedName);
		
		//실제 파일 처리
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	
	//ajax 업로드용 컨트롤러
	
	@RequestMapping(value = "/uploadAjax" , method = RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax" , 
				method = RequestMethod.POST,
				produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		logger.info("originalName: " + file.getOriginalFilename());
		
		return
				new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, 
																file.getOriginalFilename(), 
																file.getBytes()),HttpStatus.CREATED);
		
	}
	
	//파일 전송 기능(썸네일 보여주기)
	@ResponseBody//byte[]데이터가 그대로 전송 명시
	@RequestMapping("/displayFile")//displayFile 파일이름을 /년/월/일/파일명으로 받음 , return타입 byte[]
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME : " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			//확장자 추출
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			//img파일인 경우 적절한 MIME타입 지정
			if(mType != null) {
				
				headers.setContentType(mType);
			}else {
				//img file이 아닌 경우 적절한 MIME타입을 다운로드 용으로 사용
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);//MIME타입을 다운로드 용으로 사용
				/* img src 띄어쓰기 주의! 스페이스 값이 먹혀서 절대주소 참조 문제로 이미지가 액박뜸!! */
				headers.add("Content-Disposition", "attachement; filename=\""+ 
				new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");//한글명 인코딩 
						
			}//실제로 데이터 읽는 부분 commons 라이브러리 기능 IOUtils임
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
												headers,
												HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	//첨부파일 삭제
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles" , method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		
		logger.info("delete all files:" + files);
		
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted" , HttpStatus.OK);
		}
		
		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				
				String front = fileName.substring(0,12);
				String end = fileName.substring(14);
				new File(uploadPath+ (front+end).replace('/', File.separatorChar)).delete();
			}
			
			new File(uploadPath+ fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted" , HttpStatus.OK);
		
	}//삭제 끝
	
	
}
