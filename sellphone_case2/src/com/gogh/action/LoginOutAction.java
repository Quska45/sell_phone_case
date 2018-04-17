package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

public class LoginOutAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		//session에서 값을 가져온다.
		//만약 값이 없을 때 true이면 만들어서 가져온다. false면 그냥 null값을 반환한다.
		HttpSession session = request.getSession(false);
		int flag = 0;
		
		
		if(session != null) { //로그인이 되어 있을 경우이다.
			session.invalidate();
			flag = 1;
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("flag", flag);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}
}
