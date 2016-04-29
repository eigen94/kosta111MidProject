$(function(){
    	
		var checkList = [];//불러올 체크리스트들을 담을 배열
		var projectIdFromUri = location.search; //주소줄에서 get요청 값 추출
		var regGetProjectId = /\d/g; //추출한 값에서 숫자만 추출할 정규표현식
		var projectId = regGetProjectId.exec(projectIdFromUri)[0]; //추출결과
    	
    	//초기세팅
    	getCheckListAjax();//리스트가져오기
    	setInputFormDate();//모달 인풋폼에 날짜 변경
    	drawCalendar();//달력그리기
    	
    	$('#checkList').on('click','.checkListDelBtn',function(event){//체크리스트 삭제 버튼시 이벤트
    		event.preventDefault();
    		var href = $(this).attr('href');//a태그의 주소값을 가져옴
    		var regTmp = /check_id=\d+/g;
    		var regTmp2 = /projectid=\d+/g;
    		var check_id = regTmp.exec(href)[0].replace("check_id=","");
    		var projeck_id = regTmp2.exec(href)[0].replace("projectid=","");
    		$.ajax({
    			url : 'checkDelete.do',
    			method : 'post',
    			data : {
    				check_id : check_id,
    				check_projectid : projeck_id
    			},
    			success : function(){
    				getCheckListAjax();
    			}
    		});
    	});
    	
    	$('#createCheckListBtn').on('click',function(event){//체크리스트 생성 이벤트
    		//get FormData
    		event.preventDefault();
    		var sendCheckListData = {
    				check_name : $('#checkListName').val(),
    				check_start : $('#checkListStartDate').val(),
    				check_end : $('#checkListEndDate').val(),
    				check_projectId : $('#checkListProjectId').val(),
    				check_type : $('#checkListCheckType').val()
    		}
    		console.log(sendCheckListData);
    		//reset FormData
    		
    		//send FormData to DB
    		
    		$.ajax({
    			url : 'CheckCreate.do',
    			method : 'post',
    			data : sendCheckListData,
    			success : function(){
    				console.log('ok');
    		//get checkList data from DB
	    		getCheckListAjax();
    		
    			},//end of success
    			error : function(e){
    				console.log(e);
    			}
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
	});
	
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
	e.preventDefault();
    $( "#chat_window_1" ).hide();
});
$(document).on('click', '#messengerBtn', function (e) {
	e.preventDefault();
	$( "#chat_window_1" ).show();
});


///////////////
//메신저 로직부분//
///////////////
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

//메신저용 마지막 메세지 아이디구하는 함수
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

//메신저 메세지 로딩 함수
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
    		var in_msg_lastMsgId = [];
    		for(var i=0; i<data.length; i++){
    			in_msg_lastMsgId.push(data[i].id);
    			
    			var prevMsgSender = data[i].sender;
    			var prevMsgContent = data[i].content;
    			if(prevMsgSender==sender){
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

//메세지를 메신저에 표시하기 위한 html작성 함수
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
//    textarea.value += "연결 성공\n";
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