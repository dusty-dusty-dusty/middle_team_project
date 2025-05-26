package com.mid.notice.repo;

import java.util.HashMap;

import com.mid.notice.model.BoardVO;

import java.util.List;

public interface BoardDAO {

	public BoardVO NoticeBoard(BoardVO vo);
	
	public List<BoardVO> NoticeBoardList(HashMap map);
	
	
	
}
