package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DTO.BoardDTO;

//게시글 상세 페이지에서 답변을 눌렀을 때 답변을 달 수 있는 답변등록 페이지로 이동하게 하는 클래스
public class AnswerAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "answerregister.jsp";
		
		//bbp에서 쿼리스트링으로 보내준 bno를 변수에 담아준다.
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno"+bno);
		
		//게시판 상세 페이지의 정보를 가져왔다.
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.boardDetailView(bno);
		
		//기존의 컨텐츠의 내용위에 구분할 수 있도록 텍스트를 넣어준다.
		bDto.setContents("=======게시물의 내용=======\n" + bDto.getContents());
		bDto.setFilename(bDto.getFilename());
		
		request.setAttribute("boardview", bDto);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
