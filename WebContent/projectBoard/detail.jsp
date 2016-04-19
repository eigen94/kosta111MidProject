<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<button onclick="create();">생성</button>
		</div>
		<div id="projectForm">
			<form action="projectDetailAction.jsp" method="post">
				<b>체크리스트 생성</b><br>
				일정 이름<input type="text" name="c_name"><br>
				<b>일정양식</b>
				<select name="c_select">
				<option>데이터명세</option>
				<option>기능명세</option>
				<option>화면명세</option>
				<option>자우양식</option>
				</select><br>
				<input type="date" name="c_date"><br>
				<input type="text" name="c_writer"><br>
				<textarea rows="10" cols="25" name="c_memo"></textarea><br>
				<input type="submit" value="일정 생성">
			</form>
		</div>
	</div>
	<a href="projectList.do"><button>목록으로</button></a>
		<a href="delete.do?p_id=${select.p_id }"><button>삭제</button></a>
</body>
</html>