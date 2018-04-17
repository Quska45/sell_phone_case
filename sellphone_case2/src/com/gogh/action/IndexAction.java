package com.gogh.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.ProductDAO;
import com.gogh.DTO.ProductDTO;

//index.jsp에서 newProductlist와 bestProductlist를 띄워 줄 클래스 
public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//이동하게 될 경로를 의미한다.
		String url = "index.jsp";
		
		//DAO를 통해 디비에서 값을 가져오기 위해 DAO객체를 생성했다.
		ProductDAO pDao = ProductDAO.getInstance();
		

		//객체를 통해 실행한 메소드의 리턴 값이 리스트이기 때문에 리스트를 하나 생성했다.
		List<ProductDTO> newProductList = new ArrayList<>();
		List<ProductDTO> bestProductList = new ArrayList<>();
		
		//메소드를 실행시키고 리턴값을 리스트에 담았다.
		newProductList = pDao.newList();
		bestProductList = pDao.bestList();
		
		//리스트를 request에 담아준다.
		request.setAttribute("newProductList", newProductList);
		request.setAttribute("bestProductList", bestProductList);
		
		//ActionForward의 객체를 통해 경로와 실행 방법을 정하고 이것을 다시 view단으로 보내줄 것이다.
		ActionForward forward = new ActionForward();
		
		//경로와 실행방법을 담았다.
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}
	
}
