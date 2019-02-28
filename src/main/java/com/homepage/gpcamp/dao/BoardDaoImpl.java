package com.homepage.gpcamp.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homepage.gpcamp.model.Board;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Inject
    SqlSession SqlSession;
	
	@Override
	public Board board_read(Board board) {
		
		return SqlSession.selectOne("boards.board_read", board);
		
	}

	@Override
	public List<Board> board_list(Map<String, Object> paramMap) {
		return SqlSession.selectList("boards.board_list", paramMap);
	}

	@Override
	public int board_cnt(Map<String, Object> paramMap) {
		return SqlSession.selectOne("boards.board_cnt", paramMap);
	}
	
	@Override
	public int board_hit(int board_seq) {
		return SqlSession.update("boards.board_hit", board_seq);
	}
	
}