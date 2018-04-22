package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gogh.DAO.BoardDAO;

public class BoardDeleteAction2 implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//bbp에서 삭제 버튼을 누를 때 가져온 bno의 값을 변수에 저장 시켰다.
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno" + bno);
		
		//게시글을 삭제하는 DAO메소드를 사용하기 위해서 객체를 생성하고 사용했다.
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardDelete(bno);
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}

}
