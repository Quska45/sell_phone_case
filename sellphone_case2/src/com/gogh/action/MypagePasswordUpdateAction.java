package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gogh.DAO.MemberDAO;
import com.gogh.DTO.MemberDTO;

public class MypagePasswordUpdateAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "login.jsp";
		
		String old_pw = request.getParameter("old_pw");
		String new_pw = request.getParameter("new_pw");
		String new_confirm_pw = request.getParameter("new_confirm_pw");
		String id = request.getParameter("id");
		System.out.println(old_pw + ", " + new_pw + ", " + new_confirm_pw + ", " + id);
		
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.memPwUpdate(id, new_pw);
		
		
		JSONObject jObj = new JSONObject();
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}

}
