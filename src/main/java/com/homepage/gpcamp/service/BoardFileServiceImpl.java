package com.homepage.gpcamp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.homepage.gpcamp.dao.BoardFileDao;
import com.homepage.gpcamp.model.Board;
import com.homepage.gpcamp.model.BoardFile;

@Service("boardFileService")
public class BoardFileServiceImpl implements BoardFileService{
	
	@Resource(name="boardFileDao")
	private BoardFileDao boardFileDao;

	@Override
	public List<BoardFile> file_list(Map<String, Object> paramMap) {		//파일 목록
		return boardFileDao.file_list(paramMap);
	}

	@Override
	public void file_hit(String file_seq) {									//파일 다운로드 클릭 시 +1 씩 증가
		boardFileDao.file_hit(file_seq);
	}


	
}
