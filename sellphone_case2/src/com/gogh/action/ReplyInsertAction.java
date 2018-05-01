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
//게시글 상세 페이지에서 댓글을 등록하기 위한 클래스
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//작성자를 표시 해주기 위해 세션 값을 받아와서 변수에 저장한다.
		HttpSession session = request.getSession();
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		
		//가져온 값들을 용이하게 사용하기 위해 변수에 담아준다.
		String writer= request.getParameter("writer");
		String content = request.getParameter("content");
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		
		
		//값을 잘 받아오는지 확인한다.
		System.out.println("writer" + writer + "content" + content + "bno" + bno);
		
		//DAO를 통해 값이 디비에 저장 될 수 있도록   
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyInsert(rDto);
		
		if(result > 0) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록 실패");
		}
		
		//0이면 등록이 된 것이다.
		int flag=0;
		
		JSONObject jObj = new JSONObject();
		jObj.put("flag", flag); //디비에서 받아온 0 이나 1이 담기게 되는 것이다.

		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}

}
