<%@page import="org.sp.springapp.domain.Admin"%>
<%@page import="org.sp.springapp.domain.GalleryImg"%>
<%@page import="org.sp.springapp.domain.Gallery"%>
<%@page import="java.util.List"%>
<%@page import="org.sp.springapp.util.Pager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Pager pager = (Pager)request.getAttribute("pager");
	List<Gallery> galleryList = (List)request.getAttribute("galleryList");
	Admin admin=(Admin)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
a{
	text-decoration: none;
}
</style>
<%@ include file="../inc/head_link.jsp" %>
<script type="text/javascript">
$(function(){
	$("#bt_main").click(function(){
		location.href="/admin/main";
	});
	
})
</script>
</head>
<body>

	<h2>Java 개발자 자유게시판 관리자모드</h2>
	<p>관리자: <%=admin.getName() %>님 어서오세요.</p>

	<table>
		<tr>
			<th>No</th>
			<th>이미지</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<%int num=pager.getNum(); %>
		<%int curPos = pager.getCurPos(); //페이지당 List의 시작 index %>
		<%for(int i=1; i<=pager.getPageSize(); i++){ %>
		<%if(num<1)break; %>
		<% Gallery gallery = galleryList.get(curPos++); %>
		<% GalleryImg galleryImg = gallery.getGalleryImgList().get(0); %>
		<tr>
			<td><%=num-- %></td>
			<td><img src="/static/data/<%=galleryImg.getFilename()%>" width="45px"></td>
			<td><a href="/gallery/content?gallery_idx=<%=gallery.getGallery_idx()%>"><%=gallery.getTitle() %></a></td>
			<td><%=gallery.getWriter() %></td>
			<td><%=gallery.getRegdate() %></td>
			<td><%=gallery.getHit() %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="6">
				<%if(pager.getFirstPage()-1 < 1){ %>
					<a href="javascript:alert('이전 페이지가 없습니다');">◀</a>
				<%}else{ %>
					<a href="/gallery/list?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
				<%} %>	
				
				<%for(int i=pager.getFirstPage(); i<=pager.getLastPage(); i++){ %>
				<%if(i > pager.getTotalPage())break; %>
					<a href="/gallery/list?currentPage=<%=i%>">[<%=i %>]</a>
				<%} %>

				<%if(pager.getLastPage()+1 > pager.getTotalPage()){ %>
					<a href="javascript:alert('다음 페이지가 없습니다');">▶</a>
				<%}else{ %>
					<a href="/gallery/list?currentPage=<%=pager.getLastPage()+1%>">▶</a>
				<%} %>
				
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<button id="bt_main">관리자 메인으로</button>
			</td>
		</tr>
		
	</table>

</body>
</html>
