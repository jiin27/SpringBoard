<%@page import="org.sp.springapp.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=admin.getName() %>님 로그인 중</h3>
	<ul>
		<li><a href="/admin/gallery/list">게시판 관리</a></li>
		<li>예약 관리</li>
		<li>회원 관리</li>
		<li>게시판 관리</li>
	</ul>
</body>
</html>