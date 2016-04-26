<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../javascriptFiles/jquery-2.2.3.min.js" type="text/javascript"></script>
<script src="../javascriptFiles/usecase.js" type="text/javascript"></script>
<link rel="stylesheet" href="../cssFiles/tmp.css" type="text/css" />
</head>
<body>
	<div class="top_position">
		<input type="text" name="" value="프로잭트 이름">
		<input type="text" name="" value="일정이름및유형정보">
		<input type="text" name="" value="정보"><br>
	</div>
	<div class="mid_position">
		<h3>기능명세 - Use_case</h3><br>
		<div id="item">
				<select name="selector">
    				<option value="outline">개요</option>
    				<option value="actor">관련엑터</option>
    				<option value="conditionF">선행조건</option>
    				<option value="event">이벤트</option>
    				<option value="eventDetail">이벤트 상세내역</option>
    				<option value="conditionB">후행조건</option>
    				<option value="claim">요구사항</option>
				</select>
				<input type="text" name="내용" value="내용을 입력하세요.">
				<!-- <span id="minus_btn"> -->
					<button>ㅡ</button>
				<!-- </span> -->
		</div>
		<div id="field">
		</div>
		<div id="plus_btn">
			<button>+</button>
		</div>
	</div>
	<div class="bot_position">
		<div class="save">
			<button>저장</button>
		</div>
	</div>
</body>
</html>








