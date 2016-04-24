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
		  <div class="list-group-item list-group-item-info" data-toggle="modal" data-target="#checkCreateModal">일정생성</div>
		  
		  <!--  
		  checkCreate
		  -->
        <c:forEach var="checkList" items="${checkList }">
	       	<div class="list-group-item" data-toggle="collapse" data-target="#${checkList.check_id }" aria-expanded="false" aria-controls="${checkList.check_id }">
			&nbsp;${checkList.check_name }
	       	</div>
			<div class="collapse" id="${checkList.check_id }">
			<div class="list-group-item list-group-item-danger">
			<a href="checkDelete.do?check_id=${checkList.check_id }&check_projectid=${project.p_id}"><button>삭제</button></a>
			<a href="checkDetail.do?check_id=${checkList.check_id }&check_projectid=${project.p_id}"><button>편집</button></a>
			
			</div>
			</div>
        </c:forEach>
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
		                    <input type='text' id="inputStartDate" class="form-control" name="check_start" value=""/>
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
					  <select class="form-control" id="inputPwdCheck" name="check_type">
					    <option value="1">기능명세(usecase)</option>
					    <option>기능명세(usecase diaram)</option>
					    <option>데이터명세(uml)</option>
					    <option>데이터명세(ERD)</option>
					    <option>화면명세</option>
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
			var checkList = [];//불러올 체크리스트들을 담을 배열
			var projectIdFromUri = location.search; //주소줄에서 get요청 값 추출
			var regGetProjectId = /\d/g; //추출한 값에서 숫자만 추출할 정규표현식
			var projectId = regGetProjectId.exec(projectIdFromUri)[0]; //추출결과
			
			$.ajax({//체크리스트 목록을 가져오는 ajax부분
				url : 'checkListList.do',
				data : 
				{
					p_id : projectId
				},
				dataType : 'json',
				success : function(json){
					console.log("success");
					for(var i=0; i<json.length; i++){//체크리스트의 키값과 켈린더에서 일정의 변수명이 다른 것을 매칭해주는 작업
						var jsonObj = {};
						jsonObj.title = json[i].check_name; 
						jsonObj.start = json[i].check_start; 
						jsonObj.end = json[i].check_end;
						checkList.push(jsonObj);
					}
					
					$('#calendar').fullCalendar({//성공 후, 체크리스트들을 달력에 넣어준다.
						header: {
							left: 'prev,next today',
							center: 'title',
							right: 'month,agendaWeek,agendaDay'
						},
						editable: true,
						eventLimit: true, // allow "more" link when too many events
						events: checkList //ajax로 불러온 값을 넣어준다.
					});
				},
				error : function(){
					console.log("fail");
				}
				
			})
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
