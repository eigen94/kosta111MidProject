<%@page import="kosta.model.ProjectDetail"%>
<%@page import="kosta.model.ProjectBoard"%>
<%@page import="java.util.List"%>
<%@page import="kosta.service.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Service service = Service.getInstance();

    String tmp = request.getParameter("p_id");
    		int p_id=0;
    		if(tmp!=null){
    			p_id = Integer.parseInt(tmp);
    		}
	List<ProjectBoard> list = service.projectListService();
	ProjectBoard project = service.projectSelectService(p_id);
	List<ProjectDetail> checkList = service.detailListService(p_id);
	System.out.println(checkList);
	request.setAttribute("checkList", checkList);
	request.setAttribute("list", list);
	request.setAttribute("project", project);
	request.setAttribute("p_id", p_id);
	//ProjectDetail check = service.selectDetail(check_id);
	
	%>  
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
    <link href='http://fullcalendar.io/js/fullcalendar-2.6.1/fullcalendar.css' rel='stylesheet' />
	<link href='http://fullcalendar.io/js/fullcalendar-2.6.1/fullcalendar.print.css' rel='stylesheet' media='print' />
	<link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
            <li><a href="#">쪽지</a></li>
            <li role="presentation"><a href="#" data-toggle="modal" data-target="#messengerModal">매신저</a></li>
            
            <li role="presentation"><a href="loginForm/logout.jsp">로그아웃</a></li>
          </ul>
        </div>
      </div>
    </nav>



    <!-- Carousel
    ================================================== -->
    <div id="bodyContent">
    <div class="container-fluid">
      <div class="row">
      
      
      </div><!-- end row -->
      
    <br>
    
    </div><!-- end container -->
    
    
    
    <!-- end of bodycontent -->

    </div><!-- /.container -->
	
 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- for fullcalendar -->
    <script src='http://fullcalendar.io/js/fullcalendar-2.6.1/lib/moment.min.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- for fullcalendar -->
	<script src='http://fullcalendar.io/js/fullcalendar-2.6.1/fullcalendar.min.js'></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- for dateTimePicker -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
	<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
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
