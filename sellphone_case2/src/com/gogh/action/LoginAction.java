package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//로그인화면을 띄워주는 용도이다.
		
		String url = "login.jsp";
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
