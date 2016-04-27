<%@page import="kosta.model.ProjectDetail"%>
<%@page import="kosta.model.ProjectBoard"%>
<%@page import="java.util.List"%>
<%@page import="kosta.service.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="pageModule/sessionCheck.jsp" %>

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
    <link href="/kosta111MidProject/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='/kosta111MidProject/cssFiles/fullcalendar-2.6.1/fullcalendar.css' rel='stylesheet' />
	<link href='/kosta111MidProject/cssFiles/fullcalendar-2.6.1/fullcalendar.print.css' rel='stylesheet' media='print' />
	<link href="/kosta111MidProject/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="/kosta111MidProject/cssFiles/main.css" rel="stylesheet">

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
		  <div id="checkList">
		  </div>
		  <!--  
		  checkCreate
		  -->

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

	<div class="" id="messenger" style="max-height: 305px;left: auto; right: 0; bottom: 0; position: absolute;">
		<h4>매신저</h4>
	    <fieldset>
	        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
	        <br/>
	        <input id="inputMessage" type="text"/>
	        <input type="submit" value="send" onclick="send()" />
    	</fieldset>
	</div>

	
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
	   				
						<!-- <input class="form-control" id="inputPwdCheck" type="text" name="check_type" size="20" placeholder="메모를 입력하세요"><br> -->
					</div>
	       			<label for="inputPhone" class="col-sm-2 control-label">담당자</label>
	   				<div class="col-sm-4">
						<input class="form-control" id="inputPhone" type="text" name="check_manager" size="20" placeholder="담당자를 입력하세요"><br>
					</div>
					<input type="hidden" id="checkListProjectId" name="check_projectId" value="${project.p_id }">
		        
		        </div>
			  	<div class="form-group">
			    	<div class="col-sm-offset-2 col-sm-10">
			      		<button id="createCheckListBtn" class="btn btn-default" data-dismiss="modal">일정 생성</button>
			    	</div>
			  	</div>
			</form>
	      
	      </div>
	    </div>
	
	  </div>
	</div><!--end of checkCreateModal -->
	
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
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	
		var checkList = [];//불러올 체크리스트들을 담을 배열
		var projectIdFromUri = location.search; //주소줄에서 get요청 값 추출
		var regGetProjectId = /\d/g; //추출한 값에서 숫자만 추출할 정규표현식
		var projectId = regGetProjectId.exec(projectIdFromUri)[0]; //추출결과
    	
    	//초기세팅
    	getCheckListAjax();//리스트가져오기
    	setInputFormDate();//모달 인풋폼에 날짜 변경
    	drawCalendar();//달력그리기
    	
    	$('.checkListDelBtn').on('click',function(event){//체크리스트 삭제 버튼시 이벤트
    		event.preventDefault();
    	alert('hi');
    	console.log('hi');
    		var href = $(this).attr('href');//a태그의 주소값을 가져옴
    		var regTmp = /=\d+/g;
/*     		$.ajax({
    			url : 'checkDelete.do',
    			method : 'post',
    			data : {
    				check_id : 1,
    				check_projectid : 1
    			},
    			success : function(){
    				getCheckListAjax();
    			}
    		}); */
    	});
    	
    	$('#createCheckListBtn').on('click',function(event){//체크리스트 생성 이벤트
    		//get FormData
    		event.preventDefault();
    		var sendCheckListData = {
    				check_name : $('#checkListName').val(),
    				check_start : $('#checkListStartDate').val(),
    				check_end : $('#checkListEndDate').val(),
    				check_projectId : $('#checkListProjectId').val()
    		}
    		console.log(sendCheckListData);
    		//reset FormData
    		
    		//send FormData to DB
    		
    		$.ajax({
    			method : 'post',
    			url : 'CheckCreate.do',
    			data : sendCheckListData,
    			success : function(){
    				console.log('ok');
    		//get checkList data from DB
	    		getCheckListAjax();
    		
    			}//end of success
    		})//end of ajax 
    		//refresh calendar events
    	});

		function getCheckListAjax(){
			var checkListHtml = ""; //최종적으로 출력할 체크리스트용 html
			
			$.ajax({//체크리스트 목록을 가져오는 ajax부분
				url : 'checkListList.do',
				data : 
				{
					p_id : projectId
				},
				dataType : 'json',
				success : function(json){
					checkList = [];
					for(var i=0; i<json.length; i++){//체크리스트의 키값과 켈린더에서 일정의 변수명이 다른 것을 매칭해주는 작업
						var jsonObj = {};
						jsonObj.title = json[i].check_name; 
						jsonObj.start = json[i].check_start; 
						jsonObj.end = json[i].check_end;
						checkList.push(jsonObj);//카랜더용 배열에 객체 입력
						//체크리스트용 html생성
						var forChecklistHtmlStr = '<div class="list-group-item" data-toggle="collapse" data-target="#';
						forChecklistHtmlStr += json[i].check_id;
						forChecklistHtmlStr += '" aria-expanded="false" aria-controls="';
						forChecklistHtmlStr += json[i].check_id;
						forChecklistHtmlStr += '">';
						forChecklistHtmlStr += json[i].check_name;
						forChecklistHtmlStr += '</div><div class="collapse" id="';
						forChecklistHtmlStr += json[i].check_id;
						forChecklistHtmlStr += '"><div class="list-group-item list-group-item-danger"><a class ="checkListDelBtn" href="checkDelete.do?check_id=';
						forChecklistHtmlStr += json[i].check_id;
						forChecklistHtmlStr += '&check_projectid=';
						forChecklistHtmlStr += projectId;
						forChecklistHtmlStr += '"><button>삭제</button></a><a href="checkListDetail.jsp?check_id='; 
/* 						forChecklistHtmlStr += '"><div class="list-group-item list-group-item-danger"><a class ="checkListDelBtn" href="checkDelete.do?check_id=';
						forChecklistHtmlStr += json[i].check_id;
						forChecklistHtmlStr += '&check_projectid=';
						forChecklistHtmlStr += projectId;
						forChecklistHtmlStr += '"><button>삭제</button></a><a href="checkListDetail.jsp?check_id='; */
						forChecklistHtmlStr += json[i].check_id;
						forChecklistHtmlStr += '&check_projectid=';
						forChecklistHtmlStr += projectId;
						forChecklistHtmlStr += '"><button>편집</button></a></div></div>';
						
						checkListHtml += forChecklistHtmlStr;
					}
					$('#calendar').fullCalendar( 'removeEvents' );
					$('#calendar').fullCalendar( 'addEventSource', checkList );
					$('#checkList').empty();
					$('#checkList').append(checkListHtml);
				},
				error : function(){
					console.log("fail");
				}
			});//end of get checklist ajax
		}//end of get checklist function
		
		
		function drawCalendar(){
			$('#calendar').fullCalendar({//성공 후, 체크리스트들을 달력에 넣어준다.
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				editable: true,
				eventLimit: true, // allow "more" link when too many events
				events: checkList, //ajax로 불러온 값을 넣어준다.
			    eventClick: function() {//일정 클릭이벤트
			        alert($(this).find('.fc-title').html());
			        $('#dialog').dialog('open');
			    }
			});
		}//end of drawCalendar
		
		function setInputFormDate(){//set modal default dateValue
	    	var dateObj = new Date; 
	    	var modalDefaultYear = dateObj.getFullYear();
	    	var modalDefaultMonth = dateObj.getMonth()+1;
	    	if(modalDefaultMonth<10){
	    		modalDefaultMonth = '0'+modalDefaultMonth;
	    	}
	    	var modalDefaultDay = dateObj.getDate();
	    	var modalDefaultValue = modalDefaultYear+"-"+modalDefaultMonth+"-"+modalDefaultDay;
	    	$('#checkListStartDate').val(modalDefaultValue);
	    	$('#checkListEndDate').val(modalDefaultValue);
		}//end of set input form date
		
		//datetimepicker
       $('#datetimepicker1').datetimepicker({format: 'YYYY-MM-DD'});
       $('#datetimepicker2').datetimepicker({format: 'YYYY-MM-DD'});//end of datetimepicker
       
       
    $('#dialog').dialog({
        autoOpen: false,
        resizable: false,
      });
	});
	
	</script>
	
	<div id="dialog" title="기본 대화상자">
  <p>이것은 기본 대화상자 입니다. 이동하거나 닫을 수 있습니다.</p>
</div>
	
	
  </body>
   
      <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8081/kosta111MidProject/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
        var sender = $('#wsSender').val();
        var projectId = $('#wsProjectId').val();
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
        webSocket.send('{"sender" : "'+sender+'", "msg" : "'+inputMessage.value+'", "projectId" : "'+projectId+'"}');
/*         webSocket.send("sender : "+sender+", msg : "+inputMessage.value); */
        inputMessage.value = "";
    }
  </script>
   
</html>
