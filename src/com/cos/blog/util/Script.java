package com.cos.blog.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Script {
	public static void back(String msg, HttpServletResponse response) { // 뒤로가기
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charser=utf-8");
			out.println("<sctipt>");
			out.println("alert('" + msg + "')");
			out.println("history.back()");
			out.println("</sctipt>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
