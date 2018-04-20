package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gogh.DAO.ReplyDAO;
import com.gogh.DTO.MemberDTO;
import com.gogh.DTO.ReplyDTO;

public class ReplyInsertAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession();
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		
		String writer= loginUser.getMname();
		String content = request.getParameter("content");
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		
		String url="boarddetail.bizpoll?bno="+bno;
		System.out.println("writer" + writer + "content" + content + "bno" + bno);
		
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyInsert(rDto);
		
		if(result > 0) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록 실패");
		}
		
		request.setAttribute("bno", bno);
		
		//0이면 등록이 된 것이다.
		int flag=0;
		
		JSONObject jObj = new JSONObject();
		jObj.put("flag", flag); //디비에서 받아온 0 이나 1이 담기게 되는 것이다.

		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}

}
