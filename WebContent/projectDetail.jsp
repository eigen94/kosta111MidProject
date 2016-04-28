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

<style type="text/css">
/* body{
    height:400px;
    position: fixed;
    bottom: 0;
} */
#messengerModule .col-md-2,#messengerModule .col-md-10{
    padding:0;
}
.panel{
    margin-bottom: 0px;
}
.chat-window{
    bottom:0;
    right : 0;
    position:fixed;
    float:right;
    margin-left:10px;
    z-index: 1;
}
.chat-window > div > .panel{
    border-radius: 5px 5px 0 0;
}
.icon_minim{
    padding:2px 10px;
}
.msg_container_base{
  background: #e5e5e5;
  margin: 0;
  padding: 0 10px 10px;
  max-height:300px;
  overflow-x:hidden;
  height: 300px;
}
.top-bar {
  background: #666;
  color: white;
  padding: 10px;
  position: relative;
  overflow: hidden;
}
.msg_receive{
    padding-left:0;
    margin-left:0;
}
.msg_sent{
    padding-bottom:20px !important;
    margin-right:0;
}
.messages {
  background: white;
  padding: 10px;
  border-radius: 2px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
  max-width:100%;
}
.messages > p {
    font-size: 13px;
    margin: 0 0 0.2rem 0;
  }
.messages > time {
    font-size: 11px;
    color: #ccc;
}
.msg_container {
    padding: 10px;
    overflow: hidden;
    display: flex;
}
#messengerModule img {
    display: block;
    width: 100%;
}
.avatar {
    position: relative;
}
.base_receive > .avatar:after {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    width: 0;
    height: 0;
    border: 5px solid #FFF;
    border-left-color: rgba(0, 0, 0, 0);
    border-bottom-color: rgba(0, 0, 0, 0);
}

.base_sent {
  justify-content: flex-end;
  align-items: flex-end;
}
.base_sent > .avatar:after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 0;
    border: 5px solid white;
    border-right-color: transparent;
    border-top-color: transparent;
    box-shadow: 1px 1px 2px rgba(black, 0.2); // not quite perfect but close
}

.msg_sent > time{
    float: right;
}



.msg_container_base::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar
{
    width: 12px;
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #555;
}

.btn-group.dropup{
    position:fixed;
    right:800px;
    bottom:0;
    z-index: 1;
}
</style>
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
    </div>
    
    <div class="btn-group dropup">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <span class="glyphicon glyphicon-cog"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><a href="#" id="new_chat"><span class="glyphicon glyphicon-plus"></span> Novo</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-list"></span> Ver outras</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-remove"></span> Fechar Tudo</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-eye-close"></span> Invisivel</a></li>
        </ul>
    </div>
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
    	//alert('hi');
    	//console.log('hi');
    		var href = $(this).attr('href');//a태그의 주소값을 가져옴
    		var regTmp = /=\d+/g;
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
   $(document).on('click', '.panel-heading span.icon_minim', function (e) {
	    var $this = $(this);
	    if (!$this.hasClass('panel-collapsed')) {
	        $this.parents('.panel').find('.panel-body').slideUp();
	        $this.addClass('panel-collapsed');
	        $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
	    } else {
	        $this.parents('.panel').find('.panel-body').slideDown();
	        $this.removeClass('panel-collapsed');
	        $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
	    }
	});
	$(document).on('focus', '.panel-footer input.chat_input', function (e) {
	    var $this = $(this);
	    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
	        $this.parents('.panel').find('.panel-body').slideDown();
	        $('#minim_chat_window').removeClass('panel-collapsed');
	        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
	    }
	});
	$(document).on('click', '#new_chat', function (e) {
	    var size = $( ".chat-window:last-child" ).css("margin-left");
	     size_total = parseInt(size) + 400;
	    alert(size_total);
	    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
	    clone.css("margin-left", size_total);
	});
	$(document).on('click', '.icon_close', function (e) {
	    //$(this).parent().parent().parent().parent().remove();
	    $( "#chat_window_1" ).remove();
	});


   </script>
      <script type="text/javascript">
/*         var textarea = document.getElementById("messageWindow"); */
        var textarea = $('.panel-body');
        var webSocket = new WebSocket('ws://localhost:8081/kosta111MidProject/broadcasting');
        var inputMessage = $('#btn-input');
        var sender = $('#wsSender').val();
        var projectId = $('#wsProjectId').val();
        var msg_startIndex = 1;
        var msg_lastMsgId = 0;
        var loadMsgCnt = 0;
        //소켓을 열면 ajax로 지난 대화 8개를 불러온다.
        fn_getMaxMsgId();
        
        function fn_getMaxMsgId(){
        	$.ajax({
        		url : 'getMaxMsgId.do',
        		method : 'post',
        		dataType : 'json',
        		success : function(data){
        			if(data!=null){
	        			msg_lastMsgId = data[0].maxId;
        			}
        			fn_loadMessege();
        		}
        	});
        }
        
        function fn_loadMessege(){
	        $.ajax({
	        	url : 'loadMessege.do',
	        	data : {
	        		p_id : projectId,
	        		msg_startIndex : msg_startIndex,
	        		msg_lastMsgId : msg_lastMsgId 
	        	},
	        	dataType : 'json',
	        	method : 'post',
	        	success : function(data){
	        		$('#prevMsgLoad').remove();
	        		//console.log(data);
	        		var in_msg_lastMsgId = [];
	        		for(var i=0; i<data.length; i++){
	        			in_msg_lastMsgId.push(data[i].id);
	        			
	        			var prevMsgSender = data[i].sender;
	        			var prevMsgContent = data[i].content;
	        			//console.log("이전대화 sender :"+data[i].sender);
	        			//console.log("이전대화 content :"+data[i].content);
	        			if(prevMsgSender==sender){
	        				//console.log("이전대화가 보낸이와 일치");
	        				textarea.prepend(makeMessegeHtml(prevMsgContent,"sent"));
	        				textarea.scrollTop(8*75);
	        			} else {
	        				textarea.prepend(makeMessegeHtml(prevMsgContent,"receive"));
	        				textarea.scrollTop(8*75);
	        			}
	        		}
	        		//가장 작은 id값 검색
	        		//배열이 0이 아니면 입력
	        		if(in_msg_lastMsgId.length!=0){
	        		msg_lastMsgId = Math.min.apply(null, in_msg_lastMsgId);
	        		}
	        		
	        		textarea.prepend('<div id="prevMsgLoad" class="row "><div class="col-md-12 col-xs-12"><div class="messages"><p>지난대화 불러오기</p></div></div></div>');
	        		//메시지 로드 횟수 증가
	        		loadMsgCnt+=1;
	        		msg_startIndex = loadMsgCnt*8;
	        	}
	        });
        	
        }
        function makeMessegeHtml(msg,type){
        	var getMessegeHtml ="";
        	var avatorImageHtml = '<div class="col-md-2 col-xs-2 avatar"><img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive "></div>';
        	if(type=="receive"){
		        getMessegeHtml += '<div class="row msg_container base_receive">';
        		getMessegeHtml += avatorImageHtml;
        	} else if(type=="sent"){
		        getMessegeHtml += '<div class="row msg_container base_sent">';
        		
        	}
	        
	        getMessegeHtml += '<div class="col-md-10 col-xs-10">';
	        if(type=="receive"){
		        getMessegeHtml += '<div class="messages msg_receive"><p>';
	        } else if(type=="sent"){
		        getMessegeHtml += '<div class="messages msg_sent"><p>';
        	}
	        getMessegeHtml += msg;
	        getMessegeHtml += '</p><time datetime="2009-11-13T20:00">Timothy • 51 min</time>';
	        getMessegeHtml += '</div>';
	        getMessegeHtml += '</div>';
	        if(type=="sent"){
	        	getMessegeHtml += avatorImageHtml;
	        }
	        
	        getMessegeHtml += '</div>';
        	return getMessegeHtml;
        }
        
        $(textarea).on('click','#prevMsgLoad',function(){
        	//console.log('hi');
        	fn_loadMessege();
        });
        
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
	        textarea.append(makeMessegeHtml(event.data,"receive"));
	        textarea.scrollTop($('.msg_container').length*75);
	    }
	    function onOpen(event) {
	        textarea.value += "연결 성공\n";
	    }
	    function onError(event) {
	      alert(event.data);
	    }
	    function send() {
	        console.log(inputMessage.val());
	        textarea.append(makeMessegeHtml(inputMessage.val(),"sent"));
			//하나의 높이 = 75
			//갯수 * 높이로 스크롤 값 고정
			textarea.scrollTop($('.msg_container').length*75);
	        webSocket.send('{"sender" : "'+sender+'", "msg" : "'+inputMessage.val()+'", "projectId" : "'+projectId+'"}');
	        inputMessage.val("");
	    }
	    inputMessage.keypress(function(key){
	    	if (key.keyCode == 13) {
	    		send();
            }
	    });
  </script>

</html>
