package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gogh.DAO.MemberDAO;

public class LoginAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String mid=request.getParameter("id");
		String mpw=request.getParameter("pw");
		System.out.println("LoginAjaxAction에서 login.jsp에서 값을 가져오는지 확인하기 위한 출력문 이다. mid" + mid + "mpw" + mpw);
		
		if(mid != null && mpw != null) {
			if(mid.trim().equals("") == false) {
				MemberDAO mDao = MemberDAO.getInstance();
				int flag = mDao.memLogin(mid, mpw);
				System.out.println("LoginAjaxAction에서 flag= " + flag);
				
				JSONObject jObj = new JSONObject();
				jObj.put("flag", flag);
				jObj.put("id", mid);
				jObj.put("pw", mpw);
				
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().println(jObj);
			}
			
		}
		return null;
	}

}
