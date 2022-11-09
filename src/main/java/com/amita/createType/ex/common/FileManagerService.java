package com.amita.createType.ex.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public static final String FILE_UPLOAD_PATH = "/home/ec2-user/createType";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
		//서버에 저장할 위치를 잡기!!
		
		//저장되는 파일 이름은 사용자id + 유닉스 타임을 활용한 시간을 조합해서 만들기
		String directoryName = "/" + userId +"_" + System.currentTimeMillis() + "/";
		
		//디렉토리 생성
		String filePath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);
		if(directory.mkdir() ==  false) {
			//디렉토리를 만들다가 실패하면 실패 로그를 추가시키기
			logger.error("FileManagerService - saveFile : file 디렉토리 생성 에러" + filePath);
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			
			String fileFullPath = filePath + file.getOriginalFilename();
			Path path = Paths.get(fileFullPath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			// 파일 저장 실패
			
			logger.error("FileManagerService - saveFile : 파일 저장 실패");
			return null;
		}
		
		// 클라이언트에서 접근 가능한 경로 
		return "/images" + directoryName + file.getOriginalFilename();

	}
	
	// 파일 삭제 기능
	
	public static boolean removeFile(String filePath) {
		// 삭제 경로에 있는 images를 제거하고
		// 실제 파일 저장 경로를 이어 붙여주기
		
		if(filePath == null) {
			return true;
		}
		
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(realFilePath);
		// 파일이 있는지 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;
			}
		}
		
		path = path.getParent();
		
		
		// 디렉토리 존재하는지 여부 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;
			}
		}
		
		return true;
		
		
	}
	
	
}
