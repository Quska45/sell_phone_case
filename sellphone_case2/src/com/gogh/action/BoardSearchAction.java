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

public class BoardSearchAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			String url = "board/listAll.jsp";
		
				String flag = request.getParameter("selsearch");
				
				//검증하기 위해서 넣은 if문
				if(flag.equals("1")) {
					System.out.println("전체 검색 start");
				} else if(flag.equals("2")) {
					System.out.println("제목 검색 start");
				} else if(flag.equals("3")) {
					System.out.println("내용 검색 start");
				} else if(flag.equals("4")) {
					System.out.println("제목+내용 검색 start");
				} else if(flag.equals("5")) {
					System.out.println("작성자 검색 start");
				}	
			
			
			
			
				//여기에는 페이지의 번호와 한 페이지에 보여줄 게시글의 개수가 담긴다.
				CriteriaDTO criDto = new CriteriaDTO();
				
				//처음 페이지를 띄울 때 page의 번호를 받아오는데 처음 띄울 때는 무조건 1이여야 한다. 
				int page = 1;
				if(request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				System.out.println("페이지 번호: " + page);
				criDto.setPage(page);

				//검색조건 입력(select박스)
				criDto.setFlag(flag);
				
				//싱글톤 패턴으로 만들었기 때문에 함수로 객체에 접근한다. 클래스명으로 바로 접근해준다.
				BoardDAO bDao = BoardDAO.getInstance();

				String keyword = request.getParameter("search_input");
				System.out.println("검색 키워드 = " + keyword);
				
				//검색어 추가(input창에 입력되는 값)
				criDto.setKeyword(keyword);
				
				System.out.println("criDto keyword : " + criDto.getKeyword());
				
				//listAll()를 탈 때 listCriteria sql문을 타야하고 가져가는 값은 criDto이다.
				List<BoardDTO> boardlist = bDao.boardSearch(criDto); //list(게시글 목록)과 같다.
				int boardlistSize = boardlist.size();
				//이렇게 하면 만들어진 게시글의 목록이 request에 담기게 된다.
				request.setAttribute("boardlist", boardlist);
				request.setAttribute("boardlistSize", boardlistSize);
				System.out.println(boardlistSize);
				
				
				
				PageMakerDTO pageMaker = new PageMakerDTO();
				//pageMaker에 페이지 번호와 한 화면에 보여질 게시글의 수를 넣어준다.
				pageMaker.setCriDto(criDto);
				//여기게 전체 게시글의 건수가 담기게 된다.
				int result = bDao.totalCount(criDto);
				System.out.println(result);
				pageMaker.setTotalCount(result);
				
				System.out.println("게시글 전체" + pageMaker.getTotalCount());
				
				request.setAttribute("pageMaker", pageMaker);
				
				
				String searchKeyword = keyword;
				request.setAttribute("searchKeyword", searchKeyword);
		
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
