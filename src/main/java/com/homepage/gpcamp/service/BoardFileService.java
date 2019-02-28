package com.homepage.gpcamp.service;

import java.util.List;
import java.util.Map;

import com.homepage.gpcamp.model.Board;
import com.homepage.gpcamp.model.BoardFile;

public interface BoardFileService {

	List<BoardFile> file_list(Map<String, Object> paramMap);

	public void file_hit(String file_seq);

}
