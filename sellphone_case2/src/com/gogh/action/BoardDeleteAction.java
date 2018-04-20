package com.gogh.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DAO.ReplyDAO;
import com.gogh.DTO.ReplyDTO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = null;
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno" + bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		
		//댓글 리스트의 사이즈를 가져와서 댓글이 있는지 없는지를 확인한다.
		List<ReplyDTO> replyList = rDao.replySelect(bno);
		int replyCount = replyList.size();
		
		if(replyCount > 0) {
			System.out.println("댓글이 있기 때문에 게시글을 삭제할 수 없습니다.");
			url="boarddetail.bizpoll";
			
		} else {
			System.out.println("댓글이 없기 때문에 게시글을 삭제 할 수 있습니다.");
			//게시글 삭제
			int result = bDao.boardDelete(bno);
			//게시글을 삭제 할 때 댓글까지 같이 삭제 하기 위한 메소드를 실행시킨다.
			rDao.replyDeleteAll(bno);
			if(result > 0){
				System.out.println("게시글 삭제성공");
				url = "boardlist.bizpoll";
			} else {
				url = "index.bizpoll";
			}
			request.setAttribute("replyCount", replyCount);
		}
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
