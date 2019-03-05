package com.homepage.gpcamp.dao;


import java.util.List;
import java.util.Map;

import com.homepage.gpcamp.model.Board;

public interface BoardDao {

	public Board board_read(Board board); 							//게시판 상세보기

	public List<Board> board_list(Map<String, Object> paramMap);	//게시판 목록 리스트

	public int board_cnt(Map<String, Object> paramMap);				//게시물 갯 수 
	
	public int board_hit(int board_seq);							//클릭 시 카운터 +1씩 증가

}
