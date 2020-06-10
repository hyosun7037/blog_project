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
		List<Board> boards = boardRepository.findAll(page);

		
		for (Board board : boards) {
			String preview = HtmlParser.getContentPreview(board.getContent());
			board.setContent(preview);
		}

		request.setAttribute("boards", boards);
		
		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		dis.forward(request, response);

	}

}
