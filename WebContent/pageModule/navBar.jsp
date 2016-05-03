<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<div class="navbar-wrapper">
  <div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="main.jsp">코로젝트</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
       <ul class="nav navbar-nav pull-right">
       	<c:choose>
       	<c:when test="${m_name!=null }">
	            <li><a href="#">안녕하세요! ${m_name } 님!</a></li>
          <li><a class="noteOpen" href="">쪽지</a></li>
          <li role="presentation"><a href="#" id="messengerBtn">매신저</a></li>
          <li role="presentation"><a href="logoutOk.do">로그아웃</a></li>
       	</c:when>
       	<c:otherwise>
          <li role="presentation"><a href="#" data-toggle="modal" data-target="#registerFormModal">로그인/회원가입</a></li>
       	</c:otherwise>
       	</c:choose>
       </ul>
        </div>
      </div>
    </nav>
  </div>
</div>
<script type="text/javascript" src="/kosta111MidProject/javascriptFiles/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
$('.noteOpen').on('click', function() {
	var popUrl = "/kosta111MidProject/note/noteInsertForm.jsp";    //팝업창에 출력될 페이지 URL
    var popOption = "width=450, height=360, resizable=no, scrollbars=no, " +
    		"status=no; scrollbars = no; resizable = no";    //팝업창 옵션(optoin)
    window.open(popUrl,"",popOption);
})
</script>
</body>
</html>