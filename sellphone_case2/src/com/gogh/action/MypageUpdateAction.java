package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.MemberDAO;
import com.gogh.DTO.MemberDTO;

//개인 정보 수정 페이지에서 저장을 누르면 여기로 와서 회원정보를 업데이트 한다.
public class MypageUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "mypage.bizpoll";
		
		String mid = request.getParameter("mypageColum_input_id");
		String mname = request.getParameter("mypageColum_input_name");
		String mbirth = request.getParameter("mypageColum_input_birth");
		String mphone = request.getParameter("mypageColum_input_phone");
		String mjuso = request.getParameter("mypageColum_input_juso");
		String memail = request.getParameter("mypageColum_input_email");
		
		System.out.println(mid + ", " + mname + ", " + mbirth + ", " +mphone + ", " +mjuso + ", " +memail);
		
		MemberDTO mDto = new MemberDTO(mid, mname, mphone, mjuso, memail, mbirth);
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.memUpdate(mDto);
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
