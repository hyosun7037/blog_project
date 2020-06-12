package com.cos.blog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cos.blog.db.DBConn;
import com.cos.blog.dto.BoardResponseDto;
import com.cos.blog.dto.DetailResponseDto;
import com.cos.blog.model.Board;
import com.cos.blog.model.Users;

public class BoardRepository {
	private static final String TAG = "BoardRepository : "; // TAG 생성 (오류 발견시 용이)
	private static BoardRepository instance = new BoardRepository();

	private BoardRepository() {
	}

	public static BoardRepository getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 글쓰기
	public int save(Board board) { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "INSERT INTO board(id, userid, title, content, createDate) "
				+ "VALUES(BOARD_SEQ.nextval,?,?,?,sysdate)";
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			
			pstmt.setInt(1, board.getUserId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
//			pstmt.setInt(3, board.getReadCount());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "save : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return -1; // 실패시
	}

	
	//조회수 증가
	public int updateReadCount(int id) { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "UPDATE board SET readCount = readCount + 1 WHERE id = ?";
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "updateReadCount : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1; // 실패시
	}
	
	
	// 회원정보 수정
	public int update(Board board) { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "UPDATE board SET title = ?, content= ? WHERE id = ?";
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getId());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "Update : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return -1; // 실패시
	}

	// 회원정보 삭제
	public int deleteById(int id) { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "DELETE FROM board WHERE id = ?";
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "Delete : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return -1; // 실패시
	}

	
	
	
	public int count(String keyword) { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "SELECT count(*) FROM board WHERE title like ? OR content like ? ";
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			// 물음표 완성하기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "keyword : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return -1; // 실패시
	}
	
	
	
	
	
	//특정 값까지만 넘어가는 페이징
	public int count() { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "SELECT count(*) FROM board";
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "count : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return -1; // 실패시
	}
	
	
	/// 검색
	public List<Board> findAll(int page, String keyword) { // object 받기(안에 내용 다 받아야 하니까)
		StringBuilder sb = new StringBuilder(); // 스트링 배열로 받는다.String으로 받으면 너무 길어지기 때문에 
		sb.append("SELECT /*+ INDEX_DESC(BOARD SYS_C008316)*/id, ");
		sb.append("userId, title, content, readCount, createDate ");
		sb.append("FROM board ");
		sb.append("WHERE title like ? OR content like ? "); // 여기서는 % 안먹음
		sb.append("OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY");
		System.out.println(sb.toString()); // 테스트용
		
		final String SQL = sb.toString();
		List<Board> boards = new ArrayList<>();
		
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%"+keyword+"%"); // like의 %넣기
			pstmt.setString(2, "%"+keyword+"%"); // like의 %넣기
			pstmt.setInt(3, page*3);
			// while 돌려서 rs -> java오브젝트에 집어넣기
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board(
						rs.getInt("id"),
						rs.getInt("userId"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getInt("readCount"),
						rs.getTimestamp("createDate")
						);
				boards.add(board);
						
			}
			return boards;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "findAll(page, keyword) : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}
	
	
	

	
	///// 여기 페이지 나누는 쿼리 추가
	public List<Board> findAll(int page) { // 가변 배열이니까 List<>사용, object 받기(안에 내용 다 받아야 하니까)
		StringBuilder sb = new StringBuilder(); // 스트링 배열로 받는다.String으로 받으면 너무 길어지기 때문에 
		sb.append("SELECT /*+ INDEX_DESC(BOARD SYS_C008316)*/id, "); // append로 값을 넣어준다. 
		sb.append("userId, title, content, readCount, createDate ");
		sb.append("FROM board ");
		sb.append("OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY"); // 3개만 출력될 수 있도록 지정
		
		final String SQL = sb.toString(); // String형으로 형변환
		List<Board> boards = new ArrayList<>();
		
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, page*3);
			// while 돌려서 rs -> java오브젝트에 집어넣기
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board(
						rs.getInt("id"),
						rs.getInt("userId"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getInt("readCount"),
						rs.getTimestamp("createDate")
						);
				boards.add(board); // 읽은 값을 boards에 넣어준다.
						
			}
			return boards;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "findAll(page) : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}
	
	
	
	// 회원정보 다 찾기
	public List<Board> findAll() { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "SELECT * FROM board ORDER BY id DESC";
		List<Board> boards = new ArrayList<>();
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// while 돌려서 rs -> java오브젝트에 집어넣기
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board(
						rs.getInt("id"),
						rs.getInt("userId"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getInt("readCount"),
						rs.getTimestamp("createDate")
						);
				boards.add(board);
						
			}
			return boards;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "findAll : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}

	// 회원정보 한 건 찾기
	public BoardResponseDto findById(int id) { // object 받기(안에 내용 다 받아야 하니까)
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT b.id, b.userId, b.title, b.content, b.readCount, b.createDate, u.username "); // 주의할 점 : 집어 넣을 때 꼭 한칸 띄우기
		sb.append("FROM board b INNER JOIN users u ");
		sb.append("ON b.userId = u.id ");
		sb.append("WHERE b.id = ?");
		final String SQL = sb.toString();
		BoardResponseDto boardDto = null; 

		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setInt(1, id);
			// if 돌려서 rs -> java오브젝트에 집어넣기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boardDto = new BoardResponseDto(); // 하나로 묶어줌, 그래야지 한번 응답하고 끝냄
				Board board = Board.builder()
						.id(rs.getInt(1))
						.userId(rs.getInt(2))
						.title(rs.getString(3))
						.content(rs.getString(4))
						.readCount(rs.getInt(5))
						.createDate(rs.getTimestamp(6))
						.build();
			boardDto.setBoard(board);			
			boardDto.setUsername(rs.getString(7));
			}
			return boardDto;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "findById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}
	
}
