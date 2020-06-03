package com.cos.blog.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.blog.action.Action;
//로그인 페이지로 가는 기능
public class UsersLoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB 연결해서 Board 목록 다 불러와서
		
		// 2. request에 담고
		
		// 3. 이동 home.jsp
//		Cookie[] cookies = request.getCookies(); //최초 로그인시에는 JSESSIONID만 존재, 배열을 리턴하기 때문에 배열로 타입지정
//		if(cookies != null) {
//			for (Cookie cookie : cookies) {
//				if(cookie.getName().equals("remember")) {
//					request.setAttribute("remember", cookie.getValue());
//				}
//			}
//		}
//		
		
//		String myCookie = request.getHeader("cookie");
//		System.out.println("myCookie:" +myCookie);
//		Cookie[] cookie = request.getCookies();
//		if(cookies != null) {
//			for(Cookie cookie : cookies) {
//				if(cookie.getName().equals("remember")) {
//					request.setAttribute("remember", cookie.getValue());
//				}
//			}
//		}
		
		RequestDispatcher dis = request.getRequestDispatcher("user/login.jsp");
		dis.forward(request, response);

	}

}
