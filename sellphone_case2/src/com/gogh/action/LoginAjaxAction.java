package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gogh.DAO.MemberDAO;
import com.gogh.DTO.MemberDTO;

public class LoginAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String mid=request.getParameter("id");
		String mpw=request.getParameter("pw");
		System.out.println("LoginAjaxAction에서 login.jsp에서 값을 가져오는지 확인하기 위한 출력문 이다. mid" + mid + "mpw" + mpw);
		
		//회원가입 후에 세션에 로그인된 값을 올리기 위해 객체를 하나 선언했다.
		HttpSession session = request.getSession();
		
		//로그인 액션을 수행하고 값을 리턴 받기 위해 멤버 객체를 하나 선언했다.
		MemberDTO mDto = null;
		
		//header.jsp에서 받아온 아이디와 패스워드 값이 널이 아니면 일단 이프문을 탄다.
		if(mid != null && mpw != null) {
			//mid에 뭔가 값이 있다는 것이다.
			if(mid.trim().equals("") == false) {
				MemberDAO mDao = MemberDAO.getInstance();
				
				mDto = mDao.sessionLogin(mid, mpw);
				
				//mDto가 값을 담아오면 이게 실행되면서 주소와 값이 담긴다.
				if(mDto != null) {
					session.removeAttribute("loginUser");//혹시모를 남아있는 값 제거
					session.setAttribute("loginUser", mDto);//세션에 값 담기. 세션이 만료되기 전까지 세션은 mDto를 계속 가지고 있다.
				}
				
			}
			
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("id", mDto.getMid());
		jObj.put("pw", mDto.getMpw());
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}

}
