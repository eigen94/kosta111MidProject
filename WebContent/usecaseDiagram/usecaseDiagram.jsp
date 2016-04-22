<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="../javascriptFilse/jquery-2.2.3.min.js" type="text/javascript"></script>
<script src="../javascriptFilse/usecaseDiagram.js" type="text/javascript"></script>
</head>
<body>
	<span class="model">
		<h3>- Usecase_Diagram</h3><Br>
		<div class id="plus_btn">
			<button>+</button>
		</div>
		<span id="item">
			<select name="select">
				<option value="act">액터</option>
				<option value="even">이벤트</option>
			</select>
			<input type="text" value="내용을 입력하세요.">
			<button>-</button>
			<br>
		</span>
	</span>
	<span id="field">
	</span>
	
		<div class id="plus_btn2">
			<button>+</button>
		</div>
		<span id="item2">
			시작점:<input class="start" type="text">
			끝점:<input class="end" type="text">
			<input class="value" type="text" value="내용을 입력하세요.">
			<button>-</button>
			<br>
		</span>
	</span>
	<span id="field2">
	</span>
	<div class="save">
		<button>저장</button>
	</div>
	
</body>
</html>