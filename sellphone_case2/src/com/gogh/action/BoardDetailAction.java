package com.gogh.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DAO.ReplyDAO;
import com.gogh.DTO.BoardDTO;
import com.gogh.DTO.CriteriaDTO;
import com.gogh.DTO.ReplyDTO;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "board/read.jsp";	//게시글 상세 페이지 출력
		
		//값을 받을 때 폼태그는 name으로 값을 받아오지만 쿼리 스트링은 쿼리스트링에서 지정한 이름으로 받아온다. 여기서는 bno로 해줬다.
		//디비에 bno는 number로 만들어져 있기 때문에 int형으로 만들어 줘야한다.
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("게시글 번호 = " + bno);
		
		BoardDAO bDao = BoardDAO.getInstance();

		//게시글을 클릭하면 조회수가 1씩 오른다.
		bDao.boardViewCnt(bno);

		//상세 게시글 출력
		BoardDTO bDto = bDao.boardDetailView(bno);
		
		//상세 게시글 댓글 출력
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = rDao.replySelect(bno);
		request.setAttribute("replyview", list);
		
		request.setAttribute("boardview", bDto);
		
		int replyCount = list.size();
		
		request.setAttribute("replycount", replyCount);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
