<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="checkListUpdate.do" method="post">
		<input type="hidden" name="check_id" value="${param.check_id }">
		<input type="hidden" name="check_projeckId" value="${param.check_projectId }">
		<b>체크리스트 생성</b><br> 일정 이름<input type="text" name="check_name"><br>
		<b>일정양식</b> <select name="check_type">
			<option value="1">데이터명세</option>
			<option value="2">기능명세</option>
			<option value="3">화면명세</option>
			<option value="4">자우양식</option>
		</select><br> 종료일<input type="date" name="check_end"><br> 담당자<input
			type="text" name="check_manager"><br> 체크리스트내용
		<textarea rows="10" cols="25" name="check_content"></textarea>
		<br> <input type="submit" value="일정 생성">
	</form>

</body>
</html>