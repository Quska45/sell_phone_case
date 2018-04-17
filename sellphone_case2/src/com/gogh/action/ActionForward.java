package com.gogh.action;

public class ActionForward {
	//이동하는 경로를 의미하는 path변수가 선언 되어 있다.
	private String path;
	//이동하는 방식(sendRedirect, forward)를 결정하는 변수다. true면 send, false면 forward
	private boolean isRedirect;
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path=path;
	}
	
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
