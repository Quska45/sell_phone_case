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
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno " + bno);
		
		//세션을 활용한 조회수 증가 방지
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
