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

public class AnswerInsertSaveAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String url = "boardlist2.bizpoll";
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		
		//게시글 등록 페이지 에서 입력한 내용들을 변수에 저장했다.
		Integer bno = Integer.parseInt(multi.getParameter("answerregister_bno"));
		String title = multi.getParameter("bbp_title");
		String content = multi.getParameter("bbp_content");
		String writer = multi.getParameter("bbp_writer");
		String file = multi.getParameter("file_name");
		String filename = " ";
		int filesize = 0;
		
		BoardDAO bbDao = BoardDAO.getInstance();
		//상위 상세 게시글의 내용
		BoardDTO bbDto = bbDao.boardDetailView(bno);
		
		//ref : 기존 게시글 bno
		//re_step : 기존 게시글의 re_step + 1
		//re_level : 기존 답변 단계 re_level + 1 
		int ref = bbDto.getRef();
		int re_step = bbDto.getRe_step() + 1;
		int re_level = bbDto.getRe_level() + 1;
		
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
		
		//답글 순서 조정(re_step)
		bbDao.updateStep(ref, re_step);
		
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize, ref, re_step, re_level);
		bDao.answerInsert(bDto);
		
		
		
		System.out.println("bno" + bno + "title" + title + " content" + content + "writer" + writer);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
