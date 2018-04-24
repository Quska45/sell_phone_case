package com.gogh.action;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.common.Constants;

public class DownloadAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno " + bno);
		
		//다운로드 할 파일 DB에서 가져옴
		BoardDAO bDao = BoardDAO.getInstance();
		String filename = bDao.getFileName(bno);

		//다운로드를 하면 downcnt가 하나 추가 도니다.
		bDao.boardDowncnt(bno);
		

		System.out.println("다운로드 할 filname " + filename);
		
		//다운로드 된 파일의 경로를 지정한다. 기존에 파일이 저장된 경로에 파일의 이름을 붙여서 내가 다운받을 파일을 이름 붙여준다.
		String path = Constants.UPLOAD_PATH + filename;
		//바이트 배열 생성. 이걸 이용해서 단위시간 별로 받아지는 파일의 양을 정해 줄 것이다.
		byte b[] = new byte[4096];
		//서버에 저장된 파일을 읽기 위한 스트림 생성. 즉 객체안에 파일이 담기게 되는 것이다.
		FileInputStream fis = new FileInputStream(path);
		
		//mimType - 파일 종류 중에 하나이다. 이걸로 보낼 수 있는 파일의 종류는 20여가지이다. 왠만한건 다되는 것이다.
		String mimeType = request.getServletContext().getMimeType(path);
		if(mimeType == null) {
			mimeType = "application/octet-stream; charset=utf-8";
		}
		
		//파일 이름에 한글이 포함된 경우
		//new String(바이트배열, 변환할 인코딩) 8859_1 서유럽언어
		//header에 특수문자 사용 못함, 서유럽언어로 변환
		filename = new String(filename.getBytes("utf-8"), "8859_1");
		
		
		
		
		//http header
		//파일을 헤더로 가져오기 때문에 헤더가 살짝 수정되어야 한다.
		response.setHeader("content-Disposition", "attachment;filename=" + filename);
		
		//http body
		//OutputStream 생성(서버에서 클라이언트에 쓰기)
		//본격적으로 파일을 받아오기 위해서 아웃스트림 객체를 생성한다.
		ServletOutputStream out = response.getOutputStream();
		
		int numRead;
		while(true) {
			//데이터 읽기(4096씩 끊어서 일는다.)
			//fis에 있는 값을 미리 지정해둔 바이트 크기만큼 읽는다.
			numRead = fis.read(b, 0, b.length);
			//더 이상 읽을 파일이 없게 되면 끝난다.
			if(numRead == -1) break;
			//읽어온 파일을 아웃스트림 객체에 b만큼 써주는 것이다. 
			out.write(b, 0, numRead);
		}
		
		//파일 처리 관련 리소스 정리
		//꼭 해줘야 하는 것이다. 파일을 다운 받을 때 잔류된 데이터 들을 닫아주는 것이다. 
		//input, output객체는 작업이 끝나고 꼭 닫아줘야 한다.
		out.flush();
		out.close();
		fis.close();
		
		//다운로드 횟수 증가 처리
		
		
		
		//게시글 파일 다운로드
		//클라이언트				서버
		//			<======     파일
		//						InputStream(파일 읽기)
		//						OutputStream(파일 쓰기)
		
		
		/*ActionForward forward = new ActionForward();
	
		forward.setPath(path);
		forward.setRedirect(false);*/
		
		return null;
	}

}
