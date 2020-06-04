package com.cos.blog.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.blog.action.Action;
import com.cos.blog.model.Board;
import com.cos.blog.model.Users;
import com.cos.blog.repository.BoardRepository;
import com.cos.blog.util.Script;

public class BoardWriteProcAction implements Action{
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("principal") == null) {
			Script.getMessage("잘못된 접근입니다.", response);
			return; // 여기서 return이 있으면 코드를 타고 내려간다.
		}
		
		Users principal = (Users)session.getAttribute("principal");
		
		//1. request에 title값과 content값 null인지 공백인지 확인
		if
		(
				request.getParameter("title") == null|| // 값이 X
				request.getParameter("title").equals("")|| // 공백
				request.getParameter("content") == null ||
				request.getParameter("content").equals("")
		) {
			Script.back("다시 입력해주세요", response);
			return;
		}
		
		//2. request에 title값과 content값 받기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//3. title값과 content, principal.getId()값을 Board 오브젝트에 담기 / session연결해서 principal값을 받아와서 적기
		Board board = Board.builder()
					.userId(principal.getId())
					.title(title)
					.content(content)
					.readCount(0)
					.build();
		
		//4. BoardRespository 연결해서 save(board) 함수 호출
		BoardRepository boardRepository = BoardRepository.getInstance();
		int result = boardRepository.save(board);
		
		//5. result == 1이면 성공로직 (index.jsp로 이동)
		if(result == 1) {
			Script.href("글쓰기 성공", "index.jsp", response);
			
		//6. result != 1이면 실패로직(history.back())
		}else{
			Script.back("다시 입력해주세요", response);
		}	
		
	}
}
