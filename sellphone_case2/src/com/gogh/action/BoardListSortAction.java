package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DTO.CriteriaDTO;

//게시글 리스트에서 조회순, 최신, 작성자 등으로 정렬하고자 할 때 오는 액션
public class BoardListSortAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String flag = request.getParameter("flag");
		System.out.println(flag);
		
		//리스트 정렬시에 페이지를 다시 띄워야 하기 때문에 cridto가 필요하다.
		CriteriaDTO criDto = new CriteriaDTO();
		
		
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.boardSort(criDto);
		
		return null;
	}

}
