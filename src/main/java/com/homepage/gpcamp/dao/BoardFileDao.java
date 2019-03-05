package com.homepage.gpcamp.dao;

import java.util.List;
import java.util.Map;

import com.homepage.gpcamp.model.Board;
import com.homepage.gpcamp.model.BoardFile;

public interface BoardFileDao {

	public List<BoardFile> file_list(Map<String, Object> paramMap);		//파일 목록 출력

	public void file_hit(String file_seq);								//파일 다운로드시 카운터 +1씩 증가 필요시 사용 할 것(현재 사용 X)

}
