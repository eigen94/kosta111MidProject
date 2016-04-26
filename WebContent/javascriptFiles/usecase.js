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
		alert("asd");
		document.getElementById('newField').removeChild('div');
		count--;
	}
	
	// 저장
	function save() {
		var jsonArray = new Array();
		var jsonObj = new Object();
		
		//반복문 시작
		for(var i=0;i<count;i++){
			if($('select').eq(i).val() == 'outline'){
				jsonObj.outline = $('.mid_position input').eq(i).val();
			}else if($('select').eq(i).val() == 'actor'){
				jsonObj.actor = $('.mid_position input').eq(i).val();
			}else if($('select').eq(i).val() == 'conditionF'){
				jsonObj.conditionF = $('.mid_position input').eq(i).val();
			}else if($('select').eq(i).val() == 'event'){
			jsonObj.event = $('.mid_position input').eq(i).val();
			}else if($('select').eq(i).val() == 'eventDetail'){
				jsonObj.eventDetail = $('.mid_position input').eq(i).val();
			}else if($('select').eq(i).val() == 'conditionB'){
			jsonObj.conditionB = $('.mid_position input').eq(i).val();
			}else if($('select').eq(i).val() == 'claim'){
				jsonObj.claim = $('.mid_position input').eq(i).val();
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
	$(document).on('click', '#newField button', function() {
		deleteRow(this);
	});

	// 저장->save()
	$('.save button').on('click', function() {
//		save();
		location.href= "useCaseList.do?check_id="+ $('.package input').val()
	});
	
	//도움말
	$('.advice button').on('click', function(){
		
		
		
	})
	
	
	
	
});