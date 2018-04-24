package com.gogh.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.DAO.BoardDAO;
import com.gogh.DTO.BoardDTO;
import com.gogh.common.Constants;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardInsertSaveAction2 implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//게시글이 등록이 성공하면 게시글 상세 페이지로 가도록 한다.
		String url = "boardlist2.bizpoll";
		
		//request를 확장시킨 MultipartRequest 생성
		//request를 흡수하는 개념이기 때문에 인자로 받아준다.
		//new MultipartRequest(request, 파일업로드 디렉토리, 업로드 용량, 인코딩, 파일이름 중복정책)
		//객체를 생성하면서 저장될 경로와 크기 등 여러가지를 지정해 준다.
		//파일을 가져오는 역할을 한다.
		//저기 마지막에 있는 중복 정책을 정해준 객체는 만약 중복되는 이름이 있다면 뒤에 숫자를 붙여주는 것이다.
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		
		//게시글 등록 페이지 에서 입력한 내용들을 변수에 저장했다.
		String title = multi.getParameter("bbp_title");
		String content = multi.getParameter("bbp_content");
		String writer = multi.getParameter("bbp_writer");
		String file = multi.getParameter("add_file");
		String filename = " ";
		int filesize = 0;
		
		System.out.println("title: " + title + " content: " + content + " writer: " + writer + "file" + file);
		
		//내가 지정한 경로에 내가 지정한 이름의 폴더를 만드는 객체
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		//파일을 저장할 디렉토리가 존재하지 않으면 디렉토리 생성
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		try {
			//첨부파일의 집합(배열로 가져옴)
			Enumeration files = multi.getFileNames();
			
			//rs.next와 비슷한 개념이다. 파일들이 저장되어 있다면 전부 들릴 때 까지 반복된다.
			while(files.hasMoreElements()) {
				//첨부파일의 이름
				//파일이름을 세팅하는 것이다.
				String file1 = (String)files.nextElement();
				filename = multi.getFilesystemName(file1);
				//실질적으로 파일을 업로드 한다.
				File f1 = multi.getFile(file1);
				
				if(f1 != null) {
					filesize = (int)f1.length();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		
		//filename이 null 또는 ""일 때 처리
		if(filename == null || filename.trim().equals("")) {
			filename="-";
		}
		
		
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
		bDao.boardInsert(bDto);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
