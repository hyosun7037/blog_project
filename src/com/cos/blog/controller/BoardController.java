package com.cos.blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.blog.action.Action;
import com.cos.blog.action.board.BoardDeleteAction;
import com.cos.blog.action.board.BoardDetailAction;
import com.cos.blog.action.board.BoardHomeAction;
import com.cos.blog.action.board.BoardSearchAction;
import com.cos.blog.action.board.BoardUpdateAction;
import com.cos.blog.action.board.BoardUpdateProcAction;
import com.cos.blog.action.board.BoardWriteAction;
import com.cos.blog.action.board.BoardWriteProcAction;

// http://localhost:8000/blog/board
@WebServlet("/board")
public class BoardController extends HttpServlet {
	private final static String TAG = "BoardController  : ";
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost:8000/blog/user?cmd=join
		String cmd = request.getParameter("cmd");
		System.out.println(TAG+"router : "+cmd);
		Action action = router(cmd);
		action.execute(request, response);
	}
	// Controller에서 파일이 생성되고, 라우터를 타면 return 값으로 객체를 생성시켜주고, action이라는 변수에 넣어주고 execute로 실행 
	public Action router(String cmd) {
		if(cmd.equals("home")) {
			// 회원가입 페이지로 이동
			return new BoardHomeAction(); //Board의 목록
		}else if(cmd.equals("write")) {
			// 회원가입 페이지로 이동
			return new BoardWriteAction();
		}else if(cmd.equals("writeProc")) {
			// 회원가입 페이지로 이동
			return new BoardWriteProcAction(); // 글쓰기
		}
		else if(cmd.equals("detail")) {
			// 회원가입 페이지로 이동
			return new BoardDetailAction(); // 상세보기
		}else if(cmd.equals("update")) {
			// 회원가입 페이지로 이동
			return new BoardUpdateAction(); // 수정페이지
		}else if(cmd.equals("updateProc")) {
			// 회원가입 페이지로 이동
			return new BoardUpdateProcAction(); // 수정하기
		}else if(cmd.equals("delete")) {
			// 회원가입 페이지로 이동
			return new BoardDeleteAction(); // 수정페이지
		}else if(cmd.equals("search")) {
			// 회원가입 페이지로 이동
			return new BoardSearchAction(); // 검색하기
		}
		return null;
	}
}