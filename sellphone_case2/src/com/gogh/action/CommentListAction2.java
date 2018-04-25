package com.gogh.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gogh.DAO.ReplyDAO;
import com.gogh.DTO.ReplyDTO;

public class CommentListAction2 implements Action{
//댓글등록을 할 떄 ajax방식으로 댓글 창만을 다시 띄워주기 위한 클래스
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//댓글 등록시 댓글을 띄워주는 jsp로 이동한다.
		String url = "commentlist2.jsp";
		
		//게시판상세페이지에서 보낸 bno를 변수에 담았다.
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);
		
		//댓글의 리스트를 가져오는 DAO메소드를 통해 댓글 리스트를 가져와 변수에 담았다.
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> replylist = rDao.replySelect(bno);
	
		//댓글리스트가 담긴 list를 replyview라는 이름으로 상세게시글 jsp로 보내줬
		request.setAttribute("replyview", replylist);
		
		int listCount = replylist.size();
		request.setAttribute("replycount", listCount);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
