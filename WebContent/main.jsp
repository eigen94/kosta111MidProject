<%@page import="kosta.model.ProjectBoard"%>
<%@page import="java.util.List"%>
<%@page import="kosta.service.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>코스타 중간프로젝트</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="cssFiles/main.css" rel="stylesheet">

  </head>
<!-- NAVBAR
================================================== -->
  <body>
      <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">프로젝트 중간프로젝트</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">안녕하세요! <%=session.getAttribute("m_name") %> 님!</a></li>
            <li><a href="projectBoard/insertForm.jsp">새프로젝트</a></li>
            <li><a href="#">쪽지</a></li>
            <li role="presentation"><a href="#" data-toggle="modal" data-target="#messengerModal">매신저</a></li>
            
            <li role="presentation"><a href="loginForm/logout.jsp">로그아웃</a></li>
          </ul>
          <!-- 
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
           -->
        </div>
      </div>
    </nav>

    <!-- Carousel
    ================================================== -->
    <div id="bodyContent">
    <div class="container-fluid">
      <div class="row">
      
        <div class="col-sm-8 col-md-10 main">
          <h1 class="page-header">프로젝트 관리</h1>
        </div>
        
        <div class="col-sm-3 col-md-2 main">
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-default change_viewtype ">
				<input id="view_type_media" type="radio" value="media" name="view_type">
				<span class="glyphicon glyphicon-list"></span>
				</label>
				<label class="btn btn-default change_viewtype active">
				<input id="view_type_card" type="radio" value="card" name="view_type">
				<span class="glyphicon glyphicon-th-large"></span>
				</label>
			</div>
        </div>
        
      </div><!-- end row -->
      
    <button class="btn btn-default" data-toggle="modal" data-target="#projectCreateModal">프로젝트생성</button>
    <br>
    
    <!-- projectList -->
	<%
	Service service = Service.getInstance();
	List<ProjectBoard> list = service.projectListService();
	request.setAttribute("list", list);
//	for(int i = 0; i< list.size(); i++){
//		out.println("프로젝트 이름 : "+list.get(i).getP_name()+"<br>");
//	}
	
	%>    
	
	
      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-10">
          
          <div class="row">
          <c:choose>
          <c:when test="${list!=null }">
	          <c:forEach var="project" items="${list }">
	            <div class="col-xs-6 col-lg-4">
	              <h2>${project.p_name }</h2>
	              <p>${project.p_memo } </p>
	              <p><a class="btn btn-default" href="projectDetail.jsp?p_id=${project.p_id }" role="button">프로젝트 시작하기 &raquo;</a></p>
	            </div><!--/.col-xs-6.col-lg-4-->
	          </c:forEach>
          </c:when>
          <c:when test="${list==null }">
          <h2>프로젝트가 없습니다!</h2>
          <p>프로젝트를 생성하세요.</p>
          </c:when>
          </c:choose>
          
          
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

      </div><!--/row-->
    
    <!-- end of projectList -->
      
      
    </div><!-- end container -->
    
    
    
    <!-- end of bodycontent -->


	<!-- Modal -->

	<!-- registerFormMoadl -->
	<div id="projectCreateModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-body">
	      
	        <form action="#" method="post" class="form-horizontal">
		        <div class="form-group">
	       			<label for="inputName" class="col-sm-3 control-label">프로젝트 이름</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputName" type="text" name="m_name" size="20" placeholder="프로젝트 이름을 입력하세요"><br>
					</div>
	       			<label for="inputEmail" class="col-sm-3 control-label">시작일</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputEmail" type="text" name="m_email" size="20" placeholder="이메일을 입력하세요"><br>
					</div>
	       			<label for="inputPassword" class="col-sm-3 control-label">종료일</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputPassword" type="password" name="m_pwd" size="20" placeholder="비밀번호를 입력하세요"><br>
					</div>
	       			<label for="inputPwdCheck" class="col-sm-3 control-label">메모</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputPwdCheck" type="password" name="m_pwd" size="20" placeholder="메모를 입력하세요"><br>
					</div>
	       			<label for="inputPhone" class="col-sm-3 control-label">맴버추가</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputPhone" type="text" name="m_phone" size="20" placeholder="추가할 맴버 이름이나 이메일을 입력하세요"><br>
					</div>
		        
		        </div>
			  	<div class="form-group">
			    	<div class="col-sm-offset-3 col-sm-9">
			      		<button type="submit" class="btn btn-default">프로젝트 생성</button>
			    	</div>
			  	</div>
			</form>
	      
	      </div>
	    </div>
	
	  </div>
	</div>



<a href="loginForm/loginForm.jsp"><button>로그인</button></a>
<a href="loginForm/registerForm.jsp"><button>회원가입</button></a>

<br>
<a href="messenger/broadcast.html"><button>매신저</button></a>

<br>
<a href="projectBoard/inserdtForm.jsp"><button>프로젝트 생성</button></a>
<br>
<a href="imgProjectBoard/imgBoard.jsp"><button>이미지 게시판</button></a>

</body>
</html>