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
          	<li><a href="projectDetail.jsp?p_id=${project.p_id }">${project.p_name }</a></li>
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
		  <a class="list-group-item list-group-item-warning" href="#" data-toggle="modal" data-target="#checkCreateModal">일정생성</a>
		  
		  <!--  
		  checkCreate
		  -->
        <c:forEach var="checkList" items="${checkList }">
        
        <div class="col-sm-9 col-md-9" style="padding-left: 0px; padding-right: 0px;">
		  <a class="list-group-item" href="#" data-toggle="modal" data-target="#checkDetailModal">&nbsp;${checkList.check_name }
			</a>
			</div>
        <div class="col-sm-3 col-md-3" style="padding-left: 0px; padding-right: 0px;">
			<a class="list-group-item list-group-item-danger" href="checkDelete.do?check_id=${checkList.check_id }&check_projectid=${project.p_id}">delete</a>
			</div>
        </c:forEach>
		</div>
        </div><!-- end of checklist -->
        
        <!-- calendar -->
        <div class="col-sm-8 col-md-8 main" style="padding-left: 0px; padding-top: 0px;">
        
        <div id='calendar' style="margin-top: 20px;"></div>
        
        </div><!-- end of calendar -->

<!-- 
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>
        </div>
           -->
         </div><!-- end of main -->
      </div><!-- end row -->
      
    <br>
    
    </div><!-- end container -->
    
    
    
    <!-- end of bodycontent -->

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
	<!-- Modal -->

	<!-- checkCreateModal -->
	<div id="checkCreateModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-body">
	      
	        <form action="projectDetail.do" method="post" class="form-horizontal">
		        <div class="form-group">
	       			<label for="inputName" class="col-sm-3 control-label">체크리스트 이름</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputName" type="text" name="check_name" size="20" placeholder="체크리스트 이름을 입력하세요"><br>
					</div>
					
	       			<label for="inputStartDate" class="col-sm-3 control-label">시작일</label>
	   				<div class="col-sm-7">
		                <div class='input-group date' id='datetimepicker1'>
		                    <input type='text' id="inputStartDate" class="form-control" name="check_start"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
					</div>
					
	       			<label for="inputEndDate" class="col-sm-3 control-label">종료일</label>
	   				<div class="col-sm-7">
		                <div class='input-group date' id='datetimepicker2'>
		                    <input type='text' id="inputEndDate" class="form-control" name="check_end"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
					</div>
	       			<label for="inputPwdCheck" class="col-sm-3 control-label">일정타입</label>
	   				<div class="col-sm-7">
					  <label for="sel1">Select list:</label>
					  <select class="form-control" id="sel1" name="check_type">
					    <option value="1">1</option>
					    <option>2</option>
					    <option>3</option>
					    <option>4</option>
					  </select>
	   				
	   				<!-- 
	   					<select class="form-control" name="check_type">
	   					<option value="0">화면명세</option>
	   					<option value="1">기능명세</option>
	   					<option value="2">uml</option>
	   					</select>
	   				 -->	
						<!-- <input class="form-control" id="inputPwdCheck" type="text" name="check_type" size="20" placeholder="메모를 입력하세요"><br> -->
					</div>
	       			<label for="inputPhone" class="col-sm-3 control-label">담당자</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputPhone" type="text" name="check_manager" size="20" placeholder="담당자를 입력하세요"><br>
					</div>
					<input type="hidden" name="check_projectId" value="${project.p_id }">
		        
		        </div>
			  	<div class="form-group">
			    	<div class="col-sm-offset-3 col-sm-9">
			      		<button type="submit" class="btn btn-default">일정 생성</button>
			    	</div>
			  	</div>
			</form>
	      
	      </div>
	    </div>
	
	  </div>
	</div><!--end of checkCreateModal -->
	

	<!-- checkDetailModal -->
	<div id="checkDetailModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-body">
	      detail!
	      
	      
	      
	      </div>
	    </div>
	
	  </div>
	</div>
	
 
 
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
	<script>
	
		$(document).ready(function() {
			$.ajax({
				url : 'checkListList.do',
				data : {
					p_id : 4
				},
				dataType : 'json',
				success : function(json){
					console.log(json);
				}
				
			})
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				//defaultDate: '2016-01-12',
				editable: true,
				eventLimit: true, // allow "more" link when too many events
				events: [
					{
						title: 'Long Event',
						start: '2016-01-07',
						end: '2016-01-10'
					}
				]
			});
			
		});
	
	</script>
	
	<!-- datetimepicker -->
	        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker({format: 'YYYY-MM-DD'});
                $('#datetimepicker2').datetimepicker({format: 'YYYY-MM-DD'});
            });
        </script><!-- end of datetimepicker -->
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
