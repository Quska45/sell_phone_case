package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gogh.DTO.MemberDTO;

public class BoardInsertViewAction2 implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "bulletin_board_register.jsp";
		
		//아이디 세션 값을 가져와서 막약 로그인 되어 있지 않다면 글을 쓸 수 없도록 할 것이다. 
		HttpSession session = request.getSession();
		MemberDTO loginUser = (MemberDTO)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			url = "bulletin_board_register.jsp";
			System.out.println("로그인이 되어 있기 때문에 글을 작성할 수 있습니다.");
		} else {
			url = "index.bizpoll";
			System.out.println("로그인이 되어 있지 않기 때문에 글을 작성 할 수 없습니다.");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}
	
}
