package com.homepage.gpcamp.service;


import java.util.List;
import java.util.Map;

import com.homepage.gpcamp.model.Board;

public interface BoardService {
	
	/*공통*/
	   
	//게시판 상세보기
	public Board board_read(Board board);

	//게시판 목록
	List<Board> board_list(Map<String, Object> paramMap);
	
	//게시판 게시글 수
	public int board_cnt(Map<String, Object> paramMap);
	
	//게시글 클릭 시 조회수 증가
	int board_hit(int board_seq);
	
	}
