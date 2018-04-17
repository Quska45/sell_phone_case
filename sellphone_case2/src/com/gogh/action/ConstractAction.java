package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConstractAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "constract.jsp";
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}
	
}
