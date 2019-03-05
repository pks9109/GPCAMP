package com.homepage.gpcamp.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Fileup {
	private List<MultipartFile> uploadfile;			//List멀티파트 사용
	private String fileName;						//파일 이름 선언
	
	public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "Fileup [uploadfile=" + uploadfile + ", fileName=" + fileName + "]";
	}
	
	
	
	
}
