<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://code.jquery.com/jquery-2.2.3.js"></script>
<link href='fullCalendar.css' rel='stylesheet'>
<title>Insert title here</title>
</head>
<body>
	<button id='month' onclick="fn_month()">month</button>
	<button id='week' onclick="fn_week()">week</button>
	<br>
	<div id="weekTable">
	<table>
	<tr class="weekHead">
	<td>업무구분</td>
	<td>작업명</td>
	<td>시작일</td>
	<td>종료일</td>
	<td>기간</td>
	<td>진행률</td>
	</tr>
	<tr>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	</tr>
	<tr>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	</tr>
	<tr>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	</tr>
	</table>
	</div>
	
	
	
	<div id="weekCal" style="overflow:scroll" width="200px"></div>
	<script src="calendar.js"></script>
</body>
</html>