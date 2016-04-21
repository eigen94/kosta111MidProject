<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#projectForm{
		display : none;
		
	}
</style>
</head>
<script type="text/javascript">
	function create(){
		alert("버튼을 클릭하셧습니다.");
		var a = document.getElementById("projectForm");
		a.style.display = 'block';
	}
</script>
<body>
		<hr>
		${select.p_id }<br>
		${select.p_name }<br>
		${select.p_start }<br>
		${select.p_end }<br>
		${select.p_pmid }<br>
		${select.p_crew }<br>
		${select.p_memo }<br>
		
		<hr>
		<div>
		<b>프로젝트 이름</b>
		<div>
			<c:forEach var="d" items="${list }">
		<hr>
			<a href="check.do?check_id=${d.check_id }">${d.check_name }</a>
		<hr>
	</c:forEach>
			<button onclick="create();">생성</button>
		</div>
		<div id="projectForm">
			<form action="projectDetail.do" method="post">
				<input type="hidden" name="check_projeckId" value="${select.p_id }">
				<b>체크리스트 생성</b><br>
				일정 이름<input type="text" name="check_name"><br>
				<b>일정양식</b>
				<select name="check_type">
				<option value="1">데이터명세</option>
				<option value="2">기능명세</option>
				<option value="3">화면명세</option>
				<option value="4">자우양식</option>
				</select><br>
				종료일<input type="date" name="check_end"><br>
				담당자<input type="text" name="check_manager"><br>
				체크리스트내용<textarea rows="10" cols="25" name="check_content"></textarea><br>
				<input type="submit" value="일정 생성">
			</form>
		</div>
	</div>
	<a href="projectList.do"><button>목록으로</button></a>
	<a href="delete.do?p_id=${select.p_id }"><button>삭제</button></a>
</body>
</html>