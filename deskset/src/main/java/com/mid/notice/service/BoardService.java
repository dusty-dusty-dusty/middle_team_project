package com.mid.notice.service;

import java.util.HashMap;
import java.util.List;

import com.mid.notice.model.BoardVO;



public interface BoardService {
	
	//글 상세 조회
	BoardVO NoticeBoard(BoardVO vo);
	
	//글 목록 조회
	List<BoardVO> NoticeBoardList(HashMap map);
	
	
}
