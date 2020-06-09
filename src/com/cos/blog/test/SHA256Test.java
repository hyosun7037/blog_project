package com.cos.blog.test;

import java.security.MessageDigest;

import org.junit.Test;

public class SHA256Test {

	private final static String salt = "코스";
	// bytePlainAndSalt값 출력하기
	@Test
	public void encSha256(){ // 원문을 받음
		
		String plain = "1234";
		String result = "";

		byte[] bytePlain = plain.getBytes(); // byte화 됨, 한바이트 단위로 쪼개서 배열에 넣는 것
		for (byte b : bytePlain) {
			System.out.println(b);
		}
		byte[] byteSalt = salt.getBytes();
		for (byte s : byteSalt) {
			System.out.println(s);
		}
		byte[] bytePlainAndSalt = new byte[bytePlain.length + byteSalt.length]; // plain텍스트의 getByte + salt텍스트의 getByte																	// 길이

		System.arraycopy(bytePlain, 0, bytePlainAndSalt, 0, bytePlain.length);
		System.arraycopy(byteSalt, 0, bytePlainAndSalt, bytePlain.length, byteSalt.length);
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytePlainAndSalt);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i<byteData.length; i++) {
				sb.append(Integer.toHexString((byteData[i] & 0xFF)+256)).substring(1);
			}
			System.out.println();
			result = sb.toString();
			System.out.println(result);
		} catch (Exception e) {
			
		}
//		return result;
	}
}
