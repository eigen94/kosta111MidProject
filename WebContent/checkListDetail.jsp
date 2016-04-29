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
	String reqCheck_id = request.getParameter("check_id");
    String tmp = request.getParameter("p_id");
	int check_id=0;
	if(reqCheck_id!=null){
		check_id = Integer.parseInt(reqCheck_id);
	}
	ProjectDetail check = service.selectDetail(check_id);
	int check_type = check.getCheck_type();
	request.setAttribute("check_id", check_id);
	request.setAttribute("check_type", check_type);
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
    <link href="cssFiles/main.css" rel="stylesheet">

  </head>
<!-- NAVBAR
================================================== -->
	<body>
	<jsp:include page="pageModule/navBar.jsp"></jsp:include>
	<input id="check_id" type="hidden" value="${check_id }">

    <!-- Carousel
    ================================================== -->
    <div id="bodyContent">
    <div class="container-fluid">
      <div class="row">
      <c:choose>
      <c:when test="${check_type==1 }"><!-- usecase  -->
      <jsp:include page="usecaseDiagram/usecaseDiagram.jsp"></jsp:include>
      </c:when>
      <c:when test="${check_type==2 }"><!-- usecase Diagram -->
      <jsp:include page="usecaseDiagram/usecaseDiagram.jsp"></jsp:include>
      </c:when>
      <c:when test="${check_type==3 }"><!-- uml -->
      <jsp:include page="usecaseDiagram/usecaseDiagram.jsp"></jsp:include>
      </c:when>
      <c:when test="${check_type==4 }"><!-- erd -->
      <jsp:include page="usecaseDiagram/usecaseDiagram.jsp"></jsp:include>
      </c:when>
      <c:when test="${check_type==5 }"><!-- 이미지게시판 -->
      <jsp:include page="usecaseDiagram/usecaseDiagram.jsp"></jsp:include>
      </c:when>
      </c:choose>
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
</html>
