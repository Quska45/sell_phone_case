package com.gogh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gogh.action.Action;
import com.gogh.action.ActionForward;
import com.gogh.action.BoardDeleteAction;
import com.gogh.action.BoardDetailAction;
import com.gogh.action.BoardDetailAction2;
import com.gogh.action.BoardInsertSaveAction;
import com.gogh.action.BoardInsertViewAction;
import com.gogh.action.BoardInsertViewAction2;
import com.gogh.action.BoardListAction;
import com.gogh.action.BoardListAction2;
import com.gogh.action.BoardSearchAction;
import com.gogh.action.BoardUpdateSaveAction;
import com.gogh.action.BoardUpdateViewAction;
import com.gogh.action.ConstractAction;
import com.gogh.action.IdOlapCkAction;
import com.gogh.action.IndexAction;
import com.gogh.action.JoinAction;
import com.gogh.action.LoginAction;
import com.gogh.action.LoginAjaxAction;
import com.gogh.action.LoginCkAction;
import com.gogh.action.LoginOutAction;
import com.gogh.action.MemAjaxAction;
import com.gogh.action.MemberInsertAction;
import com.gogh.action.ReplyDeleteAction;
import com.gogh.action.ReplyInsertAction;


/**
 * Servlet implementation class BzipollFrontController
 */
@WebServlet("/BzipollFrontController")
public class BzipollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BzipollFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Action action = null;
		
		// 페이지 이동방법 결정(Forward, sendRedirect)
		ActionForward forward = null;
		
		String uri = request.getRequestURI(); // 주소를 가져온다. /sellphone_case/index.bizpoll 
		String ctx = request.getContextPath(); // Context만 가져온다.   /sellphone_case만 가져온다.
		String command = uri.substring(ctx.length()); // /index.bizpoll을 가져온다.
		
		System.out.println("uri ====> "+ uri );
		System.out.println("ctx ====> "+ ctx );
		System.out.println("command ====> "+ command); 
		//index.jsp를 실행시키는 부분.
		if(command.equals("/index.bizpoll")) {
			System.out.println("컨트롤러의 if - index.bizpoll이 정상적으로 실행됩니다.");
			action = new IndexAction();
			forward = action.excute(request, response);
		}
		//login.jsp를 실행시키는 부분
		if(command.equals("/login.bizpoll")) {
			System.out.println("컨트롤러의 if - login.bizpoll이 정상적으로 실행됩니다.");
			action = new LoginAction();
			forward = action.excute(request, response);
		}
		//contract.jsp를 실행시키는 부분
		else if(command.equals("/constract.bizpoll")) {
			System.out.println("컨트롤러의 if - constract.bizpoll이 정상적으로 실행됩니다.");
			action = new ConstractAction();
			forward = action.excute(request, response);
		}
		//join.jsp를 실행시키는 부분
		else if(command.equals("/join.bizpoll")) {
			System.out.println("컨트롤러의 if - join.bizpoll이 정상적으로 실행됩니다.");
			action = new JoinAction();
			forward = action.excute(request, response);
		}
		//id_olap_ck.jsp를 실행시키는 부분
		else if(command.equals("/id_olap_ck.bizpoll")) {
			System.out.println("컨트롤러의 if - id_olap_ck.bizpoll이 정상적으로 실행됩니다.");
			action = new IdOlapCkAction();
			forward = action.excute(request, response);
		}
		//MemberInsertAction클래스를 실행시키는 부분.
		else if(command.equals("/memberinsert.bizpoll")) {
			System.out.println("컨트롤러의 if - memberinsert.bizpoll이 정상적으로 실행됩니다.");
  			action = new MemberInsertAction();
  			forward = action.excute(request, response);
  		}
		
		//join.jsp에서 ajax를 통ㄴ해서 유효성체크를 할 때 여기로 오게 된다.
		else if(command.equals("/memajax.bizpoll")) {
			System.out.println("컨트롤러의 if - memajax.bizpoll이 정상적으로 실행됩니다.");
  			action = new MemAjaxAction();
  			forward = action.excute(request, response);
  		}
		
		//
		else if(command.equals("/loginck.bizpoll")) {
			System.out.println("컨트롤러의 if - loginck.bizpoll이 정상적으로 실행됩니다.");
  			action = new LoginCkAction();
  			forward = action.excute(request, response);
  		}
		
		else if(command.equals("/loginajax.bizpoll")) {
			System.out.println("컨트롤러의 if - loginajax.bizpoll이 정상적으로 실행됩니다.");
  			action = new LoginAjaxAction();
  			forward = action.excute(request, response);
  		}
		
		//로그
		else if(command.equals("/logout.bizpoll")) {
			System.out.println("컨트롤러의 if - logout.bizpoll이 정상적으로 실행됩니다.");
			System.out.println("forward"+forward);
  			action = new LoginOutAction();
  			forward = action.excute(request, response);
  		}
		
		//게시판으로 이동하게 해준다.
		else if(command.equals("/boardlist.bizpoll")) {
			System.out.println("컨트롤러의 if - boardlist.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardListAction();
  			forward = action.excute(request, response);
  		}
		
		else if(command.equals("/boardlist2.bizpoll")) {
			System.out.println("컨트롤러의 if - boardlist2.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardListAction2();
  			forward = action.excute(request, response);
  		}
		
		//게시판에서 글쓰기 버튼을 누르면 글쓰는 창으로 이동한다.
		else if(command.equals("/boardinsertview.bizpoll")) {
			System.out.println("컨트롤러의 if - boardinsertview.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardInsertViewAction();
  			forward = action.excute(request, response);
  		}
		else if(command.equals("/boardinsertview2.bizpoll")) {
			System.out.println("컨트롤러의 if - boardinsertview2.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardInsertViewAction2();
  			forward = action.excute(request, response);
  		}
		
		
		//게시판 글쓰기 페이지에서 submit을 누르면 디비에 값을 저장 시킴
		else if(command.equals("/boardinsertsave.bizpoll")) {
			System.out.println("컨트롤러의 if - boardinsertsave.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardInsertSaveAction();
  			forward = action.excute(request, response);
  		}
		
		else if(command.equals("/boarddetail.bizpoll")) {
			System.out.println("컨트롤러의 if - boarddetail.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardDetailAction();
  			forward = action.excute(request, response);
  		}
		else if(command.equals("/boarddetail2.bizpoll")) {
			System.out.println("컨트롤러의 if - boarddetail2.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardDetailAction2();
  			forward = action.excute(request, response);
  		}
		
		else if(command.equals("/boardupdateview.bizpoll")) {
			System.out.println("컨트롤러의 if - boardupdateview.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardUpdateViewAction();
  			forward = action.excute(request, response);
  		}
		
		else if(command.equals("/boardupdatesave.bizpoll")) {
			System.out.println("컨트롤러의 if - boardupdatesave.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardUpdateSaveAction();
  			forward = action.excute(request, response);
  		}
		
		else if(command.equals("/boarddelete.bizpoll")) {
			System.out.println("컨트롤러의 if - boarddelete.bizpoll이 정상적으로 실행됩니다.");
  			action = new BoardDeleteAction();
  			forward = action.excute(request, response);
  		}
		
		else if(command.equals("/replyinsert.bizpoll")) {
			System.out.println("컨트롤러의 if - replyinsert.bizpoll이 정상적으로 실행됩니다.");
  			action = new ReplyInsertAction();
  			forward = action.excute(request, response);
  		}

		else if(command.equals("/replydelete.bizpoll")) {
			System.out.println("컨트롤러의 if - replydelete.bizpoll이 정상적으로 실행됩니다.");
			action = new ReplyDeleteAction();
			forward = action.excute(request, response);
		}
		
		else if(command.equals("/boardsearch.bizpoll")) {
			System.out.println("컨트롤러의 if - boardsearch.bizpoll이 정상적으로 실행됩니다.");
			action = new BoardSearchAction();
			forward = action.excute(request, response);
		}
		
		//공통 분기 작업. *.bizpoll들은 이 if문을 통해 어떤 방식으로 전달 될 지 확실해진다.
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println("변수 forward는 true임으로 sendRedirect로 보내집니다.");
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println("변수 forward는 false임으로 forward로 보내집니다.");
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}

}
