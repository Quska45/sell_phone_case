package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gogh.DAO.MemberDAO;

public class MemAjaxAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//여기서는 flag값이 어떻게 되느냐에 따라 이동경로가 정해지기 때문에 url이 필요하지 않다.
		//String url = "index.jsp";
		
		//join.jsp에서 받아온 아이디의 값이 mid라는 변수에 저장되게 된다.
		String mid = request.getParameter("id");
		System.out.println("ID" + mid);
		
		//mid가 공백이 아니면 시작된다.
		if(mid != null) {
			//공백을 없애준다.
			if(mid.trim().equals("") == false) {
				MemberDAO mDao = MemberDAO.getInstance();
				int flag = mDao.memIdCheck(mid);
				System.out.println("flag= " + flag);
				
				//json을 사용하기 위해 객체를 하나 생성했다.
				JSONObject jObj = new JSONObject();
				jObj.put("flag", flag); //디비에서 받아온 0 이나 1이 담기게 되는 것이다.
				jObj.put("id", mid); //jsp에서 받아온 것을 mid변수에 담고 이것을 jObj에 담아준다.
				
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().println(jObj);
			}
		}
		
		//ajax는 비동기식이기 때문에 데이터를 전송하면 안된다. 즉 Actionforward방식을 이용하지 않는 것이다. 따라서 null을 전송해 아무것도 전송되지 않게 한다.
		return null;
	}
	
}
