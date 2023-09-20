<%@page import="org.sp.springapp.domain.GalleryImg"%>
<%@page import="org.sp.springapp.domain.Gallery"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Gallery gallery = (Gallery) request.getAttribute("gallery");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=button] {
	background-color: #04AA6D;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=button]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
<%@ include file="./inc/head_link.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#bt_answer").click({
			
		});

		$("#bt_list").click(function(){
			location.href="./gallery/list.jsp";
		});
	});
</script>
</head>
<body>

	<h3>게시글 상세보기</h3>

	<div class="container">
		<form id="gallery" name="gallery">
			<input type="hidden" name="gallery_idx"
				value="<%=gallery.getGallery_idx()%>"> <input type="text"
				name="title" value="<%=gallery.getTitle()%>"> <input
				type="text" name="writer" value="<%=gallery.getWriter()%>">
			<textarea id="content" name="content" style="height: 200px"><%=gallery.getContent()%></textarea>
			<%
				for (int i = 0; i < gallery.getGalleryImgList().size(); i++) {
			%>
			<%
				GalleryImg galleryImg = gallery.getGalleryImgList().get(i);
			%>
			<input type="hidden" name="filename"
				value="<%=galleryImg.getFilename()%>">
			<p>
				<img src="/static/data/<%=galleryImg.getFilename()%>" width="150px">
			</p>
			<%
				}
			%>
			<p>
			<div class="card">
				<form>
     				<input type="hidden" id="boardID" value="${board.id}" />
					<div class="card-body">
						<textarea id="reply-content" class="form-control" rows="1"></textarea>
					</div>
					<input type="button" value="답글 달기" id="bt_answer"> 
					<input type="button" value="목록" id="bt_list">
				</form>
			</div>
		</form>
	</div>

</body>
</html>
