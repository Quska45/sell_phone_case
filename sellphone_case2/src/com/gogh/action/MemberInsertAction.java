package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.MemberDAO;
import com.gogh.DTO.MemberDTO;

public class MemberInsertAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "index.bizpoll";
		
		//join.jsp에서 입력된 회원가입정보를 받아서 변수에 저장 시켜준다. id가 아닌 name값이 넘어오는 것이다.
		String id = request.getParameter("id");
		String pw1 = request.getParameter("pswd1");
		String pw2 = request.getParameter("pswd2");
		String name = request.getParameter("nm");
		String email = request.getParameter("email");
		String emailAddress = request.getParameter("emailAddress");
		String fullEmail = email + "@" + emailAddress;
		
		System.out.println(id + ", " + pw1 + ", " + pw2 + ", " + name + ", " + fullEmail);
		
		MemberDTO mDto = new MemberDTO(id, pw1, name, fullEmail);
		
		//모델단으로 정보를 보내기 위해 객체를 생성한다.
		MemberDAO mDao = MemberDAO.getInstance();
		//객체에 값을 담아서 메소드를 실행시키고 변수에 담아준다..
		int result = mDao.memInsert(mDto);
		
		
		if(result > 0) {
			//성공하면 index페이지로 가게 해준다.
			url = "index.bizpoll";
		} else {
			//실패하면 다시 join페이지로 돌아가게 한다.
			url = "join.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
