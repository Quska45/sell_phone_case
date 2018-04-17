package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String content = request.getParameter("comment_input_write");
		Integer bno = Integer.parseInt(request.getParameter("comment_input_bno"));
		
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
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
