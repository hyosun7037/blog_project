package com.cos.blog.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.blog.action.Action;
import com.cos.blog.model.Board;
import com.cos.blog.repository.BoardRepository;
import com.cos.blog.util.HtmlParser;

public class BoardHomeAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		//1. DB 연결해서 Board 목록 다 불러와서
		BoardRepository boardRepository = BoardRepository.getInstance();
		List<Board> boards = boardRepository.findAll(page); // 게시글 3개씩 나오도록 한 리스트 모음

		
		for (Board board : boards) {
			String preview = HtmlParser.getContentPreview(board.getContent()); 
			//preview는 HtmlParser로 파싱해준 미리보기 값
			//getContentPreview의 인수로 board의 content를 넣어준다.
			board.setContent(preview);
		}
		request.setAttribute("boards", boards);
		

		int count = boardRepository.count(); // 게시글 갯수 세기
		int lastPage = (count-1)/3; // 마지막 페이지 계산
		request.setAttribute("lastPage", lastPage);
		
		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		dis.forward(request, response);

	}

}
