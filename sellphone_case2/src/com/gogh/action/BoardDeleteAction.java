package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = null;
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno" + bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardDelete(bno);
		
		if(result > 0){
			System.out.println("삭제성공");
			url = "boardlist.bizpoll";
		} else {
			url = "index.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
