package com.gogh.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.ReplyDAO;
import com.gogh.DTO.ReplyDTO;

public class CommentListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "commentlist.jsp";
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		
		
		//상세 게시글 댓글 출력
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = rDao.replySelect(bno);
		//댓글의 writer
		request.setAttribute("replyview", list);
		
		int replyCount = list.size();
		System.out.println("댓글의 숫자" + replyCount);
		
		request.setAttribute("replycount", replyCount);
				
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
