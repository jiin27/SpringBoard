<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background:yellow">
<h1>
	<%
		RuntimeException e=(RuntimeException)request.getAttribute("e");
		out.print(e.getMessage()); //runtimeException에 심어졌던 메시지를 꺼내는 메서드
	%>
</h1>
</body>
</html>