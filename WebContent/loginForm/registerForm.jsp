<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
회원가입
<form action="" method="post">
이메일 <input type="text" name="m_email"><br>
이름 <input type="text" name="m_name"><br>
비밀번호 <input type="password" name="m_pwd"><br>
비밀번호 확인 <input type="password" name="m_pwdcheck"><br>
연락처 <input type="text" name="m_phone"><br>
비밀번호 찾기 질문 <select name="m_question">
<option value="0">어머니 이름</option>
<option value="1">아버지 이름</option>
<option value="2">가장 기억에 남는 장소</option>
<option value="3">가장 기억에 남는 여행지</option>
<option value="4">좋아하는 동물</option>
<option value="5">좋아하는 음식</option>
<option value="6">좋아하는 색깔</option>
<option value="7">좋아하는 신발</option>
</select><br>
비밀번호 찾기 질문의 답 <input type="text" name="m_answer"><br>
<input type="submit" value="회원가입"><br>
</form>
</body>
</html>

<!--
	private int m_id;
	private String m_name;
	private String m_email;
	private String m_pwd;
	private String m_phone;
	private int m_question;
	private String m_answer;
	private String m_friend;
  -->



