<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="loginForm/loginForm.jsp"><button>로그인</button></a>
<a href="loginForm/registerForm.jsp"><button>회원가입</button></a>

<br>


<br>
<a href="projectBoard/insertForm.jsp"><button>프로젝트 생성</button></a>


</body>
</html> --%>
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
<!--     <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">코스타 중간프로젝트</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav pull-right">
	          
	            <li role="presentation"><a href="#" data-toggle="modal" data-target="#registerFormModal">회원가입</a></li>
	            
	            <li role="presentation"><a href="index.jsp">로그아웃</a></li>
	          </ul>
            </div>
          </div>
        </nav>

      </div>
    </div> -->


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
    </div><!-- end container -->
    
    <button class="btn btn-default" data-toggle="modal" data-target="#projectCreateModal">프로젝트생성</button>
    <br>
    
    <!-- projectList -->
	<%
	Service service = Service.getInstance();
	List<ProjectBoard> list = service.projectListService();
	request.setAttribute("list", list);
	for(int i = 0; i< list.size(); i++){
		out.println("프로젝트 이름 : "+list.get(i).getP_name()+"<br>");
	}
	%>    
    
    <!-- end of projectList -->
    
    
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





      <!-- FOOTER -->
<!--       <div class="container">
	      <footer>
	        <p class="pull-right"><a href="#">Back to top</a></p>
	        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
	      </footer>
      
      </div> -->

    </div><!-- /.container -->

	<!-- messenger -->
	<!-- 
	<div class="" id="messenger" style="max-height: 305px;left: auto; right: 0; bottom: 0; position: absolute;">
		<h4>매신저</h4>
	    <fieldset>
	        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
	        <br/>
	        <input id="inputMessage" type="text"/>
	        <input type="submit" value="send" onclick="send()" />
    	</fieldset>
	</div>
 -->
 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
  <!-- 
      <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8081/kosta111MidProject/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        textarea.value += "상대 : " + event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
  </script>
   -->
</html>
