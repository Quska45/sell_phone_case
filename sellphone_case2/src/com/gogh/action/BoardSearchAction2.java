package com.gogh.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DTO.BoardDTO;
import com.gogh.DTO.CriteriaDTO;
import com.gogh.DTO.PageMakerDTO;

public class BoardSearchAction2 implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "bulletin_board.jsp";
		
		//
		String flag = request.getParameter("flag");
		String keyword = request.getParameter("keyword");
		System.out.println(flag + ", " + keyword);
		
		//여기에는 페이지의 번호와 한 페이지에 보여줄 게시글의 개수가 담긴다.
		CriteriaDTO criDto = new CriteriaDTO();
		//처음 게시글에 들어가서 페이지를 띄울 때는 page의 번호가 1이여야 첫 번째 페이지가 바로 뜨게 된다.
		int page = 1;
		//만약 디비에서 받아온 페이지 번호가 null이 아니면 page변수에 이것을 담아준다.
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		//받아온 페이지 번호를 확인하기 위한 출력문
		System.out.println("페이지 번호" + page);
		//
		criDto.setPage(page);
		
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = bDao.listAll(criDto); 
		request.setAttribute("boardlist", boardlist);
		
		
		
		//화면 아래 인덱스 버튼들을 의미한다. 
		PageMakerDTO pageMaker = new PageMakerDTO();
		//PageMaker에 페이지 번호와 한 화면에 보여질 게시글의 수를 넣어준다.
		pageMaker.setCriDto(criDto);
		//여기에 전체 게시글의 건수가 담기게 된다. 맵퍼에 있는 sql문을 통해 10건이 담기게 된다.
		int result = bDao.totalCount(criDto);
		//총 게시글의 수가 담긴 result변수를 pagemaker에 담아주도록 한다.
		pageMaker.setTotalCount(result);
		//게시글 건수가 제대로 담겨있는지 확인하는 출력문
		System.out.println("게시글 전체" + pageMaker.getTotalCount());
		//pagemaker를 보내준다.
		request.setAttribute("pageMaker", pageMaker);
		
		
		Date date = new Date();
		request.setAttribute("today", date);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
