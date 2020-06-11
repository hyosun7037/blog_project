package com.cos.blog.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class HtmlParser {
	
	// 유투브 파싱
	public static String getContentYoutude(String content) {
		Document doc = Jsoup.parse(content); // html 구조를 만들어준다.Document 타입이 html
		System.out.println("doc =" + doc);
		Elements aTags = doc.select("a"); //배열로 구성
		//System.out.println("aTags.get(0) =" + aTags.get(0)); I
		// https://youtu.be/TgOu00Mf3kI
		// https://www.youtube.com/watch?v=yqtCGojXEpM

		for(Element aTag : aTags) { //aTag = aTags.get(0)
			String href = aTag.attr("href"); //a태그 안에 있는 속성값을 저장
			System.out.println(href);
			String youtubeId = null;
			if(href != null) {
				if(href.contains("youtu.be")) {
					String[] hrefArr = href.split("be/"); //Split은 무조건 배열, "be/"가 사라지고 나머지는 배열로
					youtubeId = hrefArr[1];
					System.out.println(youtubeId);
				}else if(href.contains("youtube.com")) {
					String[] hrefArr = href.split("v=");
					youtubeId = hrefArr[1];
					System.out.println(youtubeId);
				}
				
				System.out.println("JSOUP 파싱 : Youtube : " + youtubeId);
				String video = "<br /><iframe src = 'http://www.youtube.com/embed/"+youtubeId+" 'width='700px' height='400px' frameborder='0' allowfullscreen></iframe>";
//				String video = "<br /><iframe width=\"657\" height=\"370\" src=\"https://www.youtube.com/embed/"+ youtubeId +"\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>";
				System.out.println("video :" +video);
				aTag.after(video); // aTag 뒤에다가 매개변수 video를 넣어줌
				System.out.println(doc);
			}
		}
		return doc.toString();
	}
	
	// 게시글 미리보기 
	public static String getContentPreview(String content) { 
		
		Document doc = Jsoup.parse(content); // 들어오는 content를 Jsop의 내장함수 parse를 통해서 파싱해줌
		Elements pTags = doc.select("p");
		
		for (Element pTag : pTags) {
			String text = pTag.text(); //p태그에 들어가 있는 텍스트를 넣어준다.
			if(text.length() > 0) {
				if(text.length() < 11) {
					return pTag.text();
				}else {
					return pTag.text().substring(0, 10)+"...";
				}	
			}
		}
		return "내용 없음...";
	}
}


