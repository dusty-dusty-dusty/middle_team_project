package com.mid.repo;

import java.util.HashMap;

import com.mid.model.BoardVO;

import java.util.List;

public interface BoardDAO {

	public BoardVO NoticeBoard(BoardVO vo);
	
	public List<BoardVO> NoticeBoardList(HashMap map);
	
	
	
}
