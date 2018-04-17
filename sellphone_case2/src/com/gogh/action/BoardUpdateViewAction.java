package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DTO.BoardDTO;

public class BoardUpdateViewAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/board/modify.jsp";
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("BoardUpdateViewAction 에서 bno값 : " + bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.boardDetailView(bno);
		
		request.setAttribute("boardupdate", bDto);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
