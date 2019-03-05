package com.homepage.gpcamp.service;


import java.util.List;
import java.util.Map;

import com.homepage.gpcamp.model.Board;

public interface BoardService {
	
	public Board board_read(Board board);						//게시판 상세보기

	List<Board> board_list(Map<String, Object> paramMap);		//게시판 목록
	
	public int board_cnt(Map<String, Object> paramMap);			//게시판 게시글 수
	
	int board_hit(int board_seq);								//게시글 클릭 시 조회수 증가
	
	}
