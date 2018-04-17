package com.gogh.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DTO.BoardDTO;
import com.gogh.DTO.CriteriaDTO;
import com.gogh.DTO.PageMakerDTO;

public class BoardListAction implements Action {
	//인덱스에서 고객 요청사항을 누르면 게시판으로 가고 게시글을 목록을 띄워주는 기능
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//board라는 폴더에 들어있기 때문에 경로를 써줘야 한다.
		String url = "board/listAll.jsp";
		
		//여기에는 페이지의 번호와 한 페이지에 보여줄 게시글의 개수가 담긴다.
		CriteriaDTO criDto = new CriteriaDTO();
		
		//처음 페이지를 띄울 때 page의 번호를 받아오는데 처음 띄울 때는 무조건 1이여야 한다. 
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호: " + page);
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
		int result = bDao.totalCount(criDto);
		pageMaker.setTotalCount(result);
		
		System.out.println("게시글 전체" + pageMaker.getTotalCount());
		
		request.setAttribute("pageMaker", pageMaker);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
