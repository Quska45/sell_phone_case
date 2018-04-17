package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.MemberDAO;

public class IdOlapCkAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "id_olap_ck.jsp";
		
		//join.jsp에서 쿼리스트링을 통해 memberid라는 이름으로 id값을 넘겨줬기 때문에 제대로 받아왔는지 여기서 확인해본다.
		String memberid = request.getParameter("memberid");
		System.out.println("ID = " + memberid);
		
		//memIdCheck()를 사용해 중복인지 아닌지 판별하는 flag값을 가져오기 위해 객체를 생성한다.
		MemberDAO mDao = MemberDAO.getInstance();
		int flag = mDao.memIdCheck(memberid);
		
		//flag값을 request에 담아서 보내준다. 중복확인이 뜨면 여기서 보낸 값을 가지고 중복인지 아닌지 알 수 있게 된다.
		request.setAttribute("flag", flag);
		
		
		//해오던 대로 url과 방식을 정해서 보내준다. 
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
