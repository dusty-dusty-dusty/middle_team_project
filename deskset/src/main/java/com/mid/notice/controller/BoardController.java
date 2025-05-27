package com.mid.notice.controller;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.notice.model.BoardVO;
import com.mid.notice.service.BoardService;


@Controller
@RequestMapping("/notice") // 공통 경로
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 공지사항 상세보기
    @RequestMapping("/NoticeBoard")  
    public void getBoard(@RequestParam("notice_no") int noticeNo, Model m) {
        BoardVO vo = new BoardVO();
        vo.setNotice_no(noticeNo);
        
        BoardVO result = boardService.NoticeBoard(vo);  
        m.addAttribute("board", result);
    }

    //공지사항
@RequestMapping("NoticeBoardList")	
public void NoticeBoardList(
	    @RequestParam(defaultValue = "1") int page,  
	    @RequestParam(required = false) String searchCondition,
	    @RequestParam(required = false) String searchKeyword,
	    Model m
	) {
	    int pageSize = 13;
	    int startRow = (page - 1) * pageSize + 1;
	    int endRow = page * pageSize;

	    HashMap<String, Object> map = new HashMap<>();//공지사항 리스트 조회
	    
	    
	    
	    map.put("searchCondition", searchCondition);//검색 조건
	    map.put("searchKeyword", searchKeyword);//검색 키워드
	    map.put("start", startRow);//페이지 시작행
	    map.put("end", endRow);//페이지 번호 끝행

	    // 조건 있을 때만 검색 필터 map에 추가
	    if (searchCondition != null && searchKeyword != null && !searchKeyword.trim().isEmpty()) {
	        map.put("searchCondition", searchCondition);
	        map.put("searchKeyword", searchKeyword);
	    }
	    
	    //결과를 model에 담아서 jsp로 전달
	    List<BoardVO> result = boardService.NoticeBoardList(map); //매퍼로 전달
	    m.addAttribute("boardList", result);					//게시글 목록 데이터
	    m.addAttribute("currentPage", page);					//현재 페이지 번호
	    m.addAttribute("searchCondition", searchCondition);		//선택된 검색 조건
	    m.addAttribute("searchKeyword", searchKeyword);			//입력한 검색어
	}
	
	
	
}
