<%@ page contentType="text/html; charset=UTF-8"%>
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

button {
	background-color: #04AA6D;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

</style>
<script type="text/javascript">
$(function(){
	$("button").click(function(){
		location.href="/admin/main";
	});
});
</script>
</head>
<body>

<h2>티켓 예매 현황</h2>

<table>
  	<tr>
	    <th>No</th>
	    <th>전시명</th>
	    <th>일정</th>
	    <th>내역</th>
	    <th>예약자명</th>
	    <th>예매상태</th>
  	</tr>
	<tr>
	    <td>1</td>
	    <td>고려자기</td>
	    <td>2023-08-09</td>
	    <th>1</th>
	    <th>박지인</th>
	    <th>예매 대기</th>
  	</tr>
  	<tr>
  		<td colspan="6">
  			<button id="bt_main">관리자 메인으로</button>
  		</td>
  	</tr>
</table>

</body>
</html>
