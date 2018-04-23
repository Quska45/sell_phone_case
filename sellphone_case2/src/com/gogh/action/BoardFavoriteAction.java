package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gogh.DAO.BoardDAO;
import com.gogh.DTO.BoardDTO;

public class BoardFavoriteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//게시글 상세 페이지에서 보내준 bno를 변수에 담았다.
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno " + bno);
		
		//세션을 활용한 조회수 증가 방지
		//세션 객체를 하나 생성하고 이것을 이용해서(세션 좋아요가 클릭된 시간을 저장하고 다시 좋아요가 눌렸을 때의 시간과 비교하는 방식)
		HttpSession session = request.getSession();
		
		BoardDAO bDao = BoardDAO.getInstance();
		int favoritecount = bDao.boardFavorite(bno, session);
		int goodCnt = bDao.boardSelectOne(bno).getGoodcnt();
		
		
		
		JSONObject jObj = new JSONObject();
		jObj.put("boardselectone", goodCnt); 
		jObj.put("favoritecount", favoritecount); 
		
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}

}
