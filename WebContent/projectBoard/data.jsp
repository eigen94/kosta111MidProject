<%@page import="java.util.ArrayList"%>
<%@page import="kosta.model.DB"%>
<%@page import="java.util.List"%>
<%@page import="kosta.model.DBList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="all">
		<form action="data.do" method="post">
			<input type="hidden" name= "check_id" value="${param.check_id }">
			<div id="title">
				<input type="text" name="title">
			</div>
			<div id="con">
				<input type="text" name="attri1">
				<select name="type1">
					<option value="varchar2">varchar2</option>
					<option value="number">number</option>
					<option value="date">date</option>
				</select>
				<select name="key1">
					<option value=" "></option>
					<option value="PK">PK</option>
					<option value="FK">FK</option>
					<option value="NOTNULL">notnull</option>
					<option value="UNIQUE">unique</option>
				</select><br>
				
				<input type="text" name="attri2">
				<select name="type2">
					<option value="varchar2">varchar2</option>
					<option value="number">number</option>
					<option value="date">date</option>
				</select>
				<select name="key2">
					<option value=" "></option>
					<option value="PK">PK</option>
					<option value="FK">FK</option>
					<option value="NOTNULL">notnull</option>
					<option value="UNIQUE">unique</option>
				</select><br>
				<input type="text" name="attri3">
				<select name="type3">
					<option value="varchar2">varchar2</option>
					<option value="number">number</option>
					<option value="date">date</option>
				</select>
				<select name="key3">
					<option value=" "></option>
					<option value="PK">PK</option>
					<option value="FK">FK</option>
					<option value="NOTNULL">notnull</option>
					<option value="UNIQUE">unique</option>
				</select><br>
			</div>
			<input type="submit" value="저장">
		</form>
	</div><br>
	
	<%
	
		List<DB> db = new ArrayList<DB>();

	 	db = (ArrayList<DB>)request.getAttribute("list");

	for(int i=0; i<db.size(); i++){
		if(i>0){
			if(db.get(i).getTitle().equals(db.get(i-1).getTitle())){
				
			}else{
				%>--------------<br><%
				out.println(db.get(i).getTitle());%><br>-------------<br><%
			}
			db.get(i).getTitle();
			db.get(i-1).getTitle();
			
		}else{
			out.println(db.get(i).getTitle());%><br>
			-------------<br>
			<%
		}
		out.print(db.get(i).getD_attr()+"  ");
		out.print(db.get(i).getType()+"  ");
		out.print(db.get(i).getD_key()+"  ");%><br><%
	}
	%>
	
</body>
</html>