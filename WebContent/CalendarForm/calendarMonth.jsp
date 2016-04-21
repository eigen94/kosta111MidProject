<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<script src="https://code.jquery.com/jquery-2.2.3.js"></script>
<link href='fullCalendar.css' rel='stylesheet'>
<title>Insert title here</title>
</head>
<body>

<div class ='wrap'>

		<div class ='btn-holder'>
			
             <a id='currentMonth'></a><br>
             <a id='currentYear'></a>
			<button id='btnPrev'><</button>
			<button id='btnNext'>></button>
			<button id='month' onclick="fn_month()">month</button>
			<button id='week' onclick="fn_week()">week</button>
		</div>
		<div id='calendar'></div>
	</div>
	<script src="calendar.js"></script>
	

</body>
</html>