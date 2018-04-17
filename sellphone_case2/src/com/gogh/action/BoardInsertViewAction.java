package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gogh.DTO.MemberDTO;




public class BoardInsertViewAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//글을 등록하는 페이지이다.
		String url;
		
		HttpSession session = request.getSession();
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		
		if(loginUser != null) {
			url = "board/register.jsp";
			System.out.println("loginUser의 값 : " + loginUser.getMid());
			System.out.println("로그인이 되어 있기 때문에 글을 작성 할 수 있습니다.");
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
