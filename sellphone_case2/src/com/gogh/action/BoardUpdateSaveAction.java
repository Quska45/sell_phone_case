package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;


public class BoardUpdateSaveAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url;
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println("title의 값은 : " + title + " content의 값은 : " + content);
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardDetailSave(bno, title, content);
		if(result > 0) {
			System.out.println("수정 성공");
			url = "boardlist.bizpoll";
		} else {
			System.out.println("수정실패");
			url = "index.bizpoll";
		}
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
