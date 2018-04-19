package com.gogh.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DAO.ReplyDAO;
import com.gogh.DTO.BoardDTO;
import com.gogh.DTO.CriteriaDTO;
import com.gogh.DTO.PageMakerDTO;
import com.gogh.DTO.ReplyDTO;

public class BoardListAction implements Action {
	//인덱스에서 고객 요청사항을 누르면 게시판으로 가고 게시글을 목록을 띄워주는 기능
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//board라는 폴더에 들어있기 때문에 경로를 써줘야 한다.
		String url = "board/listAll.jsp";
		
		//매개변수를 주지는 않았지만 CriteriaDTO생성자 안에 값이 있기 때문에 기본으로 값이 들어가게 된다.
		//여기에는 페이지의 번호와 한 페이지에 보여줄 게시글의 개수가 담긴다.
		CriteriaDTO criDto = new CriteriaDTO();
		
		//처음 페이지를 띄울 때 page의 번호를 받아오는데 처음 띄울 때는 무조건 1이여야 한다. 하지만 이건 Action단에서 쓰는 페이지 번호라는 것을 기억하자.
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호: " + page);
		//위에 선언된 Action에서 사용되는 page번호가 criDto에 들어간다.
		criDto.setPage(page);
		
		//싱글톤 패턴으로 만들었기 때문에 함수로 객체에 접근한다. 클래스명으로 바로 접근해준다.
		BoardDAO bDao = BoardDAO.getInstance();
		//listAll()를 탈 때 listCriteria sql문을 타야하고 가져가는 값은 criDto이다.
		List<BoardDTO> boardlist = bDao.listAll(criDto); //list(게시글 목록)과 같다.
				
		//이렇게 하면 만들어진 게시글의 목록이 request에 담기게 된다.
		request.setAttribute("boardlist", boardlist);
		
		
		PageMakerDTO pageMaker = new PageMakerDTO();
		//pageMaker에 페이지 번호와 한 화면에 보여질 게시글의 수를 넣어준다.
		pageMaker.setCriDto(criDto);
		//여기게 전체 게시글의 건수가 담기게 된다.
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
