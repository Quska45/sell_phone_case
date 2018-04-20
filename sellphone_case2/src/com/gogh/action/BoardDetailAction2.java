package com.gogh.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gogh.DAO.BoardDAO;
import com.gogh.DAO.ReplyDAO;
import com.gogh.DTO.BoardDTO;
import com.gogh.DTO.ReplyDTO;

public class BoardDetailAction2 implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "bulletin_board_page.jsp";
		
		//bulletin_board.jsp에서 쿼리스트링으로 보내준 bno를 받아준다.
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		//조회수가 증가 할 때 세션값도 같이 보내줄 것이다.
		
		//세션을 활용한 조회수 증가 방지
		HttpSession session = request.getSession();
		//게시글을 클릭하면 조회수가 1씩 오른다.
		bDao.boardViewCnt(bno, session);
		
		//상세 게시글을 bulletin_board_page에 띄워주기 위해 게시글의 정보를 담아 boardview라는 이름으로 보내준다.
		//title, content, writer를 띄워준다.
		BoardDTO bDto = bDao.boardDetailView(bno);
		request.setAttribute("boardview", bDto);
		
		//상세 게시글에 댓글을 bulletin_board_page에 출력시키기 위해  댓글들의 정보를 담아 replyview라는 이름으로 보내준다.
		//writer, rno, regdate, content를 띄워준다.
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = rDao.replySelect(bno);
		request.setAttribute("replyview", list);
				
		//댓글의 수를 변수에 저장하고 이것을 replycount라는 이름으로 bulletin_board_page로 보내준다.
		//이걸 사용해서 댓글이 몇건인지 띄워준다.
		
		int replyCount = list.size();
		request.setAttribute("replycount", replyCount);
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
		
		
		
	}

}
