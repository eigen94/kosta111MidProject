<%@page import="kosta.model.ProjectDetail"%>
<%@page import="kosta.model.ProjectBoard"%>
<%@page import="java.util.List"%>
<%@page import="kosta.service.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="pageModule/sessionCheck.jsp" %>
<%
String p_id = request.getParameter("p_id");
request.setAttribute("p_id", p_id);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>코스타 중간프로젝트</title>

    <!-- Bootstrap core CSS -->
    <link href="/kosta111MidProject/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='/kosta111MidProject/cssFiles/fullcalendar-2.6.1/fullcalendar.css' rel='stylesheet' />
	<link href='/kosta111MidProject/cssFiles/fullcalendar-2.6.1/fullcalendar.print.css' rel='stylesheet' media='print' />
	<link href="/kosta111MidProject/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

    <!-- Custom styles for this template -->
    <link href="/kosta111MidProject/cssFiles/main.css" rel="stylesheet">
    <link href="/kosta111MidProject/cssFiles/projectDetail.css" rel="stylesheet">

  </head>
<!-- NAVBAR
================================================== -->
  <body>
  <jsp:include page="pageModule/navBar.jsp"></jsp:include>

    <!-- Carousel
    ================================================== -->
    <div id="bodyContent">
    <div class="container-fluid">
      <div class="row">
      
		<!-- projectList  -->
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
	        <li><a href="main.jsp"><label>프로젝트 리스트</label></a></li>
          	<c:forEach var="project" items="${list }">
          	<c:choose>
          	<c:when test="${project.p_id==p_id }">
          	<li class="active"><a href="#">${project.p_name }</a></li>
          	</c:when>
          	<c:when test="${project.p_id!=p_id }">
          	<li><a href="projectDetail.do?p_id=${project.p_id }">${project.p_name }</a></li>
          	</c:when>
            
          	</c:choose>
          	
          	</c:forEach>
          </ul>
        </div><!-- end of project List -->

        <div class="col-sm-8 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header">${project.p_name }</h1>
        
        <!-- contents -->
        
        <!-- checklist -->
	        <div class="col-sm-4 col-md-4 main">
		        <div class="list-group">
				  <div class="list-group-item list-group-item-info" data-toggle="modal" data-target="#checkCreateModal">일정생성</div>
				  <div id="checkList"></div>
				</div>
	        </div><!-- end of checklist -->
	        
	        <!-- calendar -->
	        <div class="col-sm-8 col-md-8 main" style="padding-left: 0px; padding-top: 0px;">
		        <div id='calendar' style="margin-top: 20px;"></div>
	        </div><!-- end of calendar -->
         </div><!-- end of main -->
      </div><!-- end row -->
    <br>
    </div><!-- end container -->
    </div><!-- end of bodycontent -->

	<!-- messenger -->
	 <div class="container" id="messengerModule">
	    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;">
	        <div class="col-xs-12 col-md-12">
	        	<div class="panel panel-default">
	                <div class="panel-heading top-bar">
	                    <div class="col-md-8 col-xs-8">
	                        <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> 매신저</h3>
	                    </div>
	                    <div class="col-md-4 col-xs-4" style="text-align: right;">
	                        <a href="#"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
	                        <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
	                    </div>
	                </div>
	                <div class="panel-body msg_container_base">
	                </div>
	                <div class="panel-footer">
	                    <div class="input-group">
	                        <input id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." />
	                        <span class="input-group-btn">
	                        <button class="btn btn-primary btn-sm" id="btn-chat" onclick="send()">Send</button>
	                        </span>
	                    </div>
	                </div>
	    		</div>
	        </div>
	    </div><!-- end of messenger -->
	</div><!-- end of messenger container -->
	
	<!-- Modal -->

	<!-- checkCreateModal -->
	<div id="checkCreateModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-body">
	      <!-- to projectDetail.do -->
	        <form action="#" method="post" class="form-horizontal">
		        <div class="form-group">
	       			<label for="inputName" class="col-sm-2 control-label">일정이름</label>
	   				<div class="col-sm-10">
						<input class="form-control" id="checkListName" type="text" name="check_name" size="20" placeholder="체크리스트 이름을 입력하세요"><br>
					</div>
	       			<label for="inputStartDate" class="col-sm-2 control-label">시작일</label>
	   				<div class="col-sm-4">
		                <div class='input-group date' id='datetimepicker1'>
		                    <input type='text' id="checkListStartDate" class="form-control" name="check_start" value=""/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
					</div>
	       			<label for="inputEndDate" class="col-sm-2 control-label">종료일</label>
	   				<div class="col-sm-4">
		                <div class='input-group date' id='datetimepicker2'>
		                    <input type='text' id="checkListEndDate" class="form-control" name="check_end"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
		                <br>
					</div>
	       			<label for="inputPwdCheck" class="col-sm-2 control-label">일정타입</label>
	   				<div class="col-sm-4">
					  <select class="form-control" id="checkListCheckType" name="check_type">
					    <option value="1">기능명세(usecase)</option>
					    <option>기능명세(usecase diaram)</option>
					    <option>데이터명세(uml)</option>
					    <option>데이터명세(ERD)</option>
					    <option>화면명세</option>
					  </select>
					</div>
	       			<label for="inputPhone" class="col-sm-2 control-label">담당자</label>
	   				<div class="col-sm-4">
						<input class="form-control" id="inputPhone" type="text" name="check_manager" size="20" placeholder="담당자를 입력하세요"><br>
					</div>
					<input type="hidden" id="checkListProjectId" name="check_projectId" value="${p_id }">
		        </div><!-- end of form group -->
		        
			  	<div class="form-group">
			    	<div class="col-sm-offset-2 col-sm-10">
			      		<button id="createCheckListBtn" class="btn btn-default" data-dismiss="modal">일정 생성</button>
			    	</div>
			  	</div>
			</form><!-- end of projectDetail.do modalForm -->
	      </div><!-- end of modal body -->
	    </div><!-- end of modal contents -->
	  </div><!-- end of modal dialog -->
	</div><!--end of checkCreateModal -->
	
	<!-- temp value -->
 	<input id="wsSender" type="hidden" value="${m_id }">
 	<input id="wsProjectId" type="hidden" value="${p_id }">
 	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- for fullcalendar -->
    <script src='/kosta111MidProject/javascriptFiles/fullcalendar-2.6.1/lib/moment.min.js'></script>
    <script src="/kosta111MidProject/javascriptFiles/jquery/1.11.2/jquery.min.js"></script>
	<!-- for fullcalendar -->
	<script src='/kosta111MidProject/javascriptFiles/fullcalendar-2.6.1/fullcalendar.min.js'></script>
    <script src="/kosta111MidProject/bootstrap/js/bootstrap.min.js"></script>
    <!-- for dateTimePicker -->
    <script src="/kosta111MidProject/javascriptFiles/moment/moment-with-locales.js"></script>
	<script src="/kosta111MidProject/javascriptFiles/dateTimePicker/bootstrap-datetimepicker.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="/kosta111MidProject/javascriptFiles/forPageScript/projectDetail.js"></script>
  </body>
</html>
