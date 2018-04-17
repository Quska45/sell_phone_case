package com.gogh.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface Action {
	//Action을 상속받은 변수는 ActionForward타입의 excute를 리턴하는 excute함수를 반드시 구현 해야 한다.
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
