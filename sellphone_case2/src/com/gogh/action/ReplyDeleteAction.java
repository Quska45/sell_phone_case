package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gogh.DAO.ReplyDAO;

//게시판 댓글 삭제하는 페이지
public class ReplyDeleteAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Integer rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("rno" + rno);
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		rDao.replyDelete(rno);
		
		JSONObject jobj = new JSONObject();
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jobj);
		
		return null;
	}
	
	
}
