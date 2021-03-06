<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	// 처음에는 null 값
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Juso.kr 팝업</title>
</head>
<script>

function init(){
	var url = location.href; // /blog/test/jusoPopup.jsp
	var confmKey = "devU01TX0FVVEgyMDIwMDYwMjA5NDkwMjEwOTgyMDE=";
	var resultType = "4";
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){ // null값 이면
		document.form.confmKey.value = confmKey;
		document.form. returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; //post 방식
		document.form.submit(); //form안의 데이터가 넘어감 / submit()을 하면 action이 실행
	}else{
		//opener 내장함수, 여기서 opner는 sample.jsp
		opener.jusoCallBack("<%=roadFullAddr%>");
			window.close();
		}
	}
</script>
<body onload="init()">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" /> 
		<input type="hidden" id="returnUrl" name="returnUrl" value="" />
		<!-- 자기주소 -->
		<input type="hidden" id="resultType" name="resultType" value="" />
	</form>
	<!-- body form이 나오고 init()을 실행하면, 원래는 요청한 쪽으로 response를 해주지만, 주소 변경 가능
	결과값을 다시 jusoPopup.jsp로 던져주고, 결과값은 inputYn, roadFullAddr을 받음 -->
</body>
</html>
