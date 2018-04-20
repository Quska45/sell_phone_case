package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;

public class BoardInsertSaveAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "boardlist.bizpoll";
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		System.out.println("title  " + title + "content  " + content + "writer  " + writer);
		
		//BoardDAO객체를 반환한다.
		BoardDAO bDao = BoardDAO.getInstance();
		
		//BoardDAO의 객체에 title, content, writer를 넣어주고 디비를 통해 값을 받아온다.
		int result = bDao.boardInsert(title, content, writer);
		
		if(result > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
			
		}
		
		//게시글을 실제로 등록 후 게시글 목록 페이지로 이동
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		
		//등록하는 것은 sendredirect로 보내줘야 한다. 안그러면 누를때 마다 다시 가입이 된다.
		forward.setRedirect(true);
		
		return forward;
	}
	
}
