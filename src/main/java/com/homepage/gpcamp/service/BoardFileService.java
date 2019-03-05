package com.homepage.gpcamp.service;

import java.util.List;
import java.util.Map;

import com.homepage.gpcamp.model.Board;
import com.homepage.gpcamp.model.BoardFile;

public interface BoardFileService {

	List<BoardFile> file_list(Map<String, Object> paramMap);		//파일 목록 

	public void file_hit(String file_seq);							//파일 다운로드 클릭 시 +1씩 카운터 증가

}
