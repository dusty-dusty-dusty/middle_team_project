package com.mid.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.model.BoardVO;
import com.mid.repo.BoardDAO;





@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	
	public BoardVO NoticeBoard(BoardVO vo) {
		return boardDAO.NoticeBoard(vo);
	}

	public List<BoardVO> NoticeBoardList(HashMap map) {
		return boardDAO.NoticeBoardList(map);
	}
	
	
	
}
