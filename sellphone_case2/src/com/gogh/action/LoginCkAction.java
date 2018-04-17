package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gogh.DAO.MemberDAO;
import com.gogh.DTO.MemberDTO;

public class LoginCkAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//session에 사용되는 액션이다.
		HttpSession session = request.getSession();
		String url=null;
		
		String mid = request.getParameter("login_id"); //input의 name을 입력해서 가져와줘야 한다.
		String mpw = request.getParameter("login_pw");
		System.out.println("LoginCkAction에서 login.jsp의 값을 제대로 가져오는지 확인하기 위한 출력문 입니다. id: "+mid + ", pw : " + mpw);
		

		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.sessionLogin(mid, mpw);
		System.out.println("LoginCkAction이다. Mid " + mDto.getMid() + "mpw : " + mDto.getMpw() + "mname : " + mDto.getMname());
		
		
		//mDto가 값을 담아오면 이게 실행되면서 주소와 값이 담긴다.
		if(mDto != null) {
			session.removeAttribute("loginUser");//혹시모를 남아있는 값 제거
			session.setAttribute("loginUser", mDto);//세션에 값 담기. 세션이 만료되기 전까지 세션은 mDto를 계속 가지고 있다.
			url = "index.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
		
	}
	
}
