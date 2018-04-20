package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gogh.DAO.MemberDAO;
import com.gogh.DTO.MemberDTO;

public class TestLoginAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id+"," +pw);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.loginCheck(id, pw);
		
		int flag=0;
		
		if(mDto != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
			flag=1;
		} else {
			System.out.println("로그인 실패");
			flag=0;
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("flag", flag); //디비에서 받아온 0 이나 1이 담기게 되는 것이다.

		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}

}
