package com.homepage.gpcamp.dao;


import java.util.List;
import java.util.Map;

import com.homepage.gpcamp.model.Board;

public interface BoardDao {

	public Board board_read(Board board);

	public List<Board> board_list(Map<String, Object> paramMap);

	public int board_cnt(Map<String, Object> paramMap);

	public int board_hit(int board_seq);

}
