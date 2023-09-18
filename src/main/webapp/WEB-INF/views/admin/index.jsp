<%@page import="org.sp.springapp.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자모드: <%=admin.getName() %></title>
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
</head>
<script>
function openTab(evt, TabMenu) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(TabMenu).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
<body>
	<h2>Ticket to the Moon 관리자 모드</h2>
	<p><%=admin.getName() %>님 로그인</p>

	<div class="tab">
	  <button class="tablinks" onclick="openTab(event, 'board')">게시판 관리</button>
	  <button class="tablinks" onclick="openTab(event, 'booking')">예약 관리</button>
	  <button class="tablinks" onclick="openTab(event, 'adminList')">관리자 명단</button>
	</div>

	<div id="board" class="tabcontent">

	</div>

	<div id="booking" class="tabcontent">
		<%@ include file="./bookinglist.jsp" %>
	</div>
	
	<div id="adminList" class="tabcontent">

	</div>


</body>
</html>