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

//게시글 리스트에서 조회순, 최신, 작성자 등으로 정렬하고자 할 때 오는 액션
public class BoardListSortAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "bulletin_board.jsp";
		
		
		String flag = request.getParameter("flag");
		System.out.println(flag);
		
		
		//리스트 정렬시에 페이지를 다시 띄워야 하기 때문에 criDto가 필요하다.
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		criDto.setPage(page);
		criDto.setFlag(flag);
				
		//내가 원하는 정렬 키워드에 맞게 정렬된 리스트의 목록을 가져온다.
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardDTO> list = bDao.boardSort(criDto);
		request.setAttribute("boardlist", list);
		
		
		//페이지에 맞는 페이지 인덱스를 띄워줘야하기 때문에 pagemaker도 필요하다.
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int totalCount = bDao.totalCount(criDto);
		pageMaker.setTotalCount(totalCount);
		System.out.println("게시글 전체" + pageMaker.getTotalCount());
		request.setAttribute("pageMaker", pageMaker);
		
		//게시판에서 오늘 쓴 것은 날짜만 뜨고 예전에 쓴것은 일까지 뜨도록 하려고 한다.
		Date today = new Date();
		request.setAttribute("today", today);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
