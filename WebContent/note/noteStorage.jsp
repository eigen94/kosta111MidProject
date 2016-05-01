<%@page import="kosta.model.Note"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("utf-8");
 %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <table border="1">
		<c:forEach var="note" items="${noteList }">
			<tr>
				<td>${note.n_id }</td>
				<td>${note.n_title }</td>
				<td>${note.n_content }</td>
				<td>${note.n_sender }</td>
				<td>${note.n_receive }</td>
				<td><fmt:formatDate value="${note.n_date }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table> --%>
	
	<h3>쪽지목록보기</h3>
	<table border="1" cellpadding="0" cellspacing="0">
		<tr height="30">
			<th width="50">번호</th>
			<th width="250">제목</th>
			<th width="150">보낸이</th>
			<th width="150">작성일</th>
		</tr>
		<c:forEach var="note" items="${noteList.list }">
		<tr height="30">
			<td align="center">${note.n_id }</td>			
			<td align="left">
				<a href="noteDetail.do?n_id=${note.n_id }">${note.n_title }</a>				
			</td>
			<td align="center">${note.n_sender }</td>
			<td align="center">
				<fmt:formatDate value="${note.n_date }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>		
		</c:forEach>
			
	</table>
	
	
	<!-- 페이징 처리 -->
	<!-- 현재페이지, 페이지당 글 개수, 총 글 개수, 총 페이지 개수, 시작페이지, 마지막 페이지 -->	
	
	<c:if test="${noteList.startPage > 5 }">
		<a href="noteList.do?pageNum=${noteList.startPage - 5 }">[이전]</a>
	</c:if>
	
	<c:forEach var="pageNo" begin="${noteList.startPage }" end="${noteList.endPage }">
		<c:choose>
			<c:when test="${noteList.requestPage == pageNo}">
				<b>[${pageNo }]</b>	
			</c:when>
			<c:otherwise>
				<a href="noteList.do?pageNum=${pageNo }">[${pageNo }]</a>	
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${noteList.endPage < noteList.totalPageCount }">
		<a href="noteList.do?pageNum=${noteList.startPage + 5 }">[다음]</a>
	</c:if>

	<form action="noteList.do" method="post">
		<input type="checkbox" name="area" value="n_title">제목 
		<input type="checkbox" name="area" value="n_sender">작성자
		<input type="text" name="searchKey" size="10"> 
		<input type="hidden" name="temp" value="temp">
		<input type="submit" value="검색">
	</form>
	
	<div class="sendNote">
		<span class="send"><button>쪽지 보내기</button></span>
	</div>
	<script type="text/javascript" src="/kosta111MidProject/javascriptFiles/jquery-2.2.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.sendNote').click(function(){
				location.href="noteInsertForm.jsp";
			});
		});
	</script>
</body>
</html>







