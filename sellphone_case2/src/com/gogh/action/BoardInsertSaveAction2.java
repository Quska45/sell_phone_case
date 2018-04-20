package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;

public class BoardInsertSaveAction2 implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//게시글이 등록이 성공하면 게시글 상세 페이지로 가도록 한다.
		String url = "boardlist2.bizpoll";
		
		//게시글 등록 페이지 에서 입력한 내용들을 변수에 저장했다.
		String title = request.getParameter("bbp_title");
		String content = request.getParameter("bbp_content");
		String writer = request.getParameter("bbp_writer");
		
		System.out.println("title: " + title + " content: " + content + " writer: " + writer);
		
		
		
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.boardInsert(title, content, writer);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
