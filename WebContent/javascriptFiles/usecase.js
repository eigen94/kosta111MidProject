//입력단 스크립트
$(function() {
	count = 1;
	// 콜릭하면 내용을 지운다.
	$('input').on('click', function() {
		$(this).val('');
	});

	// select창 1줄 추가
	function addRow() {
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('selector').innerHTML;
		document.getElementById('newField').appendChild(div);
		count++;
	}

	// 삭제
	function deleteRow(obj) {
		document.getElementById('newField').removeChild(obj.parentNode);
		count--;
	}
	
	// 저장
	function save() {
		var jsonArray = new Array();
		var jsonObj = new Object();
		
		//개요와 엑터
		jsonObj.outline = $('.top_position textarea').eq(0).val();
		jsonObj.actor = $('.top_position textarea').eq(1).val();
		
		//반복문 시작
		for(var i=0;i<count;i++){
			/*if($('select').eq(i).val() == 'outline'){
			}else if($('select').eq(i).val() == 'actor'){
				jsonObj.actor = $('.mid_position input').eq(i).val();
			}else*/
			if($('select').eq(i).val() == 'conditionF'){
				jsonObj.conditionF = $('.mid_position textarea').eq(i).val();
			}else if($('select').eq(i).val() == 'event'){
			jsonObj.event = $('.mid_position textarea').eq(i).val();
			}else if($('select').eq(i).val() == 'eventDetail'){
				jsonObj.eventDetail = $('.mid_position textarea').eq(i).val();
			}else if($('select').eq(i).val() == 'conditionB'){
			jsonObj.conditionB = $('.mid_position textarea').eq(i).val();
			}else if($('select').eq(i).val() == 'claim'){
				jsonObj.claim = $('.mid_position textarea').eq(i).val();
			}
		}		//반복문 종료
		
		jsonArray.push(jsonObj);
		
		var finalJsonObj = JSON.stringify(jsonObj);
		
		$.ajax({
			type:"post",
			url:"useCaseInsert.do",
			data:{
				json:finalJsonObj
			},
			dataType: "text",
			success: function(data){
			},error: function(data){
				alert("실패");
			}
		})
	}

	// +버튼->addRow()
	$(document).on('click', '#plus_btn button', function() {
		addRow();
	});
	// -버튼 -> deleteRow()
	$(document).on('click', '#newField #minus_btn', function() {
		deleteRow(this);
	});

	// 저장->save()
	$('.save button').on('click', function() {
//		save();
		location.href= "useCaseList.do?check_id="+ $('.package input').val()
	});
	
	//미리보기
	$('.active a').on('click', function(){
		
		var str = new Array();
		
		/*str.push($('.modal-body textarea').eq(0).val());
		str.push($('.modal-body textarea').eq(1).val());*/
		
		for(var i=0;i<10;i++){
			str.push($('.modal-body textarea').eq(i).val());
		}
		/*for(var i=0;i<count;i++){
			if($('select').eq(i).val() == 'conditionF'){
				jsonObj.conditionF = $('.mid_position textarea').eq(i).val();
			}else if($('select').eq(i).val() == 'event'){
			jsonObj.event = $('.mid_position textarea').eq(i).val();
			}else if($('select').eq(i).val() == 'conditionB'){
			jsonObj.conditionB = $('.mid_position textarea').eq(i).val();
			}else if($('select').eq(i).val() == 'claim'){
				jsonObj.claim = $('.mid_position textarea').eq(i).val();
			}
		}*/
		
		
		alert(str[0] + ", " + str[1] + ", " + str[3]);
		alert(str[4] + ", " + str[5] + ", " + str[6]);
	})
	
	
	
	
});
/////////////////////////////////////////////////////////////

//출력단 쿼리
$(function() {
	$('.package button').on('click', function(){
		location.href= "useCaseList.do?check_id="+ $('.package input').val()
	});
	
	//도움말
	$('.advice button').on('click', function(){
		
		
		
	})
	
	
	
	
});
